

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowTextWithIcon extends StatelessWidget{
  const RowTextWithIcon({
    Key? key,
    this.iconData,
    required this.text,
    this.image,
    this.onPress,
  }) : super(key: key);

  final IconData? iconData;
  final String text;
  final Function? onPress;
  final Image? image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          const SizedBox(width: 12,height: 42,),
          image ?? Icon(iconData, size: 32,color: Colors.black,),
          const SizedBox(width: 24,),
          Text(text)
        ],
      ),
      onTap: (){
        if(onPress != null)
          onPress!();
      },
    );
  }
}