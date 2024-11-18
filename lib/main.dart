import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoman/lib.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final TodoRepository todoRepository = TodoRepository(
    apiClient: TodoApiClient(httpClient: http.Client()),
  );

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp(todoRepository: todoRepository));
}

class MyApp extends StatelessWidget {
  final TodoRepository todoRepository;

  const MyApp({super.key, required this.todoRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(todoRepository: todoRepository),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        routes: Routes.route(),
        onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
        onUnknownRoute: (settings) => Routes.onUnknownRoute(settings),
        initialRoute: ConstantsRoutes.splash,
      ),
    );
  }
}
