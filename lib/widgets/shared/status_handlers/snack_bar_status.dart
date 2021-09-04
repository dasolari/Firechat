import 'package:flutter/material.dart';

enum Status {
  ERROR, 
  SUCCESS, 
  INFO,
}

enum Shape {
  FIXED,
  ROUNDED,
}

Map _statusColor = {
  Status.ERROR: Colors.red[800],
  Status.SUCCESS: Colors.green[600],
  Status.INFO: Colors.blueGrey[300],
};

Map _shapeSelector = {
  Shape.FIXED: {
    'behavior': SnackBarBehavior.fixed, 
    'shape': null 
  },
  Shape.ROUNDED: { 
    'behavior': SnackBarBehavior.floating, 
    'shape': RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)) 
  },
};

// Change the SnackBar shape here
const shape = Shape.FIXED; // or Shape.ROUNDED

void statusHandler(BuildContext context, String text, Status status) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text, style: TextStyle(fontSize: 17.0)),
      duration: const Duration(milliseconds: 2500),
      backgroundColor: _statusColor[status],
      elevation: 4.0,
      padding: const EdgeInsets.fromLTRB(20.0, 5.0, 0.0, 5.0),
      behavior: _shapeSelector[shape]['behavior'],
      shape: _shapeSelector[shape]['shape'],
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'Close',
        onPressed: () => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
      ),
    ),
  );
}
