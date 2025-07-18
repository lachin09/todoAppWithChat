import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smart_app_modular/modules/app_module.dart';
import 'package:smart_app_modular/modules/to_do/models/todo_model.dart';
import 'package:smart_app_modular/routes/routes.dart';
import 'package:smart_app_modular/supabase_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>('tasks');
  await Supabase.initialize(url: supaBaseUrl, anonKey: supabaseAnonkey);

  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(Routes.home.getModule());

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'My 2 App',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: Modular.routerConfig,
    );
  }
}
