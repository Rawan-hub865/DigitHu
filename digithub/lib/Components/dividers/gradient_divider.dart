import 'package:flutter/material.dart';

class GradientDivider extends StatelessWidget {
  final double height;
  final double marginHorizontal;
  final List<Color>? colors;
  final List<double>? stops;

  const GradientDivider({
    super.key,
    this.height = 1.5,
    this.marginHorizontal = 40,
    this.colors,
    this.stops,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.symmetric(horizontal: marginHorizontal),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        gradient: LinearGradient(
          colors: colors ?? _defaultColors(),
          stops: stops ?? _defaultStops(),
        ),
      ),
    );
  }

  List<Color> _defaultColors() {
    return [
      Colors.transparent,
      Colors.white.withOpacity(0.3),
      Colors.white.withOpacity(0.7),
      Colors.white,
      Colors.white.withOpacity(0.7),
      Colors.white.withOpacity(0.3),
      Colors.transparent,
    ];
  }

  List<double> _defaultStops() {
    return const [0.0, 0.2, 0.4, 0.5, 0.6, 0.8, 1.0];
  }
}