
import 'package:flutter/material.dart';
import 'package:hci_googlemap/widgets/buttons/MyOutlinedButton.dart';

class RowProfile extends StatelessWidget {
  const RowProfile({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);
  final String name;
  final String email;
  @override

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: const Icon(Icons.account_circle_rounded,size: 48,color: Colors.black,),
            horizontalTitleGap: 8,
            minLeadingWidth: 0,
            title: Text(name),
            subtitle: Text(email),
            trailing: const Icon(Icons.expand_circle_down_outlined,color: Colors.black,)
        ),
        Padding(padding: EdgeInsets.only(left: 56),child:
        MyOutlinedButton(
          child: const Text("Google 계정 관리"),
          onPressed: () {},
          outlineColor: Colors.black45,
          padding: EdgeInsets.all(4),
        ),)
      ],
    );

  }
}
