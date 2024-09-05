import 'package:flutter/material.dart';
import 'package:hci_googlemap/widgets/buttons/CircleIconButton.dart';
import 'package:hci_googlemap/widgets/buttons/ElevatedIconButton.dart';
import 'package:hci_googlemap/widgets/buttons/MyElevatedButton.dart';
import 'package:hci_googlemap/widgets/buttons/MyOutlinedButton.dart';

class ButtonTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Buttons Demo'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleIconButton(
                  iconData: Icons.add,
                  fillColor: Colors.green,
                  iconColor: Colors.white,
                  radius: 48,
                  onPressed: () {},
                ),
                CircleIconButton(
                  iconData: Icons.edit,
                  onPressed: () {},
                ),
                CircleIconButton(
                  iconData: Icons.check,
                  iconColor: Colors.green,
                  outlineColor: Colors.green,
                  onPressed: () {},
                )
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyOutlinedButton(
                  child: const Text("Outlined Button"),
                  onPressed: () {},
                  outlineColor: Colors.blueGrey,
                ),
                MyElevatedButton(
                  child: const Text("Elevated Button"),
                  color: Colors.blueGrey,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 32),
            const SizedBox(height: 6),
            ElevatedIconButton(
              label: const Text("Icon With button"),
              iconData: Icons.check,
              color: Colors.lightGreen,
              onPressed: () {},
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleIconButton(
                  iconData: Icons.warning_amber_outlined,
                  fillColor: Colors.amber,
                  iconColor: Colors.white,
                  onPressed: () {},
                  radius: 32,
                ),
                CircleIconButton(
                  iconData: Icons.new_releases_outlined,
                  fillColor: Colors.blue,
                  iconColor: Colors.white,
                  onPressed: () {},
                  notificationCount: 3,
                ),
                CircleIconButton(
                  iconData: Icons.messenger_outline_sharp,
                  fillColor: Colors.green,
                  iconColor: Colors.white,
                  onPressed: () {},
                  radius: 64,
                  notificationCount: 5,
                ),
                CircleIconButton(
                  iconData: Icons.notifications,
                  fillColor: Colors.amber,
                  iconColor: Colors.white,
                  onPressed: () {},
                  radius: 80,
                  notificationCount: 7,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
