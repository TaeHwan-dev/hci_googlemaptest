import 'package:flutter/material.dart';
import 'package:hci_googlemap/screens/dialog/menu/MenuDialog.dart';
import 'package:hci_googlemap/widgets/buttons/CircleIconButton.dart';

class SearchBarLayout extends StatelessWidget {
  const SearchBarLayout(
      {required this.text,
        required this.leftWidget,
        required this.categorys,
        required this.categoryClick,
      Key? key})
      : super(key: key);

  final String text;
  final Widget leftWidget;
  final List<String> categorys;
  final Function(int) categoryClick;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
        children: [
          InkWell(child: TextField(
            enabled: false,
            autofocus: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: text,
              hintStyle: const TextStyle(color: Colors.grey),
              contentPadding:
              const EdgeInsets.only(left: 56,right: 96),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
            )),onTap: (){
            Navigator.pushNamed(context, '/search');
            },),
          Positioned(
              left: 0,
              child:leftWidget
          ),
           Positioned(
              right: 48,
              child:CircleIconButton(
                iconData: Icons.mic,
                onPressed: (){
                  
                },
              )
          ),
          Positioned(
              right: 0,
              child: CircleIconButton(
                iconData: Icons.menu,
                onPressed: (){
                  showDialog(context: context, builder: (BuildContext context){
                    return MenuDialog(categorys: categorys,categoryClick: categoryClick,);
                  });
                },
              )
          ),
    ]);
  }
}
