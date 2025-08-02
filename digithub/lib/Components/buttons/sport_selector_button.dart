import 'package:flutter/material.dart';

class SportsSelectorButton extends StatefulWidget {
  const SportsSelectorButton({super.key});

  @override
  State<SportsSelectorButton> createState() => _SportsSelectorButtonState();
}

class _SportsSelectorButtonState extends State<SportsSelectorButton> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.white,
          width: 1.5,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 20, 
          width: 90, 
          color: Colors.transparent,
          child: Row(
            children: [
              _buildSportButton(0, Icons.sports_soccer),
              _buildDivider(),
              _buildSportButton(1, Icons.sports_basketball),
              _buildDivider(),
              _buildSportButton(2, Icons.sports_handball),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSportButton(int index, IconData icon) {
    bool isSelected = selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedIndex = index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue.shade900 : Colors.transparent,
            borderRadius: _getBorderRadius(index),
          ),
          child: Icon(
            icon,
            color: isSelected ? Colors.white : _getIconColor(index),
            size: 18, 
          ),
        ),
      ),
    );
  }

  BorderRadius? _getBorderRadius(int index) {
    if (index == 0) return const BorderRadius.only(
      topLeft: Radius.circular(8),
      bottomLeft: Radius.circular(8),
    );
    if (index == 2) return const BorderRadius.only(
      topRight: Radius.circular(8),
      bottomRight: Radius.circular(8),
    );
    return null;
  }

  Color _getIconColor(int index) {
    switch(index) {
      case 1: return Colors.orange;
      case 2: return Colors.red;
      default: return Colors.white;
    }
  }

  Widget _buildDivider() {
  return Container(
    width: 1.5, 
    margin: const EdgeInsets.symmetric(vertical: 1), 
    color: Colors.white.withOpacity(0.9), 
  );
}
}