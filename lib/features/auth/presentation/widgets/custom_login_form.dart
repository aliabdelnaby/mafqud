import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mafqud/core/utils/app_colors.dart';
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
      listener: (context, state) {
        if (state is LoginSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Login successful! Welcome back.',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.green.shade600,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(16),
              duration: const Duration(seconds: 4),
            ),
          );
          context.go('/homeView');
        }
        if (state is LoginFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
              backgroundColor: Colors.red.shade600,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is LoginLoadingState;
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
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
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
              isLoading
                  ? CircularProgressIndicator(color: AppColors.primaryColor)
                  : CustomAuthBtn(
                      text: "LOGIN",
                      onTap: () async {
                        if (cubit.loginFormKey.currentState!.validate()) {
                          cubit.login();
                        }
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
