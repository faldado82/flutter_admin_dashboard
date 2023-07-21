import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function onPress;
  final String text;
  final IconData icon;
  final Color color;
  final bool isFilled;

  const CustomIconButton({
    super.key,
    required this.onPress,
    required this.text,
    required this.icon,
    this.color = Colors.blue,
    this.isFilled = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(StadiumBorder()),
        backgroundColor: MaterialStateProperty.all(
          Colors.indigo.withOpacity(0.5),
        ),
      ),
      onPressed: () => onPress,
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          Text(text, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
