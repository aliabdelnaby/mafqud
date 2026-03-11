import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordAndCreateAccountWidget extends StatelessWidget {
  const ForgetPasswordAndCreateAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              // Navigate to forget password view
            },
            child: Text(
              "Forget password ?",
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              context.push("/signUpView");
            },
            child: Text(
              "Create new account",
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
