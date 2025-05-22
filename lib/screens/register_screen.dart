import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'main_interface.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool _isRegistering = false;

  Future<void> registerUser() async {
    final username = usernameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    debugPrint('Intentando registrar -> Email: $email, Username: $username');

    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      debugPrint('Error: campos vacíos');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, completa todos los campos')),
      );
      return;
    }

    setState(() {
      _isRegistering = true;
    });

    try {
      // 1. Crear usuario en Firebase Auth
      debugPrint('Llamando a createUserWithEmailAndPassword');
      final UserCredential userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: password);

      final user = userCredential.user;
      debugPrint('FirebaseAuth retornó usuario: ${user?.uid}');
      if (user == null) throw Exception('Error al crear usuario');

      // Verificar que el widget aún está montado
      if (!mounted) return;

      // 2. Guardar datos adicionales en Firestore
      debugPrint('Guardando datos en Firestore para UID: ${user.uid}');
      await firestore.collection('users').doc(user.uid).set({
        'username': username,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });
      debugPrint('Datos guardados correctamente en Firestore.');

      // Verificar montado antes de navegar
      if (!mounted) return;

      // 3. Navegar a MainInterface
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainInterface()),
      );
    } on FirebaseAuthException catch (e) {
      // Capturar errores específicos de Firebase Auth
      debugPrint('FirebaseAuthException: ${e.code} -> ${e.message}');
      String message = 'Error desconocido';
      if (e.code == 'email-already-in-use') {
        message = 'El correo ya está en uso';
      } else if (e.code == 'invalid-email') {
        message = 'Formato de correo inválido';
      } else if (e.code == 'weak-password') {
        message = 'La contraseña es demasiado débil';
      }
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } catch (e, stack) {
      // Capturar cualquier otra excepción
      debugPrint('ERROR REGISTRO (catch general): $e');
      debugPrint('$stack');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isRegistering = false;
        });
      }
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Usamos SingleChildScrollView para que no se corte en pantallas pequeñas
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2E),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Let's Create Your Account",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFFA0A0A0),
                ),
              ),
              const SizedBox(height: 30),
              _buildTextField(
                controller: usernameController,
                label: 'Username',
                hint: 'Enter your username',
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: emailController,
                label: 'Email',
                hint: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: passwordController,
                label: 'Password',
                hint: 'Enter your password',
                obscureText: true,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 187,
                height: 47,
                child: ElevatedButton(
                  onPressed: _isRegistering ? null : registerUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFCBA6F7),
                    elevation: 7,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  child: _isRegistering
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : const Text('Register'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter your $label:',
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            labelText: hint,
            labelStyle: TextStyle(
              color: Colors.white.withAlpha(128), // 50% opacidad
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.purpleAccent,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white24),
              borderRadius: BorderRadius.circular(8),
            ),
            fillColor: Colors.white10,
            filled: true,
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
