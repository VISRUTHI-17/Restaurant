
import 'package:flutter/material.dart';
import 'package:food/summary.dart';
// import 'package:food/rest.dart';
class Orders extends StatefulWidget {

  const Orders({Key? key,}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  Color select_color(String x){
    if(x == "Delivered") {
     return const Color(0xff4CBB17);
    }
    else if(x == "Pending"){
      return const Color(0xffE3963E);
    }
    else{
      return const Color(0xffFF0000);
    }
  }
  List<Map<dynamic, dynamic>> details = [
    {
      "RestName":"Restaurant 1",
      "Order No": "AB1234",
      "Total Price": "₹1000",
      "Status": "Delivered",
      "items": ['Briyani','Parotta','Nuggets'],
    },
    {
      "RestName":"Restaurant 2",
      "Order No": "BT6542",
      "Total Price": "₹4000",
      "Status": "Pending",
      "items": ['Briyani','Parotta','Nuggets'],
    },
    {
      "RestName":"Restaurant 1",
      "Order No": "PU0987",
      "Total Price": "₹500",
      "Status": "Cancelled",
      "items": ['Briyani','Parotta','Nuggets'],
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 100,
            width: 500,
            color: Colors.black,
           child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("Orders",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),),
              ),
          ),
          Container(
            height: 716,
            width: 400,
            child: ListView.builder(
              itemCount: details.length,
              itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Overview(details: details[index],)),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: const Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                    details[index]['Order No'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20,bottom: 20),
                                  child: Text(
                                    details[index]['RestName'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),

                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text(
                                  details[index]['Total Price'].toString(),
                                  style: const TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Container(
                                  alignment: Alignment.center,
                                  height:35,
                                  width:100,
                                  decoration: BoxDecoration(
                                    color: select_color(details[index]['Status'].toString()),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      details[index]['Status'],
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                );
              }

            ),
          ),
        ],
      ),

    );
  }
}
