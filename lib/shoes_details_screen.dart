import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shoes_store/offer_screen.dart';

class ShoesDetailsScreen extends StatefulWidget {
  const ShoesDetailsScreen(
      {super.key,
      required this.image,
      required this.name,
      required this.price,
      required this.isfavourate});
  final String name;
  final String price;
  final bool isfavourate;
  final String image;
  @override
  State<ShoesDetailsScreen> createState() => _ShoesDetailsScreenState();
}

class _ShoesDetailsScreenState extends State<ShoesDetailsScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController = TabController(length: 3, vsync: this);
  late AnimationController _animationController;
  late AnimationController _animationController2;
  late AnimationController _animationController3;
  late AnimationController _animationController4;
  late Animation<double> _lineAnimation;
  int index = 0;
  List<FlSpot> chart = [
    const FlSpot(0, 1),
    const FlSpot(1, 3),
    const FlSpot(2, 10),
    const FlSpot(3, 7),
    const FlSpot(4, 12),
    const FlSpot(5, 13),
    const FlSpot(6, 17),
    const FlSpot(7, 15),
    const FlSpot(8, 20),
  ];
  List<FlSpot> chart1 = [
    const FlSpot(0, 1),
    const FlSpot(1, 1),
    const FlSpot(2, 12),
    const FlSpot(3, 15),
    const FlSpot(4, 8),
    const FlSpot(5, 10),
    const FlSpot(6, 20),
    const FlSpot(7, 17),
    const FlSpot(8, 15),
  ];
  List<FlSpot> chart2 = [
    const FlSpot(0, 1),
    const FlSpot(1, 3),
    const FlSpot(2, 6),
    const FlSpot(3, 15),
    const FlSpot(4, 12),
    const FlSpot(5, 8),
    const FlSpot(6, 10),
    const FlSpot(7, 15),
    const FlSpot(8, 16),
  ];

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animationController2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animationController3 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animationController4 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _lineAnimation = Tween(begin: 0.0, end: 1.0).animate(_animationController4);

    _animationController.forward();
    _animationController2.forward();
    _animationController3.forward();
    _animationController4.forward();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    _animationController2.dispose();
    _animationController3.dispose();
    _animationController4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SlideTransition(
              position: Tween<Offset>(
                begin:
                    const Offset(0, -.1), // Start from outside the screen above
                end: Offset.zero, // Move to the original position
              ).animate(_animationController),
              // offset: Offset(0, _animationController.value * 10 - 10),
              child: AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Center(
                    child: Column(children: [
                      const Text(
                        "OTIS",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Shoes",
                        style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )
                    ]),
                  ),
                ),
                actions: const [
                  Icon(Icons.shopping_cart_outlined),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 200,
                          child: FadeTransition(
                            opacity: Tween<double>(begin: 0.0, end: 1.0)
                                .animate(_animationController2),
                            child: Text(widget.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            FadeTransition(
                              opacity: Tween(begin: 0.0, end: 1.0).animate(
                                CurvedAnimation(
                                  parent: _animationController3,
                                  curve: const Interval(0.0, 0.33),
                                ),
                              ),
                              child: const Text("Lowest Price",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold)),
                            ),
                            FadeTransition(
                              opacity: Tween(begin: 0.0, end: 1.0).animate(
                                CurvedAnimation(
                                  parent: _animationController3,
                                  curve: const Interval(0.33, 0.66),
                                ),
                              ),
                              child: Text(
                                "\$${widget.price}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            FadeTransition(
                              opacity: Tween(begin: 0.0, end: 1.0).animate(
                                CurvedAnimation(
                                  parent: _animationController3,
                                  curve: const Interval(0.66, 0.99),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Transform.rotate(
                                      angle: 4.65,
                                      child: const Icon(
                                        Icons.arrow_right_alt_outlined,
                                        color: Colors.green,
                                      )),
                                  const Text(
                                    "0.19 (2.5%)",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            FadeTransition(
                              opacity: Tween(begin: 0.0, end: 1.0).animate(
                                CurvedAnimation(
                                  parent: _animationController3,
                                  curve: const Interval(0.99, 1),
                                ),
                              ),
                              child: Icon(
                                size: 30,
                                Icons.favorite,
                                color: widget.isfavourate
                                    ? Colors.red
                                    : Colors.grey.shade300,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SlideTransition(
                        position:
                            Tween(begin: const Offset(-1, 0), end: Offset.zero)
                                .animate(CurvedAnimation(
                                    parent: _animationController2,
                                    curve: const Interval(0, 0.66))),
                        child: Image.asset(
                          widget.image,
                          height: 250,
                        )),
                    FadeTransition(
                      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: _animationController2,
                              curve: const Interval(0.66, 0.99))),
                      child: SlideTransition(
                        position: Tween<Offset>(
                                begin: const Offset(-.1, 0), end: Offset.zero)
                            .animate(CurvedAnimation(
                                parent: _animationController2,
                                curve: const Interval(0.66, 0.99))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("8",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black.withOpacity(0.2))),
                            Text("8.5",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black.withOpacity(0.3))),
                            Text("9",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(0.4))),
                            Text("9.5",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(0.5))),
                            Container(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 236, 242, 248),
                                  border: Border.all(
                                      width: 2, color: Colors.blueAccent),
                                ),
                                child: const Text("10",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black))),
                            Text("10.5",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(0.5))),
                            Text("11",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(0.4))),
                            Text("11.5",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black.withOpacity(0.3))),
                          ],
                        ),
                      ),
                    ),
                    FadeTransition(
                      opacity: Tween(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: _animationController2,
                          curve: const Interval(0.66, 0.99),
                        ),
                      ),
                      child: SlideTransition(
                        position:
                            Tween(begin: const Offset(0, -.1), end: Offset.zero)
                                .animate(
                          CurvedAnimation(
                            parent: _animationController2,
                            curve: const Interval(0.66, 0.99),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "LATEST SALES",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: TabBar(
                                onTap: (value) {
                                  setState(() {
                                    index = value;
                                  });
                                },
                                labelColor: Colors.blue,
                                isScrollable: true,
                                // tabAlignment: TabAlignment.center,
                                indicatorColor: Colors.blue,
                                indicatorSize: TabBarIndicatorSize.tab,
                                dividerColor: Colors.transparent,
                                controller: tabviewController,
                                tabs: const [
                                  Tab(
                                    child: Text("DAY"),
                                  ),
                                  Tab(
                                    child: Text("MONTH"),
                                  ),
                                  Tab(
                                    child: Text("YEAR"),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    FadeTransition(
                      opacity: _lineAnimation,
                      child: SizedBox(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        child: AspectRatio(
                          aspectRatio: 2,
                          child: LineChart(
                            LineChartData(
                              gridData: const FlGridData(
                                  drawHorizontalLine: true,
                                  drawVerticalLine: false),
                              titlesData: const FlTitlesData(
                                  rightTitles:
                                      AxisTitles(drawBelowEverything: false),
                                  topTitles:
                                      AxisTitles(drawBelowEverything: false),
                                  bottomTitles:
                                      AxisTitles(drawBelowEverything: false)),
                              borderData: FlBorderData(show: false),
                              lineBarsData: [
                                LineChartBarData(
                                  show: true,
                                  spots: index == 0
                                      ? chart
                                      : index == 1
                                          ? chart1
                                          : chart2,
                                  color: Colors.blueAccent,
                                  gradient: const LinearGradient(colors: [
                                    Colors.blue,
                                    Colors.deepPurple,
                                    Colors.red
                                  ]),
                                  isCurved: true,
                                  barWidth: 3,
                                  dotData: const FlDotData(show: true),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Stack(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  // _animationController.reverse();
                  // _animationController2.reverse();
                  // _animationController3.reverse();
                  // _animationController4.reverse();
                  Navigator.of(context).push(
                      _createRoute(name: widget.name, image: widget.image));
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => OfferScreen(
                  //             name: widget.name,
                  //           ),
                  //       fullscreenDialog: true),
                  // );
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                    ),
                    color: Colors.blue,
                  ),
                  height: 70,
                  width: MediaQuery.of(context).size.width / 2,
                  child: const Center(
                    child: Text(
                      "MAKE AN OFFER",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35),
                  ),
                  color: Colors.black,
                ),
                width: MediaQuery.of(context).size.width / 2,
                height: 70,
                child: const Center(
                  child: Text(
                    "BUY NOW : \$8,550",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: 20,
            left: MediaQuery.of(context).size.width / 2.2,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child:
                    Text("OR", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Route _createRoute({required String name, required String image}) {
  return PageRouteBuilder(
    transitionDuration: const Duration(seconds: 1),
    pageBuilder: (context, animation, secondaryAnimation) => OfferScreen(
      name: name,
      image: image,
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
