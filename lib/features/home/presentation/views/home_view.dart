import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mafqud/core/data/datasource/missing_person_list.dart';
import 'package:mafqud/core/utils/app_colors.dart';
import 'package:mafqud/core/utils/assets.dart';
import 'package:mafqud/features/home/presentation/widgets/filter_by_governorate_widget.dart';
import 'package:mafqud/features/home/presentation/widgets/missing_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? selectedGovernorate;

  List get filteredList {
    if (selectedGovernorate == null || selectedGovernorate == "All") {
      return missingList;
    }

    return missingList
        .where((person) => person.governorate == selectedGovernorate)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push("/addPostView");
        },
        backgroundColor: AppColors.secondaryColor,
        child: Icon(Icons.post_add_outlined, color: Colors.white, size: 30),
      ),
      appBar: AppBar(title: SvgPicture.asset(Assets.imagesMafqudAppbar)),
      endDrawer: Drawer(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            FilterByGovernorateWidget(
              onSelected: (governorate) {
                setState(() {
                  selectedGovernorate = governorate;
                });
              },
            ),
            SizedBox(height: 20),

            Expanded(
              child: filteredList.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.search_off, size: 60, color: Colors.grey),
                        SizedBox(height: 12),
                        Text(
                          "No results found",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Try selecting another governorate",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    )
                  : ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        final person = filteredList[index];
                        return MissingCard(person: person);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
