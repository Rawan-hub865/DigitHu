import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:digithub/Screens/home.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isStarred = false;
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;

  final labels = ["Matches", "Teams", "Awards", "Notebook", "More"];
  final icons = [
    Icons.home,
    Icons.people,
    Icons.emoji_events,
    Icons.book,
    Icons.more_horiz,
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 9, 9, 95),
                Colors.black,
              ],
              stops: [0.1, 0.4],
            ),
          ),
          child: SafeArea(
            child:Home()
          ),
        ),
        bottomNavigationBar: _buildBottomNavBar(),
      ),
    );
  }

  

  Widget _buildBottomNavBar() {
    return Stack(
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          child: CurvedNavigationBar(
            key: navigationKey,
            color: Colors.grey.shade900,
            buttonBackgroundColor: Colors.blue.shade900,
            backgroundColor: Colors.transparent,
            height: 75,
            index: index,
            items: icons.map((icon) => Icon(icon, size: 30)).toList(),
            onTap: (newIndex) => setState(() => index = newIndex),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(icons.length, (i) {
              return SizedBox(
                width: MediaQuery.of(context).size.width / icons.length,
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: Text(
                      key: ValueKey<int>(i),
                      i == index ? labels[i] : '',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}


