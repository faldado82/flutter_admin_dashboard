import 'package:flutter/material.dart';

class NotificationsIndicator extends StatelessWidget {
  const NotificationsIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          const Icon(Icons.notifications_none_outlined,
              color: Colors.grey, size: 35),
          Positioned(
            right: 2,
            child: Container(
              width: 7,
              height: 7,
              decoration: buildBoxDecoration(),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      color: Colors.red, borderRadius: BorderRadius.circular(100));
}
