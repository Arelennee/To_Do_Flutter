import 'package:flutter/material.dart';
import 'main_interface.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E2E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome Back!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.normal,
                color: Color(0xFFA0A0A0),
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.symmetric(vertical: 3),
                    child: Column(
                      children: [
                        Text(
                          'Enter your Email:',
                          textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Example@email.com',
                            labelStyle: TextStyle(
                              color: Colors.white.withValues(alpha: 0.5),
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
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      children: [
                        Text(
                          'Enter your Password:',
                          textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Colors.white.withValues(alpha: 0.5),
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainInterface()),
                );
              },
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
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
