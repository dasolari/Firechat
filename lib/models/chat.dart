class Chat {
  final String id;
  final String type;
  final String name;
  final String picture;
  final List<String> participants;

  Chat({
    required this.id,
    required this.type,
    required this.name,
    required this.picture,
    required this.participants
  });

  factory Chat.fromMap(Map data) {
    return Chat(
      id: data['id'] ?? 'default',
      type: data['type'] ?? 'chat',
      name: data['name'] ?? 'My Default Chat', 
      picture: data['lastName'] ?? 'default', 
      participants: data['participants'] ?? ['default_1', 'default_2']
    );
  }
}
