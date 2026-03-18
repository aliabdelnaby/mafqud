import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mafqud/core/data/datasource/list_of_governarets.dart';
import 'package:mafqud/core/utils/app_colors.dart';

class FilterByGovernorateWidget extends StatefulWidget {
  const FilterByGovernorateWidget({
    super.key,
    required this.onSelected,
    this.trailing,
    this.hintText,
  });
  final Function(String) onSelected;
  final Iterable<Widget>? trailing;
  final String? hintText;

  @override
  State<FilterByGovernorateWidget> createState() =>
      _FilterByGovernorateWidgetState();
}

class _FilterByGovernorateWidgetState extends State<FilterByGovernorateWidget> {
  String? selectedGovernorate;
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText:
          selectedGovernorate ?? widget.hintText ?? "Filter by governorate",
      hintStyle: WidgetStateProperty.resolveWith(
        (states) => TextStyle(
          color: Color(0xff666666).withValues(alpha: 0.85),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: widget.trailing,
      backgroundColor: WidgetStateProperty.resolveWith(
        (states) => Colors.white,
      ),
      shape: WidgetStateProperty.resolveWith(
        (states) => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
          side: BorderSide(color: AppColors.primaryColor),
        ),
      ),
      elevation: WidgetStateProperty.resolveWith((states) => 0),
      readOnly: true,
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          backgroundColor: Colors.white,
          useSafeArea: true,
          builder: (context) {
            return ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: governorates.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(governorates[index]),
                  onTap: () {
                    setState(() {
                      selectedGovernorate = governorates[index];
                    });
                    widget.onSelected(selectedGovernorate!);
                    if (kDebugMode) {
                      print(governorates[index]);
                    }
                    context.pop();
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
