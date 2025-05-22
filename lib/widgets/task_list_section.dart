import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'task_row.dart';

class TaskListSection extends StatefulWidget {
  final List<String> initialTasks;

  const TaskListSection({super.key, required this.initialTasks});

  @override
  _TaskListSectionState createState() => _TaskListSectionState();
}

class _TaskListSectionState extends State<TaskListSection> {
  late List<String> tasks;

  @override
  void initState() {
    super.initState();
    tasks = List.from(widget.initialTasks);
  }

  void _addTask() {
    TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Agregar nueva tarea'),
          content: TextField(
            autofocus: true,
            controller: controller,
            decoration: const InputDecoration(hintText: 'Escribe la tarea'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                String newTask = controller.text.trim();
                if (newTask.isNotEmpty) {
                  setState(() {
                    tasks.add(newTask);
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Agregar'),
            ),
          ],
        );
      },
    );
  }

  void _editTask(int index) {
    TextEditingController controller = TextEditingController(
      text: tasks[index],
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar tarea'),
          content: TextField(
            autofocus: true,
            controller: controller,
            decoration: const InputDecoration(hintText: 'Editar tarea'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                String editedTask = controller.text.trim();
                if (editedTask.isNotEmpty) {
                  setState(() {
                    tasks[index] = editedTask;
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  void _deleteTask(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Eliminar tarea'),
          content: const Text('¿Seguro que quieres eliminar esta tarea?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  tasks.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Botón para agregar tarea arriba
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: ElevatedButton.icon(
              onPressed: _addTask,
              icon: const Icon(Icons.add),
              label: const Text('Agregar Tarea'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            ),
          ),
        ),

        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: CupertinoColors.activeOrange,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Pending',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const Expanded(
              child: Divider(color: Colors.orange, thickness: 2, indent: 10),
            ),
          ],
        ),
        const SizedBox(height: 20),

        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text('Task', style: TextStyle(color: Colors.grey))),
            Expanded(
              child: Text('Estate', style: TextStyle(color: Colors.grey)),
            ),
            Expanded(
              child: Text('Actions', style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
        const SizedBox(height: 10),

        ...tasks.asMap().entries.map((entry) {
          int idx = entry.key;
          String task = entry.value;
          return TaskRow(
            task: task,
            onEdit: () => _editTask(idx),
            onDelete: () => _deleteTask(idx),
          );
        }).toList(),
      ],
    );
  }
}
