import 'package:flutter_modular/flutter_modular.dart';
import 'package:smart_app_modular/modules/auth/cubit/auth_cubit.dart';
import 'package:smart_app_modular/modules/auth/pages/login_page.dart';
import 'package:smart_app_modular/modules/auth/pages/register_page.dart';
import 'package:smart_app_modular/modules/auth/services/supabase_auth_service.dart';
import 'package:smart_app_modular/routes/routes.dart';

class AuthModule extends Module {
  @override
  void binds(i) => [
    i.addSingleton(AuthService.new),
    i.addSingleton<AuthCubit>(() => AuthCubit(i())),
  ];

  @override
  void routes(r) {
    r.child(Routes.auth.login, child: (_) => LoginPage());
    r.child(Routes.auth.register, child: (_) => RegisterPage());
  }
}
