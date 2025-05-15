import 'package:flutter/material.dart';

class TaskRow extends StatelessWidget {
  final String task;

  const TaskRow({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          // TAREA
          Expanded(
            child: Row(
              children: [
                Icon(Icons.check_box, color: Colors.deepPurpleAccent),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    task,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          // ESTADO
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text('PENDIENTE', style: TextStyle(color: Colors.white)),
            ),
          ),
          // ACCIONES
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
