import 'package:smart_app_modular/modules/chat/domain/message_model.dart';

abstract class ChatRepo {
  Stream<List<MessageEntitiy>> getMessage(String userId);
  Future<void> sendMessage(String userId, content);
}
