import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onSearchPressed;

  const MainAppBar({
    super.key,
    required this.title,
    this.onSearchPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Container(
            width: 40,
            height: 40,
           child: Image.asset("assets/images/logo.jpg"),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white, size: 28),
            onPressed: onSearchPressed,
          ),
        ],
      ),
    );
  }
}