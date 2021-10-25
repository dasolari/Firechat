import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:firechat/widgets/chats/panel_info.dart';


class CreateChatSlideUp extends StatefulWidget {
  const CreateChatSlideUp({ Key? key }) : super(key: key);

  @override
  CreateChatSlideUpState createState() => CreateChatSlideUpState();
}

class CreateChatSlideUpState extends State<CreateChatSlideUp> {
  
  PanelController _pc = new PanelController();

  Future<void> openPanel() async {
    await _pc.open();
  }

  Future<void> closePanel() async {
    await _pc.close();
  }
  
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      panel: PanelInfo(),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(26.0),
        topRight: Radius.circular(26.0)
      ),
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
      maxHeight: MediaQuery.of(context).size.height - 250,
      minHeight: 0,
      backdropEnabled: true,
      isDraggable: false,
      defaultPanelState: PanelState.CLOSED,
      parallaxEnabled: true,
      controller: _pc,
    );
  }
}
