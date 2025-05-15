import 'package:flutter/material.dart';
import '../widgets/task_list_section.dart';

class MainInterface extends StatelessWidget {
  const MainInterface({super.key});

  @override
  Widget build(BuildContext context) {
    final tareas = [
      'Buy Hamburgers',
      'Go to Gatitas',
      "Pay karely's Only",
      'Get Graduate from Senati',
    ];

    return Scaffold(
      backgroundColor: Color(0xff1e1e2e),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TOP BAR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: Image.asset(
                      'assets/images/profile.jpg',
                      width: 70,
                      height: 70,
                    ),
                  ),
                  Row(
                    children: [
                      for (var icon in ['icon1.jpg', 'icon2.jpg', 'icon3.jpg'])
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(90),
                            child: Image.asset(
                              'assets/icons/$icon',
                              width: 60,
                              height: 60,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Search or Add Task',
                        labelStyle: TextStyle(
                          color: Colors.white.withAlpha(128),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.purpleAccent,
                            width: 1.3,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white24),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        fillColor: Colors.white10,
                        filled: true,
                      ),
                    ),
                  ),
                  SizedBox(width: 7),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFCBA6F7),
                      elevation: 7,
                      shadowColor: Colors.black,
                      padding: EdgeInsets.all(12),
                      minimumSize: Size(129, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      textStyle: TextStyle(fontSize: 20),
                    ),
                    child: Text('Add Task'),
                  ),
                ],
              ),

              SizedBox(height: 40),

              // TASK LIST SECTION
              TaskListSection(tasks: tareas),
            ],
          ),
        ),
      ),
    );
  }
}
