import 'package:flutter/material.dart';
import 'package:hci_googlemap/widgets/buttons/CircleIconButton.dart';

class SearchBar extends StatefulWidget{
  const SearchBar(
      {required this.sendText,
        Key? key})
      : super(key: key);
  final Function(String) sendText;

  @override
  State createState() => SearchBarState();
}

class SearchBarState extends State<SearchBar> {
  bool isTyping = false;
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if(controller.text.isNotEmpty && !isTyping){
        setState(() {
          isTyping = true;
        });
      }
      else if(controller.text.isEmpty && isTyping){
        setState(() {
          isTyping = false;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.center,
        children: [
          TextField(
            enabled: true,
            autofocus: true,
            controller: controller,
            textInputAction: TextInputAction.go,
            onSubmitted: widget.sendText,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "여기서 검색",
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding:
              EdgeInsets.only(left: 56,right: 96),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
            ),
          ),
          Positioned(
              left: 0,
              child:CircleIconButton(
                iconData: Icons.arrow_back,
                onPressed: (){
                  Navigator.pop(context);
                },
              )
          ),
          Positioned(
              right: 0,
              child: CircleIconButton(
                iconData: isTyping ? Icons.close : Icons.mic,
                onPressed: (){
                  if(isTyping){
                    controller.text = "";
                    widget.sendText("");
                    setState(() {
                      isTyping = false;
                    });
                  }
                },
              )
          ),
        ]);
  }
}
