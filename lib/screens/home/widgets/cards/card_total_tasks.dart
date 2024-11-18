import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoman/lib.dart';

class CardTotalTasks extends StatelessWidget {
  const CardTotalTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
        buildWhen: (p, c) =>
            c.todos != p.todos || p.todosCompleted != c.todosCompleted,
        builder: (context, state) {
          final tasks = state.todos.length + state.todosCompleted.length;
          final completedTasks = state.todosCompleted.length;

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            constraints: const BoxConstraints(maxHeight: 230),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorsApp.primary),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (tasks > 0) ...[
                      const Text('Progreso',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400)),
                      Gaps.vGap5,
                      Text(
                        '$completedTasks / $tasks tareas',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ]
                  ],
                )),
                Gaps.hGap10,
                Flexible(
                    flex: 2,
                    child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(ConstantsImages.img1)))
              ],
            ),
          );
        });
  }
}
