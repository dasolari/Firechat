import 'package:flutter/material.dart';
import 'package:firechat/navigation/tab_navigator.dart';


class App extends StatelessWidget {
  App({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabNavigator();
  }
}


// class App extends StatefulWidget {
//   App({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _AppState createState() => _AppState();
// }

// class _AppState extends State<App> {
//   int _counter = 0;
//   int _selectedIndex = 0;


//   void _incrementCounter() {
//     setState(() => _counter++);
//   }

//   void _decrementCounter() {
//     setState(() => {
//       if (_counter > 0) _counter--
//     });
//   }

//   void _onTapped(int index) {
//     setState(() => _selectedIndex = index);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         centerTitle: true,
//         elevation: 8,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'The value of the counter is:',
//               style: TextStyle(
//                 fontSize: 18,
//               ),
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline3,
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.teal,
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.Main),
//             label: 'Main',
//             backgroundColor: Colors.teal,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.chat),
//             label: 'Messages',
//             backgroundColor: Colors.blue[800],
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//             backgroundColor: Colors.red[600],
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         showUnselectedLabels: false,
//         showSelectedLabels: true,
//         selectedItemColor: Colors.white,
//         onTap: _onTapped,
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           FloatingActionButton(
//             onPressed: _decrementCounter,
//             tooltip: 'Decrement',
//             backgroundColor: Colors.teal,
//             child: Icon(
//               Icons.remove,
//               size: 27,
//             ),
//           ),
//           SizedBox(width: 15),
//           FloatingActionButton(
//             onPressed: _incrementCounter,
//             tooltip: 'Increment',
//             backgroundColor: Colors.teal,
//             child: Icon(
//               Icons.add,
//               size: 27,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
