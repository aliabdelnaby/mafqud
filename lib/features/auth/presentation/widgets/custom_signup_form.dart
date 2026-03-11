import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mafqud/core/utils/app_colors.dart';
import 'package:mafqud/features/auth/cubit/auth_cubit.dart';
import 'package:mafqud/features/auth/cubit/auth_state.dart';
import 'package:mafqud/features/auth/presentation/widgets/custom_auth_text_form_field.dart';
import 'package:mafqud/features/auth/presentation/widgets/login_with_widget.dart';
import 'package:mafqud/features/onBoarding/presentation/widgets/custom_auth_btn.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Row(
                children: [
                  Icon(Icons.mark_email_read_outlined, color: Colors.white),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Signup successful! Welcome aboard.',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
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
        if (state is SignUpFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Signup failed: ${state.errMessage}"),
              backgroundColor: Colors.red.shade600,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is SignUpLoadingState;
        return Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: cubit.signupFormKey,
          child: Column(
            children: [
              CustomAuthTextFormField(
                hintText: "Name",
                prefix: Icons.person_outline,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This Field is required";
                  }
                  return null;
                },
                onChanged: (value) {
                  cubit.name = value;
                },
              ),
              const SizedBox(height: 30),
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
                hintText: "Phone Number",
                prefix: Icons.call_outlined,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This Field is required";
                  }
                  if (!RegExp(r"^[0-9]{10}$").hasMatch(value)) {
                    return "Please enter a valid phone number";
                  }
                  return null;
                },
                onChanged: (value) {
                  cubit.phoneNumber = value;
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
                      text: "SIGN UP",
                      onTap: () {
                        if (cubit.signupFormKey.currentState!.validate()) {
                          cubit.signUp();
                        }
                      },
                    ),
              const SizedBox(height: 30),
              LoginWithWidget(),
            ],
          ),
        );
      },
    );
  }
}
