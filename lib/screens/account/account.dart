import 'package:flutter/material.dart';
import 'package:firechat/widgets/account/avatar_container.dart';
import 'package:firechat/widgets/account/logout_button.dart';
import 'package:firechat/widgets/account/edit_account_button.dart';
import 'package:firechat/widgets/account/help_button.dart';
import 'package:firechat/widgets/account/notifications_button.dart';
import 'package:firechat/widgets/account/language_button.dart';


class Account extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => Account(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 8,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            AvatarContainer(),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                addAutomaticKeepAlives: false,
                children: <Widget>[
                  EditAccountButton(),
                  NotificationsButton(),
                  LanguageButton(),
                  HelpButton(),
                  LogoutButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
