import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const PRODUCT_ITEM(),
    ),
  );
}

class PRODUCT_ITEM extends StatefulWidget {
  const PRODUCT_ITEM({Key? key}) : super(key: key);

  @override
  State<PRODUCT_ITEM> createState() => _PRODUCT_ITEMState();
}

class _PRODUCT_ITEMState extends State<PRODUCT_ITEM> {
  double sliderValue = 0;
  double? price;

  List<Map<String, dynamic>> myContainer = [
    {
      'number': '1',
      'product': 'Watch',
      'category': 'wearables',
      'price': 3000,
    },
    {
      'number': '2',
      'product': 'Goggle',
      'category': 'wearables',
      'price': 199,
    },
    {
      'number': '3',
      'product': 'Shoes',
      'category': 'wearables',
      'price': 999,
    },
    {
      'number': '4',
      'product': 'Shirt',
      'category': 'wearables',
      'price': 799,
    },
    {
      'number': '5',
      'product': 'Jeans',
      'category': 'wearables',
      'price': 1499,
    },
    {
      'number': '6',
      'product': 'T-Shirt',
      'category': 'wearables',
      'price': 600,
    },
    {
      'number': '7',
      'product': 'Cap',
      'category': 'wearables',
      'price': 299,
    },
    {
      'number': '8',
      'product': 'Laptop',
      'category': 'gadget',
      'price': 60000,
    },
    {
      'number': '9',
      'product': 'Computer',
      'category': 'gadget',
      'price': 35000,
    },
    {
      'number': '10',
      'product': 'Mobile',
      'category': 'gadget',
      'price': 25000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Products Filter",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
        actions: const [
          Icon(Icons.apps),
          SizedBox(width: 10),
        ],
        centerTitle: true,
        backgroundColor: const Color(0xff2196f3),
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Slider(
                min: 0,
                max: 80000,
                value: sliderValue,
                divisions: 800,
                label: "${sliderValue.toInt()}",
                onChanged: (value) {
                  setState(() {
                    sliderValue = value;
                  });
                },
              ),
              Text(
                "All Products < Rs. ${sliderValue.toInt()}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 0.5,
                ),
              ),
              ...myContainer.map(
                (e) {
                  return (e['price'] <= sliderValue)
                      ? Column(
                          children: [
                            Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width * .95,
                              margin: const EdgeInsets.only(top: 13),
                              padding:
                                  const EdgeInsets.only(left: 10, right: 20),
                              decoration: BoxDecoration(
                                color: const Color(0xffffffff),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xffD7D7D7),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(.5, .5),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    e['number'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Spacer(flex: 1),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e['product'],
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        e['category'],
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(flex: 19),
                                  Text(
                                    "Rs. ${e['price']}",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Container();
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xfffafafa),
    );
  }
}
