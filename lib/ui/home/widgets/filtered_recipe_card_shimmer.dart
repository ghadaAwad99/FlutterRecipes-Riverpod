import 'package:flutter/material.dart';
import 'package:recipes_app/utils/widgets/shimmer_skeleton.dart';

class FilteredRecipeCardShimmer extends StatelessWidget {
  const FilteredRecipeCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: const BorderRadius.all(Radius.circular(16))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerSkeleton(
            child: Container(
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade300,
              ),
            ),
          ),
          ShimmerSkeleton(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    width: 130,
                    color: Colors.grey.shade200,
                  ),
                  SizedBox(height: 3,),
                  Container(
                    height: 20,
                    width: 80,
                    color: Colors.grey.shade200,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 3, top: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            color: Colors.grey.shade200,
                          ),
                          height: 30,
                          width: 70,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 3, top: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            color: Colors.grey.shade200,
                          ),
                          height: 30,
                          width: 70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
