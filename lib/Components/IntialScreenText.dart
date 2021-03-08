import 'package:flutter/material.dart';

class InitialScreenText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  const InitialScreenText({Key key, this.text, this.size, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.clip,
      style: TextStyle(
          fontSize: size, color: color, decoration: TextDecoration.none),
    );
  }
}
