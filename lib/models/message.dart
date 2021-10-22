class Message {
  final String id;
  final String chatId;
  final String userId;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;

  Message({
    required this.id,
    required this.chatId,
    required this.userId,
    required this.content,
    required this.createdAt,
    required this.updatedAt
  });

  factory Message.fromMap(Map data) {
    return Message(
      id: data['id'] ?? 'default', 
      chatId: data['chatId'] ?? 'default_chatId', 
      userId: data['userId'] ?? 'default_userId', 
      content: data['content'] ?? 'defautl message',
      createdAt: data['createdAt'] ?? new DateTime(2021, 1, 1),
      updatedAt: data['updatedAt'] ?? new DateTime(2021, 1, 1)
    );
  }
}
