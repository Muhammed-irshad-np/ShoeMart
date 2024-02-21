import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shoes_store/shoes_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Shoes> shoesList = [
    Shoes(
        image: "images/nike.png",
        price: "2200",
        brand: "abcdefgg",
        isfavourate: false,
        name: "NIKE MAG BACK TO FUTURE"),
    Shoes(
        image: "images/jordan.png",
        price: "86",
        brand: "abcdefgg",
        isfavourate: false,
        name: "JORDAN 9 RETRO DREAM IT DO IT"),
    Shoes(
        image: "images/lebron.png",
        price: "100",
        isfavourate: false,
        brand: "abcdefgg",
        name: "LEBRON SUPERMAN SUPERBORN"),
    Shoes(
        image: "images/yellow.png",
        price: "150",
        isfavourate: false,
        brand: "abcdefgg",
        name: "Athletic And Sneakers")
  ];
  final ScrollController _scrollController = ScrollController();
  bool _isAppBarTransperant = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset == 0.0) {
        setState(() {
          _isAppBarTransperant = true;
          log("isCroll");
        });
      } else {
        setState(() {
          _isAppBarTransperant = false;
          log("asdfghjk");
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // AnimatedBuilder(
          //   animation: _scrollController,
          //   builder: (context, child) {
          //     double opacity = 1.0 -
          //         _scrollController.offset /
          //             100; // Adjust 100 for desired fade point
          //     return Opacity(
          //       opacity: opacity.clamp(
          //           0.0, 1.0), // Ensure opacity stays within 0-1 range
          //       child: child,
          //     );
          //   },
          // child:
          SliverAppBar(
            leading: const Icon(Icons.arrow_back),
            actions: const [
              Icon(Icons.shopping_cart_outlined),
              SizedBox(
                width: 10,
              )
            ],
            backgroundColor: _isAppBarTransperant == false
                ? Colors.transparent
                : Colors.grey.shade200,
            floating: false,
            pinned: true,
            flexibleSpace: const FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsets.only(right: 70, top: 50),
                child: Center(
                  child: Text(
                    "OTIS",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            // ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShoesDetailsScreen(
                                image: shoesList[index].image,
                                name: shoesList[index].name,
                                price: shoesList[index].price,
                                isfavourate: shoesList[index].isfavourate,
                              ))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 10,
                            spreadRadius: 2,
                            color: Colors.black12,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 10),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color:
                                              Color.fromARGB(31, 115, 115, 115),
                                          blurRadius: 10,
                                          offset: Offset(0, 0),
                                          spreadRadius: 2)
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      shoesList[index].isfavourate =
                                          !shoesList[index].isfavourate;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: shoesList[index].isfavourate
                                        ? Colors.red
                                        : Colors.grey.shade300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Image.asset(shoesList[index].image, height: 200),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Text(shoesList[index].name,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                              ),
                              Column(
                                children: [
                                  Text("Lowest Price",
                                      style: TextStyle(
                                          color: Colors.grey.shade300,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  Text("\$${shoesList[index].price}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20)),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount: shoesList.length,
            ),
          ),
        ],
      ),
    );
  }
}

class Shoes {
  final String image;
  final String price;
  final String name;
  final String brand;
  bool isfavourate;
  Shoes(
      {required this.image,
      required this.price,
      required this.brand,
      required this.isfavourate,
      required this.name});
}
