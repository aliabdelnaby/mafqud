import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mafqud/core/utils/app_colors.dart';
import 'package:mafqud/core/utils/assets.dart';
import 'package:mafqud/features/auth/presentation/widgets/custom_auth_text_form_field.dart';
import 'package:mafqud/features/home/presentation/widgets/filter_by_governorate_widget.dart';
import 'package:mafqud/features/home/presentation/widgets/pick_image_widget.dart';
import 'package:mafqud/features/onBoarding/presentation/widgets/custom_auth_btn.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Post",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryColor,
          ),
        ),
        actions: [SvgPicture.asset(Assets.imagesMafqudAppbar)],
        actionsPadding: EdgeInsets.all(5),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          spacing: 30,
          children: [
            Center(child: PickImageWidget()),
            CustomAuthTextFormField(
              hintText: "Name",
              keyboardType: TextInputType.name,
              prefix: Icons.person_outline,
              onChanged: (value) {},
            ),
            CustomAuthTextFormField(
              hintText: "Age",
              keyboardType: TextInputType.number,
              prefix: Icons.numbers,
              onChanged: (value) {},
            ),
            FilterByGovernorateWidget(
              hintText: "Select a governorate",
              onSelected: (value) {},
            ),
            CustomAuthTextFormField(
              hintText: "Phone Number",
              keyboardType: TextInputType.phone,
              prefix: Icons.call_outlined,
              onChanged: (value) {},
            ),
            CustomAuthTextFormField(
              hintText: "Time And Place",
              keyboardType: TextInputType.text,
              prefix: Icons.location_on_outlined,
              onChanged: (value) {},
            ),
            CustomAuthBtn(text: "Add Post", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
