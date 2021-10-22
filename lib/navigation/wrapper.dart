import 'package:flutter/material.dart';
import 'package:firechat/navigation/app.dart';
import 'package:firechat/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:firechat/models/auth.dart';
import 'package:firechat/services/user.dart';
import 'package:firechat/services/chat.dart';
import 'package:firechat/models/user.dart';
import 'package:firechat/models/chat.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final auth = Provider.of<Auth?>(context);

    // Return App Wrapped in MultiProvider or Authenticate Widget
    if (auth == null) {
      return Authenticate();
    }
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(
          value: UserDatabaseService(uid: auth.uid).user,
          initialData: new User.fromMap({}),
        ),
        StreamProvider<List<Chat>>.value(
          value: ChatDatabaseService(uid: auth.uid).chats, 
          initialData: []
        ),
      ],
      child: App()
    );
  }
}