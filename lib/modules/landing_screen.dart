import 'package:fashions/modules/Auth/login_screen/login_screen.dart';
import 'package:fashions/modules/Auth/signup_screen.dart';
import 'package:fashions/shared/app_string.dart';
import 'package:flutter/material.dart';

import '../shared/app_color.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppString.splash),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => LoginScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: AppColor.greyColor),
                  minimumSize: const Size(320, 50),
                  backgroundColor: AppColor.whiteColor, // Apple color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  textStyle:
                      const TextStyle(color: Color.fromARGB(255, 19, 3, 3)),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const SignUpScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: AppColor.greyColor),
                  minimumSize: const Size(320, 50),
                  backgroundColor: Colors.transparent, // Apple color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  textStyle:
                      const TextStyle(color: Color.fromARGB(255, 19, 3, 3)),
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColor.whiteColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
