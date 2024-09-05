
import 'package:flutter/material.dart';
import 'package:hci_googlemap/widgets/buttons/CircleIconButton.dart';

class SearchBefore extends StatelessWidget {
  final Color lightGrey;
  final bool visible;

  SearchBefore({Key? key, required this.lightGrey, required this.visible}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: visible ? 1.0 : 0,
        duration: const Duration(milliseconds: 250),
        child: Column(children: [
          SizedBox(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: 145,
                  child: ListTile(
                    leading: CircleIconButton(
                        onPressed: () {},
                        iconData: Icons.home_filled,
                        fillColor: lightGrey,
                        radius: 38),
                    title: const Text('집'),
                    subtitle: const Text('위치 설정'),
                    minLeadingWidth: 0,
                  ),
                ),
                SizedBox(
                  width: 145,
                  child: ListTile(
                    leading: CircleIconButton(
                        onPressed: () {},
                        iconData: Icons.work,
                        fillColor: lightGrey,
                        radius: 38),
                    title: const Text('직장'),
                    subtitle: const Text('위치 설정'),
                    minLeadingWidth: 0,
                  ),
                ),
                SizedBox(
                  width: 145,
                  child: Align(
                    alignment: Alignment.center,
                    child: ListTile(
                      leading: CircleIconButton(
                          onPressed: () {},
                          iconData: Icons.more_horiz,
                          outlineColor: Colors.black12,
                          radius: 38),
                      title: const Text('더보기'),
                      minLeadingWidth: 0,
                    ),
                  ),
                ),
              ],
            ),
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
                  Text('      최근 검색'),
                  Icon(Icons.arrow_drop_down_sharp),
                ],
              )),
          const Expanded(
              child: Center(
                child: Text(
                  "최근 기록 없음",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ))
        ]));
  }
}