import 'package:fashions/modules/Auth/login_screen/success_screen.dart';
import 'package:fashions/modules/Auth/signup_screen.dart';
import 'package:fashions/modules/layout_screen.dart';
import 'package:fashions/shared/app_color.dart';
import 'package:fashions/shared/app_string.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../models/user_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      var userBox = Hive.box('userBox');
      var storedUser = userBox.get('user') as UserModel?;

      if (storedUser != null &&
          storedUser.email == emailController.text &&
          storedUser.password == passwordController.text) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LayoutScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid email or password')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.asset(
                AppString.logo,
                width: 150.0,
                height: 150.0,
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              AppString.welcome,
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              AppString.plzLogin,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: AppString.email,
                      suffixIcon: const Icon(Icons.check),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppString.plzEnterEmail;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: AppString.password,
                      suffixIcon: const Icon(Icons.check),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppString.plzEnterPassword;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _login(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const SuccessScreen(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(320, 50),
                      backgroundColor: AppColor.blackColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 140.0, vertical: 15), // Adjust width here
                    ),
                    child: Text(
                      AppString.login, // Button text
                      style:
                          TextStyle(fontSize: 18.0, color: AppColor.whiteColor),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColor.greyColor,
                          height: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(AppString.or),
                      ),
                      Expanded(
                        child: Divider(
                          color: AppColor.greyColor,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const SignUpScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.facebook, color: Colors.white),
                    label: Text(
                      AppString.continueWithFacebook,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(320, 50),
                      backgroundColor: Colors.blue[800], // Facebook color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      textStyle:
                          const TextStyle(color: Color.fromARGB(255, 19, 3, 3)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const LayoutScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.facebook, color: Colors.black),
                    label: Text(
                      AppString.continueWithGoogle,
                      style: TextStyle(fontSize: 18, color: AppColor.greyColor),
                    ),
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: AppColor.greyColor),
                      minimumSize: const Size(320, 50),
                      backgroundColor: AppColor.whiteColor, // Google color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      textStyle:
                          const TextStyle(color: Color.fromARGB(255, 19, 3, 3)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.apple, color: Colors.black),
                    label: Text(
                      AppString.continueWithApple,
                      style: TextStyle(fontSize: 18, color: AppColor.greyColor),
                    ),
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: AppColor.greyColor),
                      minimumSize: const Size(320, 50),
                      backgroundColor: AppColor.whiteColor, // Apple color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      textStyle:
                          const TextStyle(color: Color.fromARGB(255, 19, 3, 3)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
