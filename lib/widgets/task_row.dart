import 'package:flutter/material.dart';

class TaskRow extends StatelessWidget {
  final String task;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const TaskRow({super.key, required this.task, this.onEdit, this.onDelete});

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
                const Icon(Icons.check_box, color: Colors.deepPurpleAccent),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    task,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          // ESTADO
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'PENDIENTE',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          // ACCIONES
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: onEdit,
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: onDelete,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
