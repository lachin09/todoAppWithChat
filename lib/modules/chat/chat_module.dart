import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smart_app_modular/modules/auth/cubit/auth_cubit.dart';
import 'package:smart_app_modular/modules/chat/cubit/chat_cubit.dart';
import 'package:smart_app_modular/modules/chat/domain/chat_repo.dart';
import 'package:smart_app_modular/modules/chat/external/supabase_chat_datasource.dart';
import 'package:smart_app_modular/modules/chat/infra/chat_datasource.dart';
import 'package:smart_app_modular/modules/chat/infra/chat_repo_impl.dart';
import 'package:smart_app_modular/modules/chat/pages/chat_page.dart';
import 'package:smart_app_modular/routes/routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatModule extends Module {
  @override
  void binds(Injector i) {
    // Регистрируем зависимости
    i.add<ChatDatasource>(SupabaseChatDatasource.new);
    i.add<ChatRepo>(ChatRepoImpl.new);

    // Регистрируем ChatCubit с зависимостью от текущего пользователя
    i.add<ChatCubit>((i) {
      final authCubit = i.get<AuthCubit>();
      final userId = authCubit.state.user?.id ?? '';
      return ChatCubit(i.get<ChatRepo>(), userId: userId);
    });
  }

  @override
  void routes(RouteManager r) {
    r.child(Routes.chat.chatPage, child: (context) => const ChatPage());
  }
}
