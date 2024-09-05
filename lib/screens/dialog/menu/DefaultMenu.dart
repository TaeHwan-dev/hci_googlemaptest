import 'package:flutter/material.dart';
import 'package:hci_googlemap/widgets/list/RowProfile.dart';
import 'package:hci_googlemap/widgets/list/RowTextWithIcon.dart';

class DefaultMenu extends StatelessWidget {
  final Function categoryClick;
  const DefaultMenu({Key? key, required this.categoryClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children:[
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                color: Colors.white),
            child: const RowProfile(name: "김한림", email: "hallym2023@gmail.com"),
          ),
          const SizedBox(height: 2,),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
                color: Colors.white),
            child: Column(children:  [
              const RowTextWithIcon(
                text: "즐겨찾기",
                iconData: Icons.bookmark,
              ),
              RowTextWithIcon(
                text: "카테고리 설정",
                iconData: Icons.favorite,
                onPress: categoryClick
              ),
              const RowTextWithIcon(
                text: "후기관리",
                iconData: Icons.star_outline,
              ),
              const RowTextWithIcon(
                text: "설정",
                iconData: Icons.settings_outlined,
              ),
            ],),
          ),
          const SizedBox(height: 8),
          const Text("도움말 및 의견 보내기")
        ]);
  }
}