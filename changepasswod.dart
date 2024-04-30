import 'package:flutter/material.dart';

void main() {
  runApp(ChangePasswordScreen());
}

class ChangePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cambiar contraseña'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ChangePasswordForm(),
        ),
      ),
    );
  }
}

class ChangePasswordForm extends StatefulWidget {
  @override
  _ChangePasswordFormState createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isValidPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(
            labelText: 'Introduce la nueva contraseña',
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),
          obscureText: _obscurePassword,
          onChanged: (value) {
            setState(() {
              _isValidPassword = _validatePassword(value);
            });
          },
        ),
        SizedBox(height: 20),
        TextField(
          controller: _confirmPasswordController,
          decoration: InputDecoration(
            labelText: 'Repite la contraseña',
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(_obscureConfirmPassword
                  ? Icons.visibility
                  : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _obscureConfirmPassword = !_obscureConfirmPassword;
                });
              },
            ),
          ),
          obscureText: _obscureConfirmPassword,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (_isValidPassword &&
                _passwordController.text == _confirmPasswordController.text) {
              // Acción para guardar la contraseña
            } else {
              // Mostrar un mensaje de error
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                        'Las contraseñas no coinciden o no cumplen los requisitos.')),
              );
            }
          },
          child: Text('Guardar'),
        ),
      ],
    );
  }

  bool _validatePassword(String value) {
    // Validar que la contraseña tenga al menos 8 caracteres, una mayúscula, una minúscula, un número y un carácter especial
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(value);
  }
}
