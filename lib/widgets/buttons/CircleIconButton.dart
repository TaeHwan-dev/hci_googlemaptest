

import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton(
      {this.fillColor = Colors.transparent,
        this.iconData,
        this.iconColor = Colors.black,
        this.outlineColor = Colors.transparent,
        this.notificationFillColor = Colors.red,
        this.notificationCount,
        required this.onPressed,
        this.radius = 48.0});

  final IconData? iconData;
  final Color fillColor;
  final Color outlineColor;
  final Color iconColor;
  final Color notificationFillColor;
  final int? notificationCount;
  final Function onPressed;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: radius,
          height: radius,
          decoration: ShapeDecoration(
            color: fillColor,
            shape: CircleBorder(side: BorderSide(color: outlineColor,width: 1.5)),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            splashRadius: radius / 2,
            iconSize: radius / 2,
            icon: Icon(iconData, color: iconColor),
            splashColor: iconColor.withOpacity(.4),
            onPressed: onPressed as void Function(),
          ),
        ),
        if (notificationCount != null) ...[
          Positioned(
            top: radius / -14,
            right: radius / -14,
            child: Container(
              width: radius / 2.2,
              height: radius / 2.2,
              decoration: ShapeDecoration(
                color: notificationFillColor,
                shape: const CircleBorder(),
              ),
              child: Center(
                child: Text(
                  notificationCount.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: radius / 4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}