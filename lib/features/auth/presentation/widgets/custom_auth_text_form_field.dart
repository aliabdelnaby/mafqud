import 'package:flutter/material.dart';
import 'package:mafqud/core/utils/app_colors.dart';

class CustomAuthTextFormField extends StatelessWidget {
  const CustomAuthTextFormField({
    super.key,
    this.validator,
    required this.hintText,
    this.prefix,
    this.keyboardType,
    required this.onChanged,
    this.obscureText,
    this.suffixIcon,
  });
  final String? Function(String?)? validator;
  final String hintText;
  final IconData? prefix;
  final TextInputType? keyboardType;
  final void Function(String) onChanged;
  final bool? obscureText;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return "This Field is required";
            }
            return null;
          },
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xff666666).withValues(alpha: 0.85),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: Icon(
          prefix,
          color: Color(0xff666666).withValues(alpha: 0.85),
        ),
        suffixIcon: suffixIcon,
        isDense: true,
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(),
      ),
    );
  }
}

OutlineInputBorder _buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
  );
}
