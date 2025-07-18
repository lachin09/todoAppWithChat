// // bloc/chat_bloc.dart
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:smart_app_modular/modules/chat/models/message_model.dart';
// import 'package:smart_app_modular/modules/chat/services/supabase_chat_services.dart';

// part 'chat_event.dart';
// part 'chat_state.dart';

// class ChatBloc extends Bloc<ChatEvent, ChatState> {
//   final ChatService chatService;

//   ChatBloc(this.chatService) : super(ChatInitial()) {
//     on<ChatSendMessage>((event, emit) async {
//       await chatService.sendMessage(event.userId, event.message);
//     });

//     on<ChatSubscribe>((event, emit) {
//       emit(ChatLoading());
//       final subscription = chatService.messagesStream().listen((messages) {
//         add(ChatMessagesUpdated(messages));
//       });

//       // TODO: manage subscription cancel on bloc close if needed
//     });

//     on<ChatMessagesUpdated>((event, emit) {
//       emit(ChatLoaded(event.messages));
//     });
//   }
// }
