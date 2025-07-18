import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_app_modular/modules/chat/cubit/chat_state.dart';
import 'package:smart_app_modular/modules/chat/domain/chat_repo.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo _chatRepo;
  final String _userId;

  late StreamSubscription _subscription;

  ChatCubit(this._chatRepo, {required String userId})
    : _userId = userId,
      super(ChatInitial()) {
    _init();
  }

  void _init() {
    _subscription = _chatRepo
        .getMessage(_userId)
        .listen(
          (messages) => emit(ChatLoaded(messages)),
          onError: (error) => emit(ChatError(error.toString())),
        );
  }

  Future<void> sendMessage(String content) async {
    try {
      await _chatRepo.sendMessage(_userId, content);
    } catch (e) {
      emit(ChatError("failed to send message"));
    }
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
