import 'package:flutter/material.dart';

class Overview extends StatefulWidget {
  final Map<dynamic, dynamic> details;
  const Overview({Key? key, required this.details}) : super(key: key);

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
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
                Padding(
                  padding: const EdgeInsets.all(20.0),
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
          SizedBox(
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

        ],
      ),
    );
  }
}
