import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final heigt;
  final width;
  final icon;
  final color;
  final depth;
  final spread;
  final curveType;
  final double borderRadius;
  final customBorderRadius;
  final child;
  final iconColor;
  final iconSize;

  final void Function()? onTap;
  const MyButton(
      {super.key,
      this.heigt,
      this.width,
      this.icon,
      this.color,
      this.depth,
      this.spread,
      this.curveType,
      required this.borderRadius,
      this.child,
      this.customBorderRadius,
      this.onTap,
      this.iconColor,
      this.iconSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClayContainer(
            height: heigt,
            width: width,
            customBorderRadius: customBorderRadius,
            borderRadius: borderRadius,
            color: color,
            depth: depth,
            spread: spread,
            curveType: curveType,
            child: Icon(
              icon,
              color: iconColor,
              size: iconSize,
            )),
      ),
    );
  }
}
