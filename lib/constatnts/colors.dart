// File: lib/constants/colors.dart
import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF6A74F5);
  static const Color background = Colors.white;
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF7A7A7A);
  static const Color error = Color(0xFFFF4D4D);
  static const Color inputBorder = Color(0xFFCCCCCC);
  static const Color iconColor = Color(0xFF30C6A1);
  static const Color link = Color(0xFF547BFD);
  static const Color googleBorder = Color(0xFFE0E0E0);
  static const Color selectedDateBackground = Color(0xFF2E4544);
  static const Color navBarInactive = Color(0xFFBDBDBD);
  static const Color navBarActive = primary;
}

// File: lib/constants/strings.dart
class AppStrings {
  static const String appName = "Adhicine";
  static const String signIn = "Sign In";
  static const String emailHint = "Email";
  static const String passwordHint = "Password";
  static const String emailError = "Incorrect Email Address";
  static const String forgotPassword = "Forgot Password?";
  static const String or = "OR";
  static const String continueWithGoogle = "Continue with Google";
  static const String newToApp = "New to Adhicine?";
  static const String signUp = "Sign Up";
  static const String greeting = "Hi Harry!";
  static const String medicinesLeft = "5 Medicines Left";
  static const String noData = "Nothing Is Here, Add a Medicine";
}
 

class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle input = TextStyle(
    fontSize: 16,
    color: AppColors.textPrimary,
  );

  static const TextStyle error = TextStyle(
    fontSize: 13,
    color: AppColors.error,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const TextStyle forgotPassword = TextStyle(
    fontSize: 13,
    color: AppColors.link,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle googleButton = TextStyle(
    fontSize: 16,
    color: AppColors.textPrimary,
  );

  static const TextStyle signUp = TextStyle(
    fontSize: 14,
    color: AppColors.link,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle greeting = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle medicineInfo = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );

  static const TextStyle emptyBox = TextStyle(
    fontSize: 15,
    color: AppColors.textSecondary,
  );

  static const TextStyle selectedDate = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
