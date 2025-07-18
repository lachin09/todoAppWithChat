import 'package:smart_app_modular/modules/chat/domain/message_model.dart';

abstract class ChatDatasource {
  Stream<List<MessageEntitiy>> getMessages(String userId);
  Future<void> sendMessage(String userId, content);
}
