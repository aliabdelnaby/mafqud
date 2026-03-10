import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class SkipBtn extends StatelessWidget {
  const SkipBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          "Skip",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
