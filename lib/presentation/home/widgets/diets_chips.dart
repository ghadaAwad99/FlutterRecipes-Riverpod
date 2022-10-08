import 'package:flutter/material.dart';
import 'package:recipes_app/presentation/home/home_state.dart';
import 'package:recipes_app/utils/app_colors.dart';
import 'package:recipes_app/utils/string_extension.dart';

class DietsChips extends StatelessWidget {
  const DietsChips({
    Key? key,
    required this.state,
    required this.index,
  }) : super(key: key);
  final HomeState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: SizedBox(
        height: 35,
        width: MediaQuery.of(context).size.width * .4,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: state.recipes?[index].diets?.length ?? 0,
          itemBuilder: (context, dietIndex) =>
              Padding(
                padding: const EdgeInsets.only(left: 3.0),
                child: Chip(
                  backgroundColor: AppColors.darkGreen,
                  labelStyle: const TextStyle(color: Colors.white),
                  label: Text(state.recipes?[index].diets?[dietIndex].capitalize() ?? ""),
                ),
              ),
        ),
      ),
    );
  }
}