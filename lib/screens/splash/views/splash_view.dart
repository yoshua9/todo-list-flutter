import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoman/lib.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoBloc, TodoState>(
      listener: (context, state) {
        if (state.status == StatusApp.success) {
          context.read<TodoBloc>().add(CleanStatus());
          Navigator.of(context).popAndPushNamed(ConstantsRoutes.home);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ConstantsLogos.logo,
                fit: BoxFit.fitWidth,
              ),
              Gaps.vGap10,
              const Text(
                'Estamos cargando tus tareas...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.vGap20,
              const CircularProgressIndicator(
                color: ColorsApp.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
