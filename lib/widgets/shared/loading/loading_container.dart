import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingContainer extends StatelessWidget {
  LoadingContainer({required this.size, this.color}) : super();

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitThreeBounce(
          color: color != null ? color : Colors.white,
          size: size,
        ),
      ),
    );
  }
}