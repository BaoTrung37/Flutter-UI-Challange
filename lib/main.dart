import 'package:flutter/material.dart';
import 'package:flutter_ui_challenge/presentations/pages/home/home_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePageView(),
    );
  }
}

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CustomPaint(
          size: const Size(200, 200),
          painter: CircularBalancePainter(),
          child: const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '\$5,643.50',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Available Balance',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CircularBalancePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double progress = 0.75; // Example progress
    double startAngle = -90.0;
    double sweepAngle = 360 * progress;

    Paint backgroundPaint = Paint()
      ..color = Colors.grey.shade800
      ..strokeWidth = 20
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint progressPaint = Paint()
      ..shader = SweepGradient(
        colors: const [Colors.purple, Colors.blue, Colors.green],
        startAngle: startAngle * 0.0174533,
        endAngle: (startAngle + sweepAngle) * 0.0174533,
      ).createShader(Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2))
      ..strokeWidth = 20
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = size.width / 2;

    canvas.drawCircle(center, radius, backgroundPaint);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        startAngle * 0.0174533, sweepAngle * 0.0174533, false, progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
