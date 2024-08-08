import 'package:fashions/modules/Auth/login_screen/success_screen.dart';
import 'package:fashions/shared/app_color.dart';
import 'package:fashions/shared/app_string.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../models/user_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final userTextformFieldController = TextEditingController();
  final emailTextformFieldController = TextEditingController();
  final passwordTextformFieldController = TextEditingController();
  final confirmPasswordTextformFieldController = TextEditingController();

  bool checkValue = false;
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  void _signUp() async {
    if (_formKey.currentState!.validate() && checkValue) {
      var userBox = Hive.box('userBox');
      var newUser = UserModel(
        userName: userTextformFieldController.text,
        email: emailTextformFieldController.text,
        password: passwordTextformFieldController.text,
      );
      await userBox.put('user', newUser);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SuccessScreen()),
      );
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
            const Text(
              'Sign Up',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Create a new account',
            ),
            const SizedBox(height: 20.0),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: userTextformFieldController,
                    decoration: InputDecoration(
                      labelText: 'User Name',
                      suffixIcon: Container(
                        decoration: BoxDecoration(
                          color: AppColor.blackColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.all(6),
                        child: Icon(
                          Icons.check,
                          color: AppColor.whiteColor,
                          size: 16,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your user name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: emailTextformFieldController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
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
                    controller: passwordTextformFieldController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColor.blackColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: const EdgeInsets.all(6),
                          child: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColor.whiteColor,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                    obscureText: !_passwordVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: confirmPasswordTextformFieldController,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            _confirmPasswordVisible = !_confirmPasswordVisible;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColor.blackColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: const EdgeInsets.all(6),
                          child: Icon(
                            _confirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColor.whiteColor,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                    obscureText: !_confirmPasswordVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != passwordTextformFieldController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    children: [
                      Checkbox(
                        value: checkValue,
                        onChanged: (value) {
                          setState(() {
                            checkValue = value ?? false;
                          });
                        },
                      ),
                      const SizedBox(width: 15.0),
                      Expanded(
                        child: Text(
                          "By creating an account you have to agree with our terms & conditions",
                          style: TextStyle(
                            color: AppColor.greyColor,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() && checkValue) {
                        _signUp;
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
                          horizontal: 140.0, vertical: 15),
                    ),
                    child: Text(
                      'Sign Up',
                      style:
                          TextStyle(fontSize: 18.0, color: AppColor.whiteColor),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
