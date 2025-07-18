import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_app_modular/modules/chat/domain/message_model.dart';

class MessageBubble extends StatelessWidget {
  final MessageEntitiy message;
  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isMe = !message.isFromCompany;
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMe ? (Colors.blue) : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              message.content,
              style: TextStyle(color: isMe ? Colors.white : Colors.black),
            ),

            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
