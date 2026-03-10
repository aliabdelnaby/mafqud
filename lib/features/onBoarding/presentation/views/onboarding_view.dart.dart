import 'package:flutter/material.dart';
import 'package:mafqud/core/utils/assets.dart';
import 'package:mafqud/features/onBoarding/presentation/widgets/custom_auth_btn.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            spacing: 30,
            children: [
              const SizedBox(),
              Center(
                child: Image.asset(
                  Assets.imagesOnBoardingImage,
                  height: 278,
                  width: 237,
                ),
              ),
              const Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF233388),
                ),
              ),
              const Text(
                "We are here to help you find your lost loved ones. Through our platform, you can search for them. We want to restore hope to you and help you.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF233388),
                ),
              ),
              const Text(
                "You can now log in or sign up",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF233388),
                ),
              ),
              CustomAuthBtn(text: "LOGIN", onTap: () {}),
              CustomAuthBtn(text: "SIGN UP", onTap: () {}),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

