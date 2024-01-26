import 'dart:math';

import 'package:flutter/material.dart';

import 'dart:developer' as dev;

class CubeHome extends StatefulWidget {
  const CubeHome({super.key});

  @override
  State<CubeHome> createState() => _CubeHomeState();
}

class _CubeHomeState extends State<CubeHome> {
  Offset _offset = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Cube Home")),
        body: Center(
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(_offset.dy * pi / 180)
              ..rotateY(pi / 180 * _offset.dx),
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() => _offset += details.delta);
              },
              child: Cube(),
            ),
          ),
        ));
  }
}

class Cube extends StatelessWidget {
  Cube({super.key});
  final double size = 150;
  final double halfSize = 75;

  final Widget face = ColoredCubeFace();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform(
          transform: Matrix4.identity()..translate(0.0, 0.0, -halfSize),
          child: face,
        ),
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..translate(0.0, halfSize, 0.0)
            ..rotateX(pi / 2),
          child: face,
        ),
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..translate(halfSize, 0.0, 0.0)
            ..rotateY(pi / 2),
          child: face,
        ),
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..translate(0.0, -halfSize, 0.0)
            ..rotateX(-pi / 2),
          child: face,
        ),
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..translate(-halfSize, 0.0, 0.0)
            ..rotateY(-pi / 2),
          child: face,
        ),
        Transform(
          transform: Matrix4.identity()..translate(0.0, 0.0, halfSize),
          child: face,
        ),
      ],
    );
  }
}

class ColoredCubeFace extends StatelessWidget {
  const ColoredCubeFace({super.key});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final color = Color.fromRGBO(
      random.nextInt(256), // Red
      random.nextInt(256), // Green
      random.nextInt(256), // Blue
      1, // Alpha
    );
    return Container(
      height: 150,
      width: 150,
      color: color,
    );
  }
}

class CubeFace extends StatelessWidget {
  const CubeFace({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(150, 150),
      painter: SquarePainter(),
    );
  }
}

class SquarePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.yellow.shade800
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 1.0);

    final square = Rect.fromLTWH(0, 0, size.width, size.height);

    canvas.drawRect(square, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
