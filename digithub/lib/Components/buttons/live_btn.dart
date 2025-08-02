import 'package:flutter/material.dart';
class LiveButton extends StatefulWidget {
  const LiveButton({super.key});

  @override
  State<LiveButton> createState() => _LiveButtonState();
}

class _LiveButtonState extends State<LiveButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isDotVisible = true;
  bool _isPressed = false; 
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    
    _controller.addListener(() {
      setState(() {
        _isDotVisible = _controller.value > 0.5;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: _isPressed ? Colors.blue.shade800 : Colors.white, 
          width: 1.5,
        ),
        color: _isPressed ? Colors.blue.shade900.withOpacity(0.3) : Colors.transparent, 
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              setState(() {
                _isPressed = !_isPressed; 
              });
             
            },
            splashColor: Colors.blue.withOpacity(0.3),
            child: Container(
              width: 80,
              height: 25,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [                
                  Text(
                    'LIVE',
                    style: TextStyle(
                      color: _isPressed ? Colors.white : Colors.white, 
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  AnimatedOpacity(
                    opacity: _isDotVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                        color: _isPressed ? Colors.blue : Colors.green, 
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: (_isPressed ? Colors.blue : Colors.green).withOpacity(0.8),
                            blurRadius: 4,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}