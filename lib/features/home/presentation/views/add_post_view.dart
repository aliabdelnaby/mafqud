import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mafqud/core/utils/app_colors.dart';
import 'package:mafqud/core/utils/assets.dart';
import 'package:mafqud/features/home/presentation/widgets/pick_image_widget.dart';

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
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(child: PickImageWidget()),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
