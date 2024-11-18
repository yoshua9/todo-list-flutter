import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoman/lib.dart';

class TabBarMenu extends StatelessWidget {
  const TabBarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
        buildWhen: (p, c) =>
            c.todosCompleted != c.todosCompleted || c.todos != p.todos,
        builder: (context, state) {
          final tasks = state.todos.length;
          final completedTasks = state.todosCompleted.length;
          return TabBar(
              indicatorColor: ColorsApp.primary,
              isScrollable: true,
              labelPadding: const EdgeInsets.all(5),
              dividerHeight: 0.1,
              tabAlignment: TabAlignment.center,
              tabs: [
                _tab(title: 'Pendientes', amount: tasks.toString()),
                _tab(title: 'Completadas', amount: completedTasks.toString()),
              ]);
        });
  }

  Widget _tab({required String title, required String amount}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: ColorsApp.colorTextTitle,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gaps.hGap10,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: ColorsApp.primary),
          child: Text(
            amount,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
