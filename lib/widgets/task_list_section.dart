import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'task_row.dart';

class TaskListSection extends StatelessWidget {
  final List<String> tasks;

  const TaskListSection({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: CupertinoColors.activeOrange,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text('Pending', style: TextStyle(color: Colors.white)),
            ),
            Expanded(
              child: Divider(color: Colors.orange, thickness: 2, indent: 10),
            ),
          ],
        ),
        SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Expanded(child: Text('Task', style: TextStyle(color: Colors.grey))),
            Expanded(
              child: Text('Estate', style: TextStyle(color: Colors.grey)),
            ),
            Expanded(
              child: Text('Actions', style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
        SizedBox(height: 10),

        ...tasks.map((task) => TaskRow(task: task)).toList(),
      ],
    );
  }
}
