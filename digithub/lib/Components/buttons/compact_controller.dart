import 'package:flutter/material.dart';
class CompactControlBar extends StatefulWidget {
  const CompactControlBar({super.key});

  @override
  State<CompactControlBar> createState() => _CompactControlBarState();
}

class _CompactControlBarState extends State<CompactControlBar> {
  int selectedTab = 0;
  final List<String> tabs = ["Yesterday", "Today", "Tomorrow"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          
          _buildCompactArrowButton(Icons.chevron_left, () {
            setState(() =>
                selectedTab = (selectedTab - 1).clamp(0, tabs.length - 1));
          }),

          const SizedBox(width: 4), 

          
          Container(
            height: 30, 
            width: 200, 
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  color: Colors.grey.shade800,
                  width: 1.0), 
            ),
            child: Row(
              children: List.generate(tabs.length, (index) {
                return Expanded(
                  child: InkWell(
                    onTap: () => setState(() => selectedTab = index),
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedTab == index
                            ? Colors.grey.shade800
                            : Colors.transparent,
                        borderRadius: _getBorderRadius(index),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2), 
                          child: Text(
                            tabs[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11, 
                              fontWeight: selectedTab == index
                                  ? FontWeight.w500
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              })
                  .expand((widget) => [
                        widget,
                        if (widget != tabs.last)
                          Container(
                            width: 0.6, 
                            margin: const EdgeInsets.symmetric(
                                vertical: 5), 
                            color: Colors.white.withOpacity(0.3),
                          ),
                      ])
                  .toList(),
            ),
          ),

          const SizedBox(width: 4), 

         
          _buildCompactArrowButton(Icons.chevron_right, () {
            setState(() =>
                selectedTab = (selectedTab + 1).clamp(0, tabs.length - 1));
          }),
        ],
      ),
    );
  }

  Widget _buildCompactArrowButton(IconData icon, VoidCallback onPressed) {
    return Container(
      width: 24, 
      height: 24, 
      decoration: BoxDecoration(
        color: Colors.grey[800], 

        border: Border.all(
          color: Colors.grey.shade800, 
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 3,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: onPressed,
          splashColor: Colors.blue.withOpacity(0.3),
          child: Icon(
            icon,
            color: Colors.white, 
            size: 18, 
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
    if (index == tabs.length - 1)
      return const BorderRadius.only(
        topRight: Radius.circular(5),
        bottomRight: Radius.circular(5),
      );
    return null;
  }
}
