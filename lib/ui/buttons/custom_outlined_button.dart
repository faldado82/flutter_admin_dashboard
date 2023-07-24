import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  final bool isFilled;
  final bool isTextWhite;

  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color = Colors.blueAccent,
    this.isFilled = false, 
    this.isTextWhite = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
          side: MaterialStateProperty.all(BorderSide(color: color)),
          backgroundColor:
              MaterialStateProperty.all(isFilled ? color.withOpacity(0.3) : Colors.transparent),
        ),
        onPressed: () => onPressed(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          child: Text(text,
              style: TextStyle(
                fontSize: 20,
                color: isTextWhite ? Colors.white : color,
              )),
        ));
  }
}
