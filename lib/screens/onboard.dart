import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:grocery_item_app/constants.dart';

class Onboard extends StatefulWidget {
  @override
  _OnboardState createState() => _OnboardState();
}

final _controller = PageController(
  initialPage: 0,
);
int _currentPage = 0;
List<Widget> _pages = [
  Column(
    children: [
      Expanded(child: Image.asset('images/enteraddress.png')),
      Text(
        'Set Your Delivery Location',
        style: KpageViewTextStyle,
        textAlign: TextAlign.center,
      ),
    ],
  ),
  Column(
    children: [
      Expanded(child: Image.asset('images/orderfood.png')),
      Text(
        'Order Online Now',
        style: KpageViewTextStyle,
        textAlign: TextAlign.center,
      ),
    ],
  ),
  Column(
    children: [
      Expanded(child: Image.asset('images/deliverfood.png')),
      Text(
        'Quick Delivery to your Doorstep',
        style: KpageViewTextStyle,
        textAlign: TextAlign.center,
      ),
    ],
  ),
];

class _OnboardState extends State<Onboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _controller,
            children: _pages,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
        ),
        DotsIndicator(
          dotsCount: _pages.length,
          position: _currentPage.toDouble(),
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)),
            activeColor: Colors.deepOrange,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
