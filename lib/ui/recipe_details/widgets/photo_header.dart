import 'package:flutter/material.dart';
import 'package:recipes_app/data/remote/recipes/models/recipes_response_entity.dart';
import 'package:recipes_app/utils/app_colors.dart';
import 'package:recipes_app/utils/constants.dart';

class PhotoHeader extends StatelessWidget {
  const PhotoHeader({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(recipe.image ?? "",)
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16),
              child: Container(
                height: 35,
                width: 90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_time_filled,
                        color: AppColors.green,
                        size: 17,
                      ),
                      const SizedBox(width: 6,),
                      Text("${recipe.readyInMinutes} min")
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 16),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          shareUrl(title: 'Checkout this great recipe!');
                        },
                        icon: Icon(
                            Icons.share,
                            color: AppColors.green,
                            size: 17
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 15,
          top: 25,
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white,)),
        ),
      ],
    );
  }
}