import 'package:flutter_modular/flutter_modular.dart';
import 'package:smart_app_modular/modules/home/pages/home_page.dart';
import 'package:smart_app_modular/modules/home/pages/settings_page.dart';

import 'package:smart_app_modular/routes/routes.dart';

class HomeModule extends Module {
  @override
  void routes(r) {
    r.child(Routes.home.home, child: (_) => const HomePage());
    r.child(Routes.home.settings, child: (_) => const SettingsPage());
  }
}
