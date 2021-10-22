import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firechat/models/chat.dart';


class ChatDatabaseService {
  final String uid;
  final CollectionReference chatsCollection = FirebaseFirestore.instance.collection('chats');

  ChatDatabaseService({ required this.uid });

  // Chat List Stream
  Stream<List<Chat>> get chats {
    return chatsCollection.snapshots().map(_chatDataFromSnapshot);
  }

  // Adapt chat list to Chat model
  List<Chat> _chatDataFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((dynamic doc) {
      return Chat.fromMap(doc.data());
    }).toList();
  }
}
