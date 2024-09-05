import 'package:flutter/material.dart';
import 'package:hci_googlemap/widgets/list/RowProfile.dart';
import 'package:hci_googlemap/widgets/list/RowTextWithIcon.dart';

class CategorySetting extends StatefulWidget {
  final List<String> categorys;
  final Function(int) categoryClick;

  const CategorySetting({Key? key, required this.categorys, required this.categoryClick}) : super(key: key);

  @override
  State createState() => CategorySettingState();
}

class CategorySettingState extends State<CategorySetting> {

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            color: Colors.white),
        child: const Align(
          alignment: Alignment.center,
          child: Text(
            "카테고리 설정",
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
      const SizedBox(
        height: 2,
      ),
      Container(
          padding: const EdgeInsets.all(8),
          height: 380,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
              color: Colors.white),
          child: ListView.builder(
            // Let the ListView know how many items it needs to build.
            itemCount: (widget.categorys.length/2).floor(),
            // Provide a builder function. This is where the magic happens.
            // Convert each item into a widget based on the type of item it is.
            itemBuilder: (context, index) {
              return CheckboxListTile(
                  title: Text(widget.categorys[index*2]),
                  value: widget.categorys[index*2+1] == "true",
                  onChanged: (checked) {
                    widget.categoryClick(index);
                    setState(() {
                      widget.categorys[index*2+1] = checked.toString();
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                );
            },
          ))

    ]);
  }
}
