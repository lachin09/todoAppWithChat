import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smart_app_modular/modules/chat/cubit/chat_cubit.dart';
import 'package:smart_app_modular/modules/chat/cubit/chat_state.dart';
import 'package:smart_app_modular/modules/chat/widgets/message_bubble.dart';
import 'package:smart_app_modular/modules/chat/widgets/message_input.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final ChatCubit _cubit;

  @override
  void initState() {
    super.initState();
    // Получаем Cubit из Modular
    _cubit = Modular.get<ChatCubit>();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Company Chat')),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              bloc: _cubit,
              builder: (context, state) {
                if (state is ChatLoaded) {
                  return ListView.builder(
                    reverse: true,
                    itemCount: state.messages.length,
                    itemBuilder:
                        (context, index) =>
                            MessageBubble(message: state.messages[index]),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
          const MessageInput(),
        ],
      ),
    );
  }
}
