import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelectorButton extends StatefulWidget {
  const DateSelectorButton({super.key});

  @override
  State<DateSelectorButton> createState() => _DateSelectorButtonState();
}

class _DateSelectorButtonState extends State<DateSelectorButton> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Material(
        color: Colors.grey.shade900,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => _selectDate(context),
          splashColor: Colors.blue.withOpacity(0.3),
          child: Container(
            width: 140, 
            height: 30, 
            decoration: BoxDecoration(
             
              border: Border.all(color: Colors.grey.shade900, width: 1.5),
            ),
           
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.calendar_today, color: Colors.white, size: 15),
                const SizedBox(width: 10), 
                Text(
                  DateFormat('EEEE d/M/yyyy').format(_selectedDate), 
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}