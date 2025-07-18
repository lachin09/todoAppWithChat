import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smart_app_modular/%20services/navigation_services.dart';
import 'package:smart_app_modular/modules/auth/cubit/auth_cubit.dart';
import 'package:smart_app_modular/modules/auth/cubit/auth_state.dart';

class LoginPage extends StatelessWidget {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = Modular.get<AuthCubit>();

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: BlocBuilder<AuthCubit, AuthState>(
        bloc: cubit,
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
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: passCtrl,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    cubit.login(emailCtrl.text.trim(), passCtrl.text.trim());
                    NavigationService.toHomePage();
                  },
                  child: const Text('Login'),
                ),
                TextButton(
                  onPressed: () {
                    NavigationService.toRegiserPage();
                  },
                  child: const Text('Go to Register'),
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
