import 'package:flutter/material.dart';
import 'package:todoman/lib.dart';

class EmptyCompletedList extends StatelessWidget {
  const EmptyCompletedList({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: size.width * 0.8,
            child: Image.asset(ConstantsImages.img2, fit: BoxFit.fitWidth)),
        const Text(
          'Aun no has completado alguna tarea..\n ve a por todas 🙂 ',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorsApp.colorTextTitle,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
