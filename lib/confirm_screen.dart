import 'package:flutter/material.dart';
import 'package:shoes_store/home_screen.dart';

class ConfirmScreen extends StatefulWidget {
  const ConfirmScreen({super.key});

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _fadeAnimation2;
  late Animation<double> _fadeAnimation3;
  late Animation<Offset> _slideTransition;
  late Animation<Offset> _slideTransition2;
  late Animation<Offset> _slideTransition3;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.33),
      ),
    );
    _fadeAnimation2 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.33, 0.66),
      ),
    );
    _fadeAnimation3 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.66, 0.99),
      ),
    );
    _slideTransition =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.33),
      ),
    );
    _slideTransition2 =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.33, 0.66),
      ),
    );
    _slideTransition3 =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.66, 0.99),
      ),
    );
    // Future.delayed(
    //   const Duration(seconds: 2),
    //   () {
    //     Navigator.push(context,
    //         MaterialPageRoute(builder: (context) => const HomeScreen()));
    //   },
    // );
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SizedBox(
          height: 200,
          width: 300,
          child: Column(
            children: [
              Stack(
                children: [
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 38,
                    left: 38,
                    child: SlideTransition(
                      position: _slideTransition2,
                      child: FadeTransition(
                          opacity: _fadeAnimation2,
                          child: const Icon(Icons.check,
                              color: Colors.white, size: 25.0)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SlideTransition(
                position: _slideTransition3,
                child: FadeTransition(
                  opacity: _fadeAnimation3,
                  child: const Text(
                    "Offer Completed",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FadeTransition(
                opacity: _fadeAnimation3,
                child: SlideTransition(
                  position: _slideTransition3,
                  child: RichText(
                    textAlign: TextAlign.end,
                    textDirection: TextDirection.rtl,
                    maxLines: 2,
                    text: const TextSpan(
                        style: TextStyle(fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                              text: "You've succesfully made an offer for",
                              style: TextStyle(fontWeight: FontWeight.w400)),
                          TextSpan(
                              text: " \$8550",
                              style: TextStyle(fontWeight: FontWeight.w700)),
                          TextSpan(
                              text: " for",
                              style: TextStyle(fontWeight: FontWeight.w400)),
                          TextSpan(
                              text: " Nike Mag Back to the Future Shoes",
                              style: TextStyle(fontWeight: FontWeight.w700))
                        ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
