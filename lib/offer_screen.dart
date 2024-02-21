import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shoes_store/confirm_screen.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key, required this.name, required this.image});
  final String name;
  final String image;
  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen>
    with TickerProviderStateMixin {
  List<FlSpot> chartValue = [
    const FlSpot(0, 0),
    const FlSpot(1, 1),
    const FlSpot(2, 2),
    const FlSpot(3, 3),
    const FlSpot(4, 4),
    const FlSpot(5, 5),
    const FlSpot(6, 6),
    const FlSpot(7, 7),
    const FlSpot(8, 8),
    const FlSpot(9, 9),
    const FlSpot(10, 10),
    const FlSpot(11, 11),
  ];
  TextEditingController textEditingController = TextEditingController();
  late AnimationController _animationController;
  late AnimationController _animationController1;

  @override
  void initState() {
    // TODO: implement initState
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animationController1 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
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
                widget.name,
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
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Center(
                child: SlideTransition(
                  position: Tween(begin: const Offset(1, 0), end: Offset.zero)
                      .animate(
                    _animationController,
                  ),
                  child: Image.asset(
                    widget.image,
                    height: 100,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Center(
                child: Text("Your Offer",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w500)),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  suffix: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      height: 30,
                      width: 90,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: const Color.fromARGB(255, 42, 90, 131)),
                      ),
                      child: const Row(children: [
                        Text(" Size : 10", style: TextStyle(fontSize: 14)),
                        Icon(Icons.arrow_drop_down)
                      ]),
                    ),
                  ),
                  prefix: const Padding(
                    padding: EdgeInsets.only(right: 50, left: 50),
                    child: Text("\$"),
                  ),
                ),
                controller: textEditingController,
                autofocus: true,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Column(
                    children: [
                      Text("\$8,125",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        "52 wk low",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .7,
                    height: 110,
                    child: LineChart(
                      LineChartData(
                        gridData: const FlGridData(
                            drawHorizontalLine: false, drawVerticalLine: false),
                        titlesData: const FlTitlesData(
                            leftTitles: AxisTitles(drawBelowEverything: false),
                            rightTitles: AxisTitles(drawBelowEverything: false),
                            topTitles: AxisTitles(drawBelowEverything: false),
                            bottomTitles:
                                AxisTitles(drawBelowEverything: false)),
                        borderData: FlBorderData(show: false),
                        lineBarsData: [
                          LineChartBarData(
                            show: true,
                            spots: chartValue,
                            color: Colors.transparent,
                            belowBarData: BarAreaData(
                                gradient: LinearGradient(colors: [
                                  Colors.white,
                                  Colors.blue.shade800,
                                ]),
                                show: true),
                            isCurved: true,
                            barWidth: 3,
                            dotData: const FlDotData(show: false),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConfirmScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 70,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: const Center(
                    child: Text("MAKE AN OFFER ",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500)),
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
