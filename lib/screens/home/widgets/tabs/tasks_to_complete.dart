import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoman/lib.dart';

class TasksToComplete extends StatelessWidget {
  const TasksToComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
        buildWhen: (p, c) => c.todos != p.todos,
        builder: (context, state) {
          final list = state.todos;

          if (list.isEmpty) {
            return const SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EmptyList(),
                  SizedBox(height: 70),
                ],
              ),
            );
          }
          return ListView.builder(
              key: const Key('tasks'),
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                final task = list[index];
                return CardTask(task: task);
              });
        });
  }
}
