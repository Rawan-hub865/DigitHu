import 'package:flutter/material.dart';

class IconButtonWithStar extends StatefulWidget {
  final String imagePath;
  final String title;
  final List<ButtonItem> buttons;
  final bool initiallyStarred;
  final Function(bool)? onStarChanged;
  final Color? color;

  const IconButtonWithStar({
    required this.imagePath,
    required this.title,
    required this.buttons,
    this.initiallyStarred = false,
    this.onStarChanged,
    Key? key, required this.color,
  }) : super(key: key);

  @override
  _IconButtonWithStarState createState() => _IconButtonWithStarState();
}

class _IconButtonWithStarState extends State<IconButtonWithStar> {
  late bool isStarred;

  @override
  void initState() {
    super.initState();
    isStarred = widget.initiallyStarred;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[900],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              // Top part (content)
              Expanded(
                child: Row(
                  children: [
                    // Yellow line
                    Container(
                      width: 2,
                      height: double.infinity,
                      color: widget.color,
                    ),
                    const SizedBox(width: 5),

                    // Image
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                      child: Image.asset(widget.imagePath),
                    ),
                    const SizedBox(width: 15),

                    // Text
                    Expanded(
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Bottom part (buttons)
              Container(
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey.shade900,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  children: widget.buttons.map((button) => _buildSmallButton(button.icon, button.label)).toList(),
                ),
              ),
            ],
          ),

          // Star icon at the top right
          Positioned(
            right: 20,
            top: 10,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isStarred = !isStarred;
                });
                if (widget.onStarChanged != null) {
                  widget.onStarChanged!(isStarred);
                }
              },
              child: Icon(
                Icons.star,
                color: isStarred ?  Colors.grey[400]: Colors.yellow,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallButton(IconData icon, String label) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Handle button tap
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.grey[400],
                size: 14,
              ),
              const SizedBox(width: 4),
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonItem {
  final IconData icon;
  final String label;

  ButtonItem(this.icon, this.label);
}