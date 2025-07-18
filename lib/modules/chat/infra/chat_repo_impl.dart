import 'package:smart_app_modular/modules/chat/domain/chat_repo.dart';
import 'package:smart_app_modular/modules/chat/domain/message_model.dart';
import 'package:smart_app_modular/modules/chat/infra/chat_datasource.dart';

class ChatRepoImpl implements ChatRepo {
  final ChatDatasource datasource;

  ChatRepoImpl(this.datasource);

  @override
  Stream<List<MessageEntitiy>> getMessage(String userId) =>
      datasource.getMessages(userId);

  @override
  Future<void> sendMessage(String userId, content) =>
      datasource.sendMessage(userId, content);
}
