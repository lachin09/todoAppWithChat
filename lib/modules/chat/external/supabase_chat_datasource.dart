import 'package:smart_app_modular/modules/chat/domain/message_model.dart';
import 'package:smart_app_modular/modules/chat/infra/chat_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseChatDatasource implements ChatDatasource {
  final SupabaseClient _supabase;

  SupabaseChatDatasource(this._supabase);

  @override
  Stream<List<MessageEntitiy>> getMessages(String userId) {
    return _supabase
        .from("messages")
        .stream(primaryKey: ["id"])
        .order("sent_at", ascending: true)
        .map(
          (data) =>
              data
                  .where(
                    (msg) =>
                        msg["sender_id"] == userId ||
                        msg["is_from_company"] == true,
                  )
                  .map(
                    (msg) => MessageEntitiy(
                      id: msg["id"],
                      content: msg["content"],
                      senderId: msg["sender_id"],
                      sentAt: DateTime.parse(msg["sent_at"]),
                      isFromCompany: msg["is_from_company"],
                    ),
                  )
                  .toList(),
        );
  }

  @override
  Future<void> sendMessage(String userId, content) async {
    await _supabase.from("messages").insert({
      "sender_id": userId,
      'content': content,
      "sent_at": DateTime.now().toIso8601String(),
      "is_from_company": false,
    });
  }
}
