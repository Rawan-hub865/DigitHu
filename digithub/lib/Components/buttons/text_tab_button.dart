import 'package:flutter/material.dart';

class TextSelectorButton extends StatefulWidget {
  const TextSelectorButton({super.key});

  @override
  State<TextSelectorButton> createState() => _TextSelectorButtonState();
}

class _TextSelectorButtonState extends State<TextSelectorButton> {
  int selectedIndex = 0;
  final List<String> buttonTexts = ["ALL", "FAV", "TOP"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.blue.shade900,
            width: 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            height: 25,
            width: 150,
            color: Colors.transparent,
            child: Row(
              children: [
                for (int i = 0; i < buttonTexts.length; i++) ...[
                  if (i > 0) _buildDivider(),
                  _buildTextButton(i, buttonTexts[i]),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextButton(int index, String text) {
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
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color:
                    isSelected ? Colors.white : Colors.white.withOpacity(0.8),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  BorderRadius? _getBorderRadius(int index) {
    if (index == 0)
      return const BorderRadius.only(
        topLeft: Radius.circular(5),
        bottomLeft: Radius.circular(5),
      );
    if (index == buttonTexts.length - 1)
      return const BorderRadius.only(
        topRight: Radius.circular(5),
        bottomRight: Radius.circular(5),
      );
    return null;
  }

  Widget _buildDivider() {
    return Container(
      width: 1.5,
      margin: const EdgeInsets.symmetric(vertical: 2),
      color: Colors.blue.shade900,
    );
  }
}