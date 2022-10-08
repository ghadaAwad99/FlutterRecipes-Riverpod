import 'package:flutter/material.dart';
import 'package:recipes_app/presentation/home/home_state.dart';
import 'package:recipes_app/presentation/home/home_viewModel.dart';
import 'package:recipes_app/utils/app_colors.dart';
import 'package:recipes_app/utils/images.dart';

class FiltersChips extends StatelessWidget {
  const FiltersChips({
    Key? key,
    required this.state,
    required this.viewModel,
  }) : super(key: key);

  final HomeState state;
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ChoiceChip(
              shape: StadiumBorder(
                  side: BorderSide(
                      color: state.isLunchSelected
                          ? AppColors.green
                          : Colors.grey)),
              label: SizedBox(
                height: 35,
                child: Row(
                  children: [
                    Text(
                      "Lunch",
                      style: TextStyle(
                          fontSize: 16,
                          color: state.isLunchSelected
                              ? Colors.white
                              : Colors.grey),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                      width: 1,
                      height: 35,
                      color: state.isLunchSelected ? Colors.white : Colors.grey,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Image.asset(
                      AppAssets.lunch,
                      height: 20,
                      width: 25,
                    ),
                  ],
                ),
              ),
              selected: state.isLunchSelected,
              onSelected: (newValue) {
                viewModel.changeFilterType(FilterType.LUNCH);
              },
              selectedColor: AppColors.green,
              backgroundColor: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ChoiceChip(
              shape: StadiumBorder(
                  side: BorderSide(
                      color: state.isSaladsSelected ?? false
                          ? AppColors.green
                          : Colors.grey)),
              label: SizedBox(
                height: 35,
                child: Row(
                  children: [
                    Text(
                      "Salads",
                      style: TextStyle(
                          fontSize: 16,
                          color: state.isSaladsSelected ?? false
                              ? Colors.white
                              : Colors.grey),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                      width: 1,
                      height: 35,
                      color: state.isSaladsSelected ?? false
                          ? Colors.white
                          : Colors.grey,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Image.asset(
                      AppAssets.salad,
                      height: 20,
                      width: 25,
                    ),
                  ],
                ),
              ),
              selected: state.isSaladsSelected ?? false,
              onSelected: (newValue) {
                viewModel.changeFilterType(FilterType.SALAD);
              },
              selectedColor: AppColors.green,
              backgroundColor: Colors.white,
              labelStyle: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ChoiceChip(
              shape: StadiumBorder(
                  side: BorderSide(
                      color: state.isDessertsSelected ?? false
                          ? AppColors.green
                          : Colors.grey)),
              label: Container(
                height: 35,
                child: Row(
                  children: [
                    Text(
                      "Desserts",
                      style: TextStyle(
                          fontSize: 13,
                          color: state.isDessertsSelected ?? false
                              ? Colors.white
                              : Colors.grey),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                      width: 1,
                      height: 35,
                      color: state.isDessertsSelected ?? false
                          ? Colors.white
                          : Colors.grey,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Image.asset(
                      AppAssets.dessert,
                      height: 20,
                    ),
                  ],
                ),
              ),
              selected: state.isDessertsSelected ?? false,
              onSelected: (newValue) {
                viewModel.changeFilterType(FilterType.DESSERT);
              },
              selectedColor: AppColors.green,
              backgroundColor: Colors.white,
              labelStyle: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
