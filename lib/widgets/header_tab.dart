import 'package:flutter/material.dart';

class HeaderTab extends StatelessWidget {
  const HeaderTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text('PENDIENTE', style: TextStyle(color: Colors.white)),
        ),
        Expanded(
          child: Divider(color: Colors.orange, thickness: 2, indent: 10),
        ),
      ],
    );
  }
}
