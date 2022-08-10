import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  final String hotelName;
  final List count;
  final List<Map> item;
  const Payment(
      {Key? key,
      required this.hotelName,
      required this.count,
      required this.item})
      : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  List a = [];
  int? Total = 0;
  double Tax = 0.0;
  double Gtotal = 0.0;
  String payment = "";
  @override
  initState() {
    addItems();
    super.initState();
  }

  void addItems() {
    for (int i = 0; i < widget.count.length; i++) {
      if (widget.count[i] > 0) {
        a.add(widget.item[i]);
        a[i]['Count'] = (widget.count[i]).toString();
        a[i]['Tprice'] = widget.item[i]["Price"] * widget.count[i];
        Total = (Total! + a[i]['Tprice']) as int?;
        a[i]['Tprice'] = widget.item[i]["Tprice"].toString();
      }
    }
    Tax = (0.06) * Total!;
    Gtotal = (Total! + Tax);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  iconSize: 25,
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  // the method which is called
                  // when button is pressed
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  widget.hotelName,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Your order",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 250,
              width: 500,
              child: ListView.builder(
                itemCount: a.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  a[index]["Fname"],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "₹${a[index]["Price"]}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  child: Text(
                                    a[index]['Count'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  child: Text(
                                    "₹${a[index]['Tprice']}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              color: Colors.grey,
              height: 1,
              width: double.infinity,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Item Total",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Taxes & Charges",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Grand Total",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "₹${Total.toString()}",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          "₹${Tax.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "₹${Gtotal.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey,
              height: 1,
              width: double.infinity,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Payment Method",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        "UPI",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      leading: Radio(
                          value: "upi",
                          groupValue: payment,
                          onChanged: (value) {
                            setState(() {
                              payment = value.toString();
                            });
                          }),
                    ),
                    ListTile(
                      title: const Text(
                        "Cash",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      leading: Radio(
                          value: "cash",
                          groupValue: payment,
                          onChanged: (value) {
                            setState(() {
                              payment = value.toString();
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){

                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 350,
                  decoration: const BoxDecoration(
                    color: Color(0xff04D4F0),
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  ),
                  child: const Text(
                  'Pay Order',
                  style: TextStyle(fontSize: 20.0),
                ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
