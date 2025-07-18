class MessageEntitiy {
  final String id;
  final String senderId;

  final String content;
  final DateTime sentAt;
  final bool isFromCompany;

  MessageEntitiy({
    required this.id,
    required this.content,
    required this.senderId,
    required this.sentAt,
    required this.isFromCompany,
  });
}
