import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoman/lib.dart';

class ButtonToCreateTask extends StatelessWidget {
  const ButtonToCreateTask({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => const BottomModalToAddTask()).then((value) {
          if (value != null) {
            context.read<TodoBloc>().add(AddTodo(value));
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: const Icon(Icons.add, color: ColorsApp.primary, size: 60),
      ),
    );
  }
}
