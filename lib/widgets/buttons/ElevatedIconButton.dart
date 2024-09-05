
import 'package:flutter/material.dart';

class ElevatedIconButton extends StatelessWidget {
  const ElevatedIconButton(
      { required this.label,
        this.color,
        this.iconData,
        this.onPressed,
        this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 16)})
  ;
  final Widget label;
  final Color? color;
  final IconData? iconData;
  final Function? onPressed;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed as void Function(),
      icon: Icon(iconData),
      label: label,
      style: ElevatedButton.styleFrom(primary: color, padding: padding),
    );
  }
}