import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoman/lib.dart';

class Routes {
  static dynamic route() {
    return {
      ConstantsRoutes.splash: (BuildContext context) {
        context.read<TodoBloc>().add(FetchTodos());
        return const SplashPage();
      },
    };
  }

  static Route? onGenerateRoute(RouteSettings settings) {
    final String pathElement = settings.name ?? '';
    if (pathElement.isEmpty) {
      return null;
    }
    switch (pathElement) {
      case ConstantsRoutes.home:
        return CustomRoute<bool>(
            builder: (BuildContext context) => const HomeView());

      default:
        return onUnknownRoute(const RouteSettings(name: '/Feature'));
    }
  }

  static Route onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'UnknownRoute',
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Text('${settings.name!.split('/')[1]} Comming soon..'),
        ),
      ),
    );
  }
}
