import 'package:flutter/material.dart';
import 'package:recipes_app/data/remote/recipes/models/recipes_response_entity.dart';
import 'package:recipes_app/utils/app_colors.dart';

class InstructionsWidget extends StatelessWidget {
  const InstructionsWidget({
    Key? key,
    required this.instructions,
  }) : super(key: key);
  final List<AnalyzedInstruction> instructions;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
        child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: instructions[0].steps?.length,
            itemBuilder: (context, index) => Card(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "Step ${instructions[0].steps?[index].number.toString()}",
                        style: TextStyle(color: AppColors.green),
                      ),
                      const SizedBox(height: 8,),
                      Text(instructions[0].steps?[index].step ?? ""),
                    ],
                  )
              ),
            )
        )
    );
  }
}
