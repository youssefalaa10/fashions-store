import 'package:fashions/modules/layout_screen.dart';
import 'package:fashions/shared/app_color.dart';
import 'package:fashions/shared/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/auth_bloc.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final email = emailController.text;
      final password = passwordController.text;

      context.read<AuthBloc>().add(LoginRequested(email: email, password: password));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            // Show loading indicator
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Logging in...')),
            );
          } else if (state is AuthSuccess) {
            // Navigate to the main layout screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LayoutScreen()),
            );
          } else if (state is AuthFailure) {
            // Show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: SingleChildScrollView(
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
                style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
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
                        _login(context);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(320, 50),
                        backgroundColor: AppColor.blackColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 140.0,
                          vertical: 15.0,
                        ),
                      ),
                      child: Text(
                        AppString.login,
                        style: TextStyle(fontSize: 18.0, color: AppColor.whiteColor),
                      ),
                    ),
                    // Add remaining UI elements...
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
