
import 'package:flutter/material.dart';
import 'package:mafqud/core/utils/assets.dart';

class LoginWithWidget extends StatelessWidget {
  const LoginWithWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 30,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(onTap: () {}, child: Image.asset(Assets.imagesGoogleIcon)),
        InkWell(
          onTap: () {},
          child: Image.asset(Assets.imagesFacebookIcon),
        ),
        InkWell(onTap: () {}, child: Image.asset(Assets.imagesTwitterIcon)),
      ],
    );
  }
}
