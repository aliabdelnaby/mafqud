import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqud/features/auth/cubit/auth_cubit.dart';
import 'package:mafqud/features/auth/cubit/auth_state.dart';
import 'package:mafqud/features/auth/presentation/widgets/custom_auth_text_form_field.dart';
import 'package:mafqud/features/auth/presentation/widgets/forget_password_create_account_widget.dart';
import 'package:mafqud/features/auth/presentation/widgets/login_with_widget.dart';
import 'package:mafqud/features/onBoarding/presentation/widgets/custom_auth_btn.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: cubit.loginFormKey,
          child: Column(
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
                onChanged: (value) {
                  cubit.email = value;
                },
              ),
              const SizedBox(height: 30),
              CustomAuthTextFormField(
                hintText: "Password",
                prefix: Icons.lock_outline,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This Field is required";
                  }
                  if (value.length < 6) {
                    return "Password must be at least 6 characters long";
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  icon: Icon(
                    cubit.obscurePasswordTextValue!
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Color(0xff666666).withValues(alpha: 0.85),
                  ),
                  onPressed: () {
                    cubit.obscurePasswordText();
                  },
                ),
                obscureText: cubit.obscurePasswordTextValue,
                onChanged: (value) {
                  cubit.password = value;
                  cubit.password = value.trim();
                },
              ),
              const SizedBox(height: 30),
              CustomAuthBtn(
                text: "LOGIN",
                onTap: () {
                  if (cubit.loginFormKey.currentState!.validate()) {}
                },
              ),
              const SizedBox(height: 30),
              ForgetPasswordAndCreateAccountWidget(),
              const SizedBox(height: 30),
              LoginWithWidget(),
            ],
          ),
        );
      },
    );
  }
}
