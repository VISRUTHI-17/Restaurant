import 'package:flutter/material.dart';
import 'package:food/rest.dart';

import 'orders.dart';
class Reviews extends StatefulWidget {
  const Reviews({Key? key}) : super(key: key);

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  final TextEditingController _Textcontroller = TextEditingController();
  // int _selectedIndex = 0;
  // static const List _widgetOptions = [
  //   Restaurant(),
  //   Orders(),
  //   Reviews(),
  // ];
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => (_widgetOptions.elementAt(_selectedIndex))),
  //     );
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              height: 100,
              width: 500,
              color: Colors.black,
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("Reviews",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _Textcontroller,
                minLines: null,
                maxLines: 10,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                    hintText: 'Enter A Message Here',
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )
                ),
              ),
            ),

            ElevatedButton(
              style:ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xff04D4F0)),
              ) ,
              onPressed: (){
              setState(() {
                _Textcontroller.notifyListeners();
              });
            },child: const Text("Post Review",
              style: TextStyle(
                fontSize: 20,
              ),
                ),)
          ],
        ),
      ),
    );
  }
}
