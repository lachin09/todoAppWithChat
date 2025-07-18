import 'package:flutter/material.dart';
import 'package:smart_app_modular/%20services/navigation_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => NavigationService.toChatPage(),
          icon: Icon(Icons.chat),
        ),
        title: const Text('Home Page'),
      ),
      body: Center(child: Text("tap to icon bottom to go to the tasks ")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => NavigationService.toAddTaskPage(),

        child: const Icon(Icons.note),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(title: Text("Home Page")),
    //   body: Center(
    //     child: ElevatedButton(
    //       onPressed:
    //           () => Modular.to.pushNamed(
    //             Routes.home.getRoute(Routes.home.settings),
    //           ),
    //       child: Text("go to settings page"),
    //     ),
    //   ),
    // );
  }
}
