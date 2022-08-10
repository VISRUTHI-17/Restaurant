// import 'package:flutter/material.dart';
// import 'package:food/payment.dart';
// import 'package:food/rest.dart';
//
// import 'home1.dart';
//
// class Homepage extends StatefulWidget {
//   const Homepage({Key? key}) : super(key: key);
//
//   @override
//   State<Homepage> createState() => _HomepageState();
// }
//
// class _HomepageState extends State<Homepage> {
//   int _selectedIndex = 0;
//   static const List _widgetOptions = [
//     Restaurant(),
//     Payment(),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(
//       child: _widgetOptions.elementAt(_selectedIndex),
//     ),
//       bottomNavigationBar: BottomNavigationBar(
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.restaurant_menu),
//                 label: "Restaurants",
//                 backgroundColor: Color(0xff04ECF0)
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.payments),
//               label: "Payment",
//               backgroundColor: Color(0xff6AF2F0)
//             ),
//           ],
//           type: BottomNavigationBarType.shifting,
//           currentIndex: _selectedIndex,
//           selectedItemColor: Colors.black,
//           iconSize: 40,
//           onTap: _onItemTapped,
//           elevation: 5
//       ),
//
//     );
//   }
// }
