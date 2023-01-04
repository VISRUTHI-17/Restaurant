import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:counter_button/counter_button.dart';
import 'package:food/payment.dart';
import 'Backend/detailsb.dart';

class Menu extends StatefulWidget {
  final Map<dynamic, dynamic> restName;
  const Menu({Key? key, required this.restName}) : super(key: key);
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {



  List pay = [];

  List<Map<dynamic, dynamic>> items = [
    {
      "Timing": "In Lunch",
      "Fname": "Briyani",
      "Rating": 4.5,
      "Price": 150,
      "Image": "assets/pexels-rajesh-tp-1624487.jpg"
    },
    {
      "Timing": "In Breakfast",
      "Fname": "Dosa",
      "Rating": 4.0,
      "Price": 40,
      "Image": "assets/pexels-saveurs-secretes-5560763.jpg"
    },
    {
      "Timing": "In Dinner",
      "Fname": "Shawarma",
      "Rating": 4.9,
      "Price": 120,
      "Image": "assets/pexels-rajdeepcraft-6416559.jpg"
    },
  ];

  List count = [];
  bool isVisible = false;
  List results = [];
  String choice = "";
  final Details det = Details();
  List details = [];

  @override
  initState() {
    RestDetail();
    // count = List.filled(details.length, 0);
    super.initState();
  }

  RestDetail()async{
    dynamic res = await det.makeGetRequest(widget.restName["id"]);
    setState(() {
      details = res;
    });
  }


  // String add() {
  //   int? sum = 0;
  //   for (int i = 0; i < count.length; i++) {
  //     sum = (sum! + count[i]) as int?;
  //   }
  //   if (sum == 1) {
  //     return "${sum.toString()} ITEM";
  //   } else {
  //     return "${sum.toString()} ITEMS";
  //   }
  // }
  // String addprice() {
  //   int? total = 0;
  //   for (int i = 0; i < count.length; i++) {
  //     total = (total! + count[i]*pay[i]['price']) as int?;
  //   }
  //   return "₹${total.toString()} plus taxes";
  // }


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
  //       MaterialPageRoute(builder: (context) => (_widgetOptions.elementAt(_selectedIndex))),
  //     );
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    setState(() {
      if (choice.isEmpty) {
        // if the search field is empty or only contains white-space, we'll display all users
        results = details;
      } else {
        results = details
            .where((user) =>
                user["name"].toLowerCase().contains(choice.toLowerCase()))
            .toList();
        // we use the toLowerCase() method to make it case-insensitive
      }
    });

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // bottomNavigationBar: BottomNavigationBar(
        //     items: const <BottomNavigationBarItem>[
        //       BottomNavigationBarItem(
        //           icon: Icon(Icons.food_bank_outlined),
        //           label: "Orders",
        //           backgroundColor: Color(0xff04ECF0)
        //       ),
        //       BottomNavigationBarItem(
        //           icon: Icon(Icons.reviews),
        //           label: "Reviews",
        //           backgroundColor: Color(0xff04ECF0)
        //       ),
        //     ],
        //     type: BottomNavigationBarType.shifting,
        //     currentIndex: _selectedIndex,
        //     selectedItemColor: Colors.black,
        //     iconSize: 40,
        //     onTap: _onItemTapped,
        //     elevation: 5
        // ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              width: 500,
              height: 114,
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      IconButton(
                        iconSize: 25,
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        // the method which is called
                        // when button is pressed
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          widget.restName['res1'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 3),
                    child: Text(
                      widget.restName['place'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 25,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 3),
                    child: Row(
                      children: [
                        Icon(
                          Icons.center_focus_strong_sharp,
                          color: (widget.restName['type'] == 'Non-veg')
                              ? Colors.red
                              : Colors.green,
                        ),
                        Text(
                          widget.restName['type'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 450,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search Customers',
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      labelText: 'Search',
                      suffixIcon: const Icon(Icons.search)),
                  onChanged: (value) => {
                    setState(() {
                      choice = value;
                    })
                  },
                ),
              ),
            ),
            Container(
              height: (isVisible == false) ? 610 : 488,
              child: ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 220,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    results[index]['time'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    results[index]['name'],
                                    style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RatingBarIndicator(
                                    itemSize: 20,
                                    rating:  double.parse(results[index]['rating']),
                                    direction: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "₹${( results[index]['price']).toString()}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            results[index]['Image'],
                                          ),
                                          fit: BoxFit.cover),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20.0)),
                                    ),
                                    height: 150,
                                    width: 150,
                                  ),
                                ),
                                CounterButton(
                                  loading: false,
                                  onChange: (int val) {
                                    setState(() {
                                      pay.add(results[index]);
                                      //   int d = 0;
                                      //   count[index] = (val < 0) ? 0 : val;
                                      //   for (int i = 0; i < count.length; i++) {
                                      //     if (count[i] == 0) {
                                      //       d = d + 1;
                                      //     } else {}
                                      //   }
                                      //   if (d == count.length) {
                                      //     isVisible = false;
                                      //   } else {
                                      //     isVisible = true;
                                      //   }
                                      });
                                  },
                                  count: 0,
                                  countColor: Colors.black,
                                  buttonColor: Colors.black,
                                  progressColor: Colors.black,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Visibility(
                visible: isVisible,
                child: Container(
                  height: (isVisible == false) ? 0 : 55,
                  width: 500,
                  color: Colors.black54,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.all(4.0),
                          //   child: Text(
                          //     add(),
                          //     style: const TextStyle(
                          //       fontSize: 15,
                          //       color: Colors.white,
                          //     ),
                          //   ),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.all(4.0),
                          //   child: Text(
                          //     addprice(),
                          //     style: const TextStyle(
                          //       fontSize: 18,
                          //       color: Colors.white,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      TextButton(
                        child: const Text(
                          "NEXT >",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          String hotelName = (widget.restName['res1']).toString();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  Payment(hotelName:hotelName,count:count,item:items)),

                          );
                        },
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
