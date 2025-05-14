import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

import 'login_screen.dart';
import 'register_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E2E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Welcome to NishiX App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 100),
            OpenContainer(
              transitionType: ContainerTransitionType.fadeThrough,
              transitionDuration: Duration(milliseconds: 450),
              closedColor: Color(0xFF1E1E2E),
              closedBuilder:
                  (context, openContainer) => SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: openContainer,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFCBA6F7),
                        elevation: 6,
                        shadowColor: Colors.purpleAccent.withValues(alpha: 0.4),
                        padding: EdgeInsets.all(12),
                        minimumSize: Size(187, 47),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      child: Text('Login'),
                    ),
                  ),
              openBuilder: (context, _) => LoginPage(),
            ),
            SizedBox(height: 20),
            OpenContainer(
              transitionType: ContainerTransitionType.fadeThrough,
              transitionDuration: Duration(milliseconds: 450),
              closedColor: Color(0xFF1E1E2E),
              closedBuilder:
                  (context, openContainer) => SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: openContainer,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFCBA6F7),
                        elevation: 7,
                        shadowColor: Colors.black,
                        padding: EdgeInsets.all(12),
                        minimumSize: Size(187, 47),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      child: Text('Register'),
                    ),
                  ),
              openBuilder: (context, _) => RegisterPage(),
            ),
          ],
        ),
      ),
    );
  }
}
