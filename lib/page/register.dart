import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uastpm/page/login.dart';
import '../model/user.dart';
import '../main.dart';
import 'package:uastpm/utils/encrypt.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late Box<UserModel> _myBox;

  final _formKey = GlobalKey<FormState>();
  String _inputUsername = "";
  String _inputPassword = "";
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _myBox = Hive.box(boxUser);
  }

  void _submit() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();

      if (_myBox.containsKey(_inputUsername)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Username already taken')),
        );
        return;
      }

      final user = UserModel(password: EncryptData.encryptAES(_inputPassword));
      _myBox.put(_inputUsername, user);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User registered successfully')),
      );

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF01AD01),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 45.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/register_ngojek.png',
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 45.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) =>
                value!.isEmpty ? 'Please enter a username' : null,
                onSaved: (value) => _inputUsername = value!.toLowerCase(),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                validator: (value) =>
                value!.isEmpty ? 'Please enter a password' : null,
                onSaved: (value) => _inputPassword = value!,
                obscureText: _obscureText,
              ),
              const SizedBox(height: 25.0),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF01AD01),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
