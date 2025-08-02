import 'package:flutter/material.dart';
class GroupByButton extends StatefulWidget {
  const GroupByButton({super.key});

  @override
  State<GroupByButton> createState() => _GroupByButtonState();
}

class _GroupByButtonState extends State<GroupByButton> {
  String? _selectedGroupOption;
  String? _tempSelectedOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.blue.shade800,
          width: 1.5,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => _showGroupByDialog(context),
          splashColor: Colors.blue.withOpacity(0.3),
          child: const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(  
                  Icons.group_work, 
                  color: Colors.white,
                  size: 18,
                ),
                 SizedBox(width: 6),  
                Text(
                  'Group By',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
               SizedBox(width: 2), 
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

void _showGroupByDialog(BuildContext context) {
  _tempSelectedOption = _selectedGroupOption;

  showGeneralDialog(
    context: context,
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (context, animation, secondaryAnimation) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: Colors.black,
            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(width: 1, color: Colors.blue.shade800),
            ),
            title:const Text(
              'Order Matches',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            content: SizedBox(
              
              width: MediaQuery.of(context).size.width * 0.8,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildRadioOptionWithIcon(Icons.emoji_events, 'Competition', 'competition', setState, context),
                    _buildRadioOptionWithIcon(Icons.access_time, 'Time', 'time', setState, context),
                  ],
                ),
              ),
            ),
            actions: [
              Center( 
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child:const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
              ),
            ],
          );
        },
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutQuart,
        )),
        child: child,
      );
    },
  );
}

Widget _buildRadioOptionWithIcon(IconData icon, String title, String value, StateSetter setState, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: InkWell(
      onTap: () {
        setState(() {
          _tempSelectedOption = value;
          _selectedGroupOption = value;
        });
        Navigator.pop(context);
        _applyGrouping(context);
      },
      child: Row(
        children: [
          Radio<String>(
            value: value,
            groupValue: _tempSelectedOption,
            activeColor: Colors.blue,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            onChanged: (String? newValue) {
              setState(() {
                _tempSelectedOption = newValue;
                _selectedGroupOption = newValue;
              });
              Navigator.pop(context);
              _applyGrouping(context);
            },
          ),
          const SizedBox(width: 8),
          Icon(icon, color: Colors.blue[300], size: 20),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    ),
  );
}



 
  void _applyGrouping(BuildContext context) {
    if (_selectedGroupOption == null) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Grouped by: ${_getGroupName(_selectedGroupOption!)}'),
        backgroundColor: Colors.blue[800],
        duration: const Duration(seconds: 2),
      ),
    );
    
   
  }

  String _getGroupName(String value) {
    switch(value) {
      case 'competition': return 'Competition';
      case 'date': return 'Date';
      case 'time': return 'Time';
      case 'favorite': return 'Favorite';
      case 'league': return 'League';
      default: return value;
    }
  }


 
}
