// File: lib/screens/signin_screen.dart
import 'package:chikista_io/constatnts/colors.dart';
import 'package:chikista_io/screens/home_screen.dart';
import 'package:chikista_io/screens/navigationBar.dart';
import 'package:flutter/material.dart'; 


class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(radius: 40, backgroundColor: AppColors.primary),
              const SizedBox(height: 20),
              const Text(AppStrings.signIn, style: AppTextStyles.heading),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email, color: AppColors.iconColor),
                  hintText: AppStrings.emailHint,
                  errorStyle: AppTextStyles.error,
                ),
                validator: (value) => value!.contains('@') ? null : AppStrings.emailError,
              ),
              const SizedBox(height: 15),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: AppColors.iconColor),
                  suffixIcon: Icon(Icons.visibility_off),
                  hintText: AppStrings.passwordHint,
                ),
                validator: (value) => value!.length >= 6 ? null : 'Password too short',
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(AppStrings.forgotPassword, style: AppTextStyles.forgotPassword),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(context,  MaterialPageRoute(builder: (context) => MainNavigation()));
                  }
                },
                child: const Text(AppStrings.signIn, style: AppTextStyles.button),
              ),
              const SizedBox(height: 10),
              const Text(AppStrings.or),
              const SizedBox(height: 10),
              OutlinedButton.icon(
                icon: const Icon(Icons.g_mobiledata, color: Colors.black),
                label: const Text(AppStrings.continueWithGoogle, style: AppTextStyles.googleButton),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.googleBorder),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(AppStrings.newToApp),
                  SizedBox(width: 4),
                  Text(AppStrings.signUp, style: AppTextStyles.signUp),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}