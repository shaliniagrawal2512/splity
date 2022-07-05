import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  const Box(
      {Key? key,
      required this.color,
      required this.width,
      required this.height,
      this.icon,
      required this.image,
      required this.radius,
      required this.blend})
      : super(key: key);
  final Color color;
  final double width;
  final double height;
  final IconData? icon;
  final String image;
  final double radius;
  final BlendMode blend;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 40,
      child: Container(
          width: width,
          height: height,
          child: Icon(icon, size: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            image: DecorationImage(
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(color, blend),
              image: AssetImage(image),
            ),
          )),
    );
  }
}
