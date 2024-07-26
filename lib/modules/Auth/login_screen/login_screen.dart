import 'package:fashions/modules/Auth/login_screen/success_screen.dart';
import 'package:fashions/modules/Auth/signup_screen.dart';
import 'package:fashions/modules/categories/categories_screen.dart';
import 'package:fashions/shared/app_color.dart';
import 'package:fashions/shared/app_string.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                width: 150.0, // Adjust width as needed
                height: 150.0, // Adjust height as needed
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Welcome!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Please login or sign up to continue our app',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      suffixIcon: Icon(Icons.check),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      suffixIcon: Icon(Icons.check),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
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
                      'Login', // Button text
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
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("or"),
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
                    label: const Text(
                      'Continue with Facebook',
                      style: TextStyle(fontSize: 18, color: Colors.white),
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
                                const CategoriesScreen(),
                          ),
                        );
                    },
                    icon: const Icon(Icons.facebook, color: Colors.black),
                    label: Text(
                      'Continue with Google',
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
                      'Continue with Apple',
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
