import 'package:flutter/material.dart';

class Overview extends StatefulWidget {
  final Map<dynamic, dynamic> details;
  const Overview({Key? key, required this.details}) : super(key: key);

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
String total(){
  int x = 0;
  for(int i = 0; i < widget.details['Price'].length; i++){
    x += int.parse(widget.details['Price'][i]);
  }
 return x.toString();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 100,
            width: 500,
            color: Colors.black,
            child: Row(
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
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Order Summary",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            child: Text(
              "Order No: ${widget.details['Order No'].toString()}",
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          Container(
            child: Text(
              widget.details['RestName'],
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff04D4F0),
                border: Border.all(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(15),
              ),

              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "Food Items",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        "Quantity",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        "Price",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 250,
                    width: 450,
                    child: ListView.builder(
                        itemCount: widget.details["Items"].length,
                        itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: 220,
                                    child: Text(
                                      widget.details["Items"][index],
                                      style: const TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 40,
                                    child: Text(
                                      widget.details["Quantity"][index],
                                      style: const TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 80,
                                    child: Text(
                                      "₹${widget.details["Price"][index]}",
                                      style: const TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ),
                          );
                        }
                    ),
                  ),
                ],
              ),
            ),
          ),

          Row(
            children: [
              const SizedBox(
                width: 120,
              ),
              const Text("Total Price",
              style: TextStyle(
                fontSize: 30,
              ),),
              const SizedBox(
                width: 90,
              ),
              Text("₹${total()}",
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
