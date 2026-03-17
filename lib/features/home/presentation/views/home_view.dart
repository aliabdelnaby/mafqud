import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafqud/core/data/datasource/missing_person_list.dart';
import 'package:mafqud/core/utils/assets.dart';
import 'package:mafqud/features/home/presentation/widgets/filter_by_governorate_widget.dart';
import 'package:mafqud/features/home/presentation/widgets/missing_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: SvgPicture.asset(Assets.imagesMafqudAppbar)),
      endDrawer: Drawer(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            FilterByGovernorateWidget(),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: missingList.length,
                itemBuilder: (context, index) {
                  final person = missingList[index];
                  return  MissingCard(
                    person: person,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
