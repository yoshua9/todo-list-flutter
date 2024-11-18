import 'package:flutter/material.dart';
import 'package:todoman/lib.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(38, 35, 54, 1),
        floatingActionButton: ButtonToCreateTask(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gaps.vGap20,
              Text(
                'Hola, Usuari@',
                style: TextStyle(
                    color: ColorsApp.colorTextTitle,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
              Gaps.vGap10,
              CardTotalTasks(),
              Gaps.vGap10,
              Expanded(child: TabsHome()),
              Gaps.vGap10,
            ],
          ),
        ),
      ),
    );
  }
}
