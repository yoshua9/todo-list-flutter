import 'package:flutter/material.dart';
import 'package:todoman/lib.dart';

class TabBarLists extends StatelessWidget {
  const TabBarLists({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        TasksToComplete(),
        CompletedTasks(),
      ],
    );
  }
}
