import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mafqud/core/utils/app_colors.dart';
import 'package:mafqud/core/utils/assets.dart';
import 'package:mafqud/features/auth/presentation/widgets/custom_login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 30,
            children: [
              Center(child: SvgPicture.asset(Assets.imagesMafqudAuthLogo)),
              Text(
                "LOGIN",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
              ),
              CustomLoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}

