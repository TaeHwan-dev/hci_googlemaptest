import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hci_googlemap/data/StoreInfo.dart';
import 'package:hci_googlemap/widgets/buttons/CircleIconButton.dart';

class RowStoreInfo extends StatelessWidget{
  const RowStoreInfo({
    Key? key,
    required this.storeInfo,
    required this.pathClick,
  }) : super(key: key);

  final StoreInfo storeInfo;
  final Function pathClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Column(
            children: [
              Row(children: [
                Text(storeInfo.name, style: const TextStyle(fontSize: 22, color: Colors.black)),
                const SizedBox(width: 12),
                Text(storeInfo.category, style: const TextStyle(fontSize: 14, color: Colors.grey)),
              ],),
              const SizedBox(height: 4  ),
              Row(children: [
                const SizedBox(width: 4),
                Text(storeInfo.star.toStringAsFixed(1), style: const TextStyle(fontSize: 18)),
                const SizedBox(width: 8),
                DrawStar(score: storeInfo.star),
                const SizedBox(width: 6),
                Text(storeInfo.length.toString()+"m", style: const TextStyle(fontSize: 18))
              ]),
              Row(children: [
                const SizedBox(width: 4),
                Text(storeInfo.isOpen ? "영업중" : "영업종료", style: const TextStyle(fontSize: 14,color: Colors.redAccent)),
                const SizedBox(width: 12),
                Text(storeInfo.locate, style: const TextStyle(fontSize: 14))
              ],),
            ],
          ),
        ),
        CircleIconButton(
          iconData: Icons.call,
          outlineColor: Colors.grey,
          radius: 48,
          onPressed: (){},
        ),
        const SizedBox(width: 8),
        CircleIconButton(
          iconData: Icons.shortcut,
          radius: 48,
          fillColor: const Color(0xFF87ceeb),
          onPressed: pathClick,
        ),
      ],
    );
  }
}

class DrawStar extends StatelessWidget{
  const DrawStar({super.key, required this.score});
  final double score;

  @override
  Widget build(BuildContext context) {
    List<Icon> icons = [];
    for (int i = 0; i < 5; i++) {
      if(score < i){
        icons.add(_createIcon(Icons.star_border_outlined));
      }else if(i < score.floor()){
        icons.add(_createIcon(Icons.star));
      }else{
        icons.add(_createIcon(Icons.star_half_outlined));
      }
    }
    return Row(children: icons);
  }
  Icon _createIcon(IconData iconData){
    return Icon(iconData, size: 24,color: Colors.black,);
  }
}