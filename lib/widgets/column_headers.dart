import 'package:flutter/material.dart';

class ColumnHeaders extends StatelessWidget {
  const ColumnHeaders({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Expanded(child: Text('TAREA', style: TextStyle(color: Colors.white))),
        Expanded(child: Text('ESTADO', style: TextStyle(color: Colors.white))),
        Expanded(
          child: Text('ACCIONES', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
