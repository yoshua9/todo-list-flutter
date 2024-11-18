import 'package:flutter/material.dart';
import 'package:todoman/lib.dart';

class TabsHome extends StatelessWidget {
  const TabsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Column(
        children: [
          TabBarMenu(),
          Gaps.vGap20,
          Expanded(
            child: TabBarLists(),
          )
        ],
      ),
    );
  }
}
