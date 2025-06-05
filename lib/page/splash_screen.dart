import 'package:flutter/material.dart';
import 'btmnavbar.dart'; // Adjust path if needed
import 'login.dart';
class SplashScreen extends StatefulWidget {
  final bool isLoggedIn;
  final Function(ThemeMode) changeThemeMode;

  const SplashScreen({
    Key? key,
    required this.isLoggedIn,
    required this.changeThemeMode,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => widget.isLoggedIn
              ? const BtmNavBar()
              : LoginPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7F8),
      body: Center(
        child: Image.asset(
          'assets/images/splash_screen.png', // Make sure this exists
          width: 650,
        ),
      ),
    );
  }
}
