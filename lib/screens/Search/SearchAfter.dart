import 'package:flutter/material.dart';
import 'package:hci_googlemap/data/StoreInfo.dart';
import 'package:hci_googlemap/widgets/buttons/CircleIconButton.dart';
import 'package:hci_googlemap/widgets/buttons/MyOutlinedButton.dart';
import 'package:hci_googlemap/widgets/list/RowStoreInfo.dart';

class SearchAfter extends StatelessWidget {
  final Color lightGrey;
  final bool visible;

  SearchAfter({Key? key, required this.lightGrey, required this.visible})
      : super(key: key);

  final List<StoreInfo> storeList = [
    StoreInfo(
      name: "마미터치",
      category: "패스트푸드",
      star: 3.5,
      length: 223,
      isOpen: true,
      locate: "강원도 춘천시",
    ),
    StoreInfo(
      name: "밥두끼",
      category: "한식집",
      star: 4.8,
      length: 473,
      isOpen: true,
      locate: "강원도 춘천시",
    ),
    StoreInfo(
      name: "영우야식",
      category: "한식집",
      star: 4.0,
      length: 551,
      isOpen: false,
      locate: "강원도 춘천시",
    ),
    StoreInfo(
      name: "하린",
      category: "양식집",
      star: 3.9,
      length: 782,
      isOpen: true,
      locate: "강원도 춘천시",
    ),
    StoreInfo(
      name: "친스키진",
      category: "양식집",
      star: 4.3,
      length: 123,
      isOpen: true,
      locate: "강원도 춘천시",
    ),
    StoreInfo(
      name: "병전순대",
      category: "한식집",
      star: 4.8,
      length: 643,
      isOpen: false,
      locate: "강원도 춘천시",
    ),
    StoreInfo(
      name: "팔오 왕돈까스",
      category: "한식집",
      star: 3.8,
      length: 451,
      isOpen: false,
      locate: "강원도 춘천시",
    ),
    StoreInfo(
      name: "독스마스",
      category: "한식집",
      star: 3.9,
      length: 462,
      isOpen: true,
      locate: "강원도 춘천시",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: visible ? 1.0 : 0,
        duration: const Duration(milliseconds: 250),
        child: Column(children: [
          Container(
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: IconButton(
                              onPressed: () {},
                              icon: Image.asset("assets/equalizer.png"))),
                  const Expanded(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: MyOutlinedButton(
                            outlineColor: Colors.black12,
                            textColor: Colors.black,
                            padding: EdgeInsets.symmetric(
                                vertical: 3, horizontal: 8),
                            child: Text("정렬 기준"),
                          ))),
                  const Expanded(
                      child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 6),
                          child: MyOutlinedButton(
                            outlineColor: Colors.black12,
                            textColor: Colors.black,
                            padding: EdgeInsets.symmetric(
                                vertical: 3, horizontal: 8),
                            child: Text("영업중"),
                          ))),
                  const Expanded(
                      child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 6),
                          child: MyOutlinedButton(
                            outlineColor: Colors.black12,
                            textColor: Colors.black,
                            padding: EdgeInsets.symmetric(
                                vertical: 3, horizontal: 8),
                            child: Text("평점"),
                          ))),
                  const Expanded(
                      child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 6),
                    child: Text(
                      "필터 더보기",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )),
                ],
              )

              ),
          Container(
            width: double.infinity,
            height: 2,
            color: lightGrey,
          ),
          Align(
              alignment: Alignment.centerLeft,
              heightFactor: 1.2,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Text('      거리순'),
                  Icon(Icons.arrow_drop_down_sharp),
                ],
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ListView.separated(
                itemCount: storeList.length,
                itemBuilder: (BuildContext context, int index) {
                  return RowStoreInfo(
                      storeInfo: storeList[index],
                      pathClick: () {
                        Navigator.pushNamed(context, '/pathFinding',
                            arguments: storeList[index].name);
                      });
                },
                separatorBuilder: (BuildContext context, int index) => Divider(
                  thickness: 2.5,
                  height: 30,
                  color: lightGrey,
                ),
              ),
            ),
          )
        ]));
  }
}
