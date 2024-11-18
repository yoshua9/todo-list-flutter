import 'package:flutter/material.dart';
import 'package:todoman/lib.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: size.width * 0.8,
            child: Image.asset(ConstantsLogos.logo, fit: BoxFit.fitWidth)),
        const Text(
          'Aun no tienes tarea..\n Intenta creando una🙂 ',
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
