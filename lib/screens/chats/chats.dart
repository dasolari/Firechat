import 'package:flutter/material.dart';
import 'package:firechat/models/chat.dart';
import 'package:provider/provider.dart';
import 'package:firechat/widgets/chats/chat.dart';
import 'package:firechat/widgets/chats/create_chat.dart';
import 'package:firechat/widgets/chats/create_chat_button.dart';

class Chats extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => Chats(),
  );

  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  final GlobalKey<CreateChatSlideUpState> _panelState = GlobalKey<CreateChatSlideUpState>();
  bool _isPanelOpen = false;

  void _togglePanel() {
    if (_isPanelOpen) {
      _panelState.currentState!.closePanel();
    } else {
      _panelState.currentState!.openPanel();
    }
    setState(() => _isPanelOpen = !_isPanelOpen);
  }

  @override
  Widget build(BuildContext context) {
    final chats = Provider.of<List<Chat>>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chats',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 8,
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: chats.length == 0 ?
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.message_outlined, 
                  size: 90,
                  color: Theme.of(context).primaryColor,
                ),
                Text('No chats yet 😔', style: TextStyle(fontSize: 20)),
                Text('You can create one below', style: TextStyle(fontSize: 20))
              ],
            )
            :
            ListView(
              children: chats.map((chat) => new ChatTile(name: chat.name)).toList()
            ),
          ),
          CreateChatSlideUp(key: _panelState),
        ],
      ),
      floatingActionButton: CreateChatButton(togglePanel: _togglePanel),
    );
  }
}