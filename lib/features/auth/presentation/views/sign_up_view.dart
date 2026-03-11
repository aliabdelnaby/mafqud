import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mafqud/core/utils/app_colors.dart';
import 'package:mafqud/core/utils/assets.dart';
import 'package:mafqud/features/auth/presentation/widgets/custom_signup_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 30,
            children: [
              Center(child: SvgPicture.asset(Assets.imagesMafqudAuthLogo)),
              Text(
                "New Account",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
              ),
              CustomSignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
