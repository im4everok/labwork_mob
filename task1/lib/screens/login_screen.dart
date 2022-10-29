import 'package:flutter/material.dart';
import 'package:task1/data/app_routes.dart';
import 'package:task1/data/data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _nameController, _surnameController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _surnameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text("Login screen", style: TextStyle(fontSize: 25)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Surname',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _surnameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (_nameController.text.isNotEmpty &&
                _surnameController.text.isNotEmpty) {
              Navigator.pushReplacementNamed(context, AppRoutes.home,
                  arguments:
                      Data(_nameController.text, _surnameController.text));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please fill in all fields'),
                ),
              );
            }
          },
          child: const Text('LOGIN'),
        ),
      ]),
    )));
  }
}
