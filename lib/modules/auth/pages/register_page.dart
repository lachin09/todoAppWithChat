import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smart_app_modular/%20services/navigation_services.dart';
import 'package:smart_app_modular/modules/auth/cubit/auth_cubit.dart';
import 'package:smart_app_modular/modules/auth/cubit/auth_state.dart';

class RegisterPage extends StatelessWidget {
  final passwordCtrl = TextEditingController();
  final emailCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = Modular.get<AuthCubit>();

    return Scaffold(
      appBar: AppBar(title: Text("Register Page")),
      body: BlocConsumer<AuthCubit, AuthState>(
        bloc: cubit,
        listener: (context, state) {
          if (state is AuthSuccess) {
            NavigationService.toHomePage();
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: emailCtrl,
                  decoration: InputDecoration(label: Text("Email...")),
                ),
                TextField(
                  controller: passwordCtrl,
                  decoration: InputDecoration(label: Text("Password...")),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    cubit.register(
                      emailCtrl.text.trim(),
                      passwordCtrl.text.trim(),
                    );
                  },
                  child: const Text('Register'),
                ),
                if (state is AuthError)
                  Text(state.message, style: TextStyle(color: Colors.red)),
              ],
            ),
          );
        },
      ),
    );
  }
}
