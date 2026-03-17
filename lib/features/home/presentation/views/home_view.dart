import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafqud/core/utils/assets.dart';
import 'package:mafqud/features/home/presentation/widgets/filter_by_governorate_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: SvgPicture.asset(Assets.imagesMafqudAppbar)),
      endDrawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [FilterByGovernorateWidget()]),
      ),
    );
  }
}
