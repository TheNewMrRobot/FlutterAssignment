import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String buttonName;
  final Color buttonColor;
  final double fontSize;
  final Color textColor;
  final Function onPressed;
  final double buttonHeight;
  final Color borderColor;

  const Buttons({Key key, this.buttonName, this.borderColor,this.buttonColor, this.fontSize,this.textColor, this.onPressed, this.buttonHeight}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0.0,
      height: buttonHeight,
      color:buttonColor,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side:BorderSide(
          color:borderColor,
          width: 1.5
        )
      ),

      child: Text(buttonName,style: TextStyle(
        color: textColor,
        fontSize: fontSize
      ),),
    );
  }
}
