import 'package:flutter/material.dart';
import 'package:flutter_ui_challenge/presentations/widgets/present_indicator_shape.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CustomPaint(
        size: const Size(200, 200),
        painter: PresentIndicatorShape(),
      )),
    );
  }
}
