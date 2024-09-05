import 'package:flutter/material.dart';
import 'package:hci_googlemap/screens/Search/SearchAfter.dart';
import 'package:hci_googlemap/screens/Search/SearchBefore.dart';
import 'package:hci_googlemap/widgets/buttons/CircleIconButton.dart';
import 'package:hci_googlemap/widgets/searchBar/SearchBar.dart';

class Search extends StatefulWidget {
  bool complete = false;

  @override
  State<StatefulWidget> createState() => SearchState();
}

class SearchState extends State<Search> {
  final lightGrey = const Color(0xFFF0F0F0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 48, left: 24, right: 24),
                child: SearchBar(
                  sendText: (text) {
                    setState(() {
                      if(text.isEmpty){
                        widget.complete = false;
                      }else{
                        widget.complete = true;
                      }
                    });
                  },
                )),
            Expanded(
                child: Stack(
              children: [
                // 입력전, 최근기록
                SearchBefore(lightGrey: lightGrey, visible: !widget.complete),
                SearchAfter(lightGrey: lightGrey, visible: widget.complete)
              ],
            ))
          ],
        ));
  }
}
