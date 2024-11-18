import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoman/lib.dart';

class CardTask extends StatelessWidget {
  const CardTask({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: ColorsApp.primary,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            offset: Offset(0, 5),
            color: Color.fromRGBO(0, 0, 0, 0.1),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  task.task,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: ColorsApp.colorTextTitle,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Gaps.hGap20,
              InkWell(
                onTap: () {
                  context.read<TodoBloc>().add(RemoveTodo(task.id));
                },
                child: const Icon(Icons.delete, color: Colors.red, size: 25),
              ),
            ],
          ),
          Gaps.vGap10,
          getLevelWidget(task.level),
          Gaps.vGap10,
          Text(
            task.description,
            textAlign: TextAlign.justify,
            style: const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
          ),
          Gaps.vGap10,
          if (task.status == TaskStatus.pending)
            SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<TodoBloc>().add(CompleteTodo(task));
                      },
                      child: Text(
                        'Completar',
                        style: TextStyle(
                          color: Colors.green[400]!,
                          fontWeight: FontWeight.w600,
                          // decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ))
        ],

        // children: [
        //   Expanded(
        //       child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Row(
        //         children: [
        //           getLevelWidget(task.level),
        //           Gaps.hGap10,
        //           Expanded(
        //             child: Text(
        //               task.task,
        //               maxLines: 2,
        //               overflow: TextOverflow.ellipsis,
        //               textAlign: TextAlign.left,
        //               style: const TextStyle(
        //                   color: ColorsApp.colorTextTitle,
        //                   fontSize: 15,
        //                   fontWeight: FontWeight.w700),
        //             ),
        //           ),
        //         ],
        //       ),
        //       Gaps.vGap5,
        //       Text(
        //         task.description,
        //         textAlign: TextAlign.justify,
        //         maxLines: 3,
        //         overflow: TextOverflow.ellipsis,
        //         style: TextStyle(
        //             color: Colors.grey.withOpacity(0.5),
        //             fontSize: 13,
        //             fontWeight: FontWeight.w700),
        //       ),
        //     ],
        //   )),
        //   Gaps.hGap20,
        //   Column(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     crossAxisAlignment: CrossAxisAlignment.end,
        //     children: [
        //       InkWell(
        //         onTap: () {
        //           context.read<TodoBloc>().add(RemoveTodo(task.id));
        //         },
        //         child: const Icon(Icons.delete, color: Colors.red, size: 30),
        //       ),
        //       if (task.status == TaskStatus.pending)
        //         GestureDetector(
        //           onTap: () {
        //             context.read<TodoBloc>().add(CompleteTodo(task));
        //           },
        //           child: const Text(
        //             'Completar',
        //             style: TextStyle(
        //               color: Colors.green,
        //               fontWeight: FontWeight.w600,
        //               // decoration: TextDecoration.underline,
        //             ),
        //           ),
        //         )
        //     ],
        //   )
        // ],
      ),
    );
  }

  Widget getLevelWidget(Tag level) {
    String title = '';
    Color color = Colors.red;

    switch (level) {
      case Tag.low:
        title = 'Baja';
        color = Colors.blue;
        break;
      case Tag.medium:
        title = 'Normal';
        color = Colors.orangeAccent;
        break;

      case Tag.high:
        title = 'Urgente';
        color = Colors.red;
        break;
    }
    return Container(
      height: 30,
      width: 70,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
    );
  }
}
