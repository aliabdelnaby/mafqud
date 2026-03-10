import 'package:flutter/material.dart';
import 'package:mafqud/features/auth/presentation/widgets/custom_auth_text_form_field.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAuthTextFormField(
          hintText: "Email",
          prefix: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "This Field is required";
            }
            if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
            ).hasMatch(value)) {
              return "Please enter a valid email address";
            }
            return null;
          },
          onChanged: (value) {},
        ),
        const SizedBox(height: 30),
        CustomAuthTextFormField(
          hintText: "Password",
          prefix: Icons.lock_outline,
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "This Field is required";
            }
            if (value.length < 6) {
              return "Password must be at least 6 characters long";
            }
            return null;
          },
          onChanged: (value) {},
        ),
      ],
    );
  }
}
