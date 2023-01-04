import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food/Backend/restb.dart';
// import 'package:food/orders.dart';
// import 'package:food/payment.dart';
import 'package:food/rest1.dart';
// import 'package:food/reviews.dart';

class Restaurant extends StatefulWidget {
  const Restaurant({Key? key}) : super(key: key);

  @override
  State<Restaurant> createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  List<Map<dynamic,dynamic>> restName = [
    {"RestName": "RESTAURANT 1", "Rating": 4.0, "Place":"California", "Type":"Non-veg", "Image":"assets/pexels-daria-shevtsova-704982.jpg"},
    {"RestName": "RESTAURANT 2", "Rating": 4.5, "Place":"Paris", "Type":"Veg", "Image":"assets/pexels-igor-starkov-1307698.jpg"},
    {"RestName": "RESTAURANT 3", "Rating": 5.0, "Place":"Sweden","Type":"Non-veg", "Image":"assets/pexels-lisa-776538.jpg"},
  ];
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
  final RestName rest = RestName();
  @override
  void initState() {
    // TODO: implement initState
    fetchrest();
    super.initState();
  }
  List names = [];
  fetchrest()async{
    dynamic resultant = await rest.makeGetRequest();
    setState(() {
      names = resultant;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // bottomNavigationBar: BottomNavigationBar(
        //     items: const <BottomNavigationBarItem>[
        //       BottomNavigationBarItem(
        //           icon: Icon(Icons.home),
        //           label: "Home",
        //           backgroundColor: Color(0xff04ECF0)
        //       ),
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
        //     elevation: 5),
        body: ListView.builder(
            itemCount: names.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Menu(restName: names[index])),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.grey.withOpacity(1.0), BlendMode.multiply),
                          image:  AssetImage(
                            restName[index]['Image'],
                          ),
                          fit: BoxFit.cover),
                      borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                    ),
                    height: 224,
                    width: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            names[index]['res1'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RatingBarIndicator(
                              itemSize: 30,
                              rating: double.parse(names[index]['rate']),
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
