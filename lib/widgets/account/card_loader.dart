import 'package:flutter/material.dart';
import 'package:firechat/widgets/shared/loading/loading_container.dart';


class CardLoader extends StatelessWidget {
  const CardLoader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: LoadingContainer(size: 36.0, color: Theme.of(context).primaryColor),
      ),
    );
  }
}