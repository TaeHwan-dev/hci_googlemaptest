import 'package:flutter/material.dart';
import 'package:hci_googlemap/screens/dialog/menu/CategorySetting.dart';
import 'package:hci_googlemap/screens/dialog/menu/DefaultMenu.dart';


class MenuDialog extends StatefulWidget {
  final List<String> categorys;
  final Function(int) categoryClick;
  MenuDialog({Key? key, required this.categorys, required this.categoryClick}): super(key: key);

  @override
  State<MenuDialog> createState() => MenuDialogState();
}

class MenuDialogState extends State<MenuDialog> {
  late DefaultMenu defaultMenu;
  late CategorySetting categorySetting;
  late Widget view;

  @override
  void initState() {
    defaultMenu = DefaultMenu(
      categoryClick: () {
        setState(() {
          view = categorySetting;
        });
      },
    );
    categorySetting = CategorySetting(categorys: widget.categorys,categoryClick: widget.categoryClick);
    view = defaultMenu;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        backgroundColor: const Color(0xFFE7EEF4),
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          if(view == defaultMenu) {
                            Navigator.pop(context);
                          } else{
                            setState(() {
                              view = defaultMenu;
                            });
                          }
                        },
                        icon:Icon( view==defaultMenu ? Icons.close : Icons.arrow_back_rounded)),
                    Flexible(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/google.png",
                          width: 70,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.close,
                          color: Colors.transparent,
                        )),
                  ],
                ),
                Padding(padding: const EdgeInsets.all(8), child: view)
              ]),
            )));
  }
}
