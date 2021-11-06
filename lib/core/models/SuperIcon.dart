import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuperIcon extends StatelessWidget {
  // đường dẫn của icon
  final String iconPath;
  // kích thước của icon
  final double size;
  final Color? color;

  const SuperIcon({
    Key? key,
    required this.iconPath,
    required this.size,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.color == null)
      return Container(
        width: size,
        height: size,
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            fit: BoxFit.contain,
            color: this.color,
          ),
        ),
      );

    return Container(
      width: size,
      height: size,
      child: Center(
        child: SvgPicture.asset(
          iconPath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
