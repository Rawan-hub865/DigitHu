import 'package:flutter/material.dart';

class AppGradientDecoration extends BoxDecoration {
  AppGradientDecoration({
    Gradient? gradient,
    BorderRadiusGeometry? borderRadius,
  }) : super(
          gradient: gradient ?? _defaultGradient(),
          borderRadius: borderRadius ?? BorderRadius.zero,
        );

 
  static LinearGradient _defaultGradient() {
    return const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromARGB(255, 9, 9, 95),  
        Colors.black,                   
      ],
      stops: [0.1, 0.4],
    );
  }

  
  factory AppGradientDecoration.diagonal({
    List<Color>? colors,
    List<double>? stops,
  }) {
    return AppGradientDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: colors ?? _defaultGradient().colors,
        stops: stops ?? _defaultGradient().stops,
      ),
    );
  }

  
 
}