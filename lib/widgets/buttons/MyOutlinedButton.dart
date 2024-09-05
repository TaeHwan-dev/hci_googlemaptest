
import 'package:flutter/material.dart';

class MyOutlinedButton extends StatelessWidget {
  const MyOutlinedButton(
      {this.child,
        this.textColor,
        this.outlineColor,
        this.onPressed,
        this.borderRadius = 6,
        this.padding = const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
      });
  final Widget? child;
  final Function? onPressed;
  final double borderRadius;
  final Color? outlineColor;
  final Color? textColor;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: padding,
        textStyle: TextStyle(color: currentTheme.primaryColor),
        side: BorderSide(color: outlineColor ?? currentTheme.primaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        primary: textColor ?? outlineColor ?? currentTheme.primaryColor,
      ),
      onPressed: (){if(onPressed != null) onPressed!();},
      child: child,
    );
  }
}