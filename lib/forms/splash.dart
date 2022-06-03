import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import '../screens/login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: const LoginScreen(),
      duration: 6000,
      imageSize: 200,
      imageSrc: "assets/images/WhiteSpidey.png",
      text: "Welcome To DJ Spider News App",
      textType: TextType.ColorizeAnimationText,
      textStyle: const TextStyle(
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
      ),
      colors: const [
        Color.fromARGB(255, 51, 50, 51),
        Color.fromARGB(255, 226, 226, 226),
        Color.fromARGB(255, 43, 42, 37),
        Color.fromARGB(255, 216, 244, 54),
      ],
      backgroundColor: Colors.black,
    );
  }
}
