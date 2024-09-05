import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hci_googlemap/widgets/buttons/CircleIconButton.dart';
import 'package:hci_googlemap/widgets/buttons/MyElevatedButton.dart';
import 'package:hci_googlemap/widgets/searchBar/SearchBarLayout.dart';

class HomeObject extends StatefulWidget {
  HomeObject(
      {required this.visible,
      required this.zoomEvent,
        required this.cctvEvent,
        required this.locatEvent});

  final bool visible;
  final Function(bool) zoomEvent;
  final Function cctvEvent;
  final Function locatEvent;


  @override
  State<HomeObject> createState() => HomeObjectState();
}

class HomeObjectState extends State<HomeObject> {
  bool cctvOn = false;
  List<String> categorys = [
    "반려동물","",
    "키즈","",
    "음식점","true",
    "카페","",
    "쇼핑","true",
    "호텔","true",
    "주유소","true",
    "식료품","true",
    "의류","true",
    "병원","true",
    "주유소","true",
    "호텔","true"
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> categoryView = [];
    for(int i=0; i< categorys.length; i+=2){
      if(categorys[i+1] == "true"){
        categoryView.add(MyElevatedButton(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          borderRadius: 12,
          color: Colors.white,
          onPressed: () {},
          child: Text(
            categorys[i],
            style: const TextStyle(color: Colors.black),
          ),
        ));
      }
    }

    return AnimatedOpacity(
        opacity: widget.visible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 250),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
                padding: const EdgeInsets.all(24),
                child: SearchBarLayout(
                  text: "주유소, ATM 찾기",
                  categorys: categorys,
                  categoryClick: (index){
                    setState(() {

                    });
                  },
                  leftWidget: IconButton(
                    icon: Image.asset(
                      'assets/cctv.png',
                      color: cctvOn ? Colors.blueAccent : Colors.black,
                      width: 24,
                      height: 24,
                    ),
                    onPressed: () {
                      widget.cctvEvent();
                      setState(() {
                        cctvOn = !cctvOn;
                      });
                    },
                  ),
                )),
            SizedBox(
              height: 36,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(vertical: 4),
                itemCount: categoryView.length,
                itemBuilder: (context, index) => categoryView[index],
                separatorBuilder: (context, index) => const SizedBox(width: 8,),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
                padding: const EdgeInsets.only(right: 24),
                child: CircleIconButton(
                    iconData: Icons.layers,
                    fillColor: Colors.white,
                    radius: 40,
                    onPressed: () {})),
            Flexible(
              flex: 1,
              child: Container(),
            ),

            Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  Transform.rotate(
                      angle: -45,
                      child: CircleIconButton(
                          iconData: Icons.send,
                          fillColor: Colors.white,
                          radius: 48,
                          onPressed: widget.locatEvent)),
                  const SizedBox(
                    height: 12,
                  ),
                  CircleIconButton(
                      iconData: Icons.shortcut,
                      fillColor: Colors.white,
                      radius: 48,
                      onPressed: () {
                        Navigator.pushNamed(context, '/pathFinding',
                            arguments: "");
                      }),
                  const SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      widget.zoomEvent(true);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: const EdgeInsets.all(5),
                        minimumSize: const Size.square(32),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(24))),
                        elevation: 0),
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 32,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      widget.zoomEvent(false);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: const EdgeInsets.all(5),
                        minimumSize: const Size.square(32),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(24))),
                        elevation: 0),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.black,
                      size: 32,
                    ),
                  ),
                ],
              )
            ),
          ],
        ));
  }
}
