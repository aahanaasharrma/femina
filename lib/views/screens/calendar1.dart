import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar1Screen extends StatefulWidget {
  @override
  _Calendar1ScreenState createState() => _Calendar1ScreenState();
}

class _Calendar1ScreenState extends State<Calendar1Screen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<DateTime> _highlightedDays = [];
  int _numDays = 0;

  void _updateDays(int change) {
    setState(() {
      _numDays = (_numDays + change).clamp(0, 30); // Limits from 0 to 30
      if (_selectedDay != null) {
        _highlightedDays =
            List.generate(_numDays, (i) => _selectedDay!.add(Duration(days: i)));
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/background7.png", // Ensure this image is in the assets folder
              fit: BoxFit.cover,
            ),
          ),
          
          Column(
            children: [
              AppBar(
                backgroundColor: Color(0xFFF6CDCD),
                title: const Text(
                  "Tap on the date of your last period",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                centerTitle: true,
              ),
              SizedBox(height: 20), // Adjusted spacing
              
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: TableCalendar(
                    firstDay: DateTime.now().subtract(Duration(days: 90)),
                    lastDay: DateTime.now(),
                    focusedDay: _focusedDay,
                    calendarFormat: CalendarFormat.month,
                    availableGestures: AvailableGestures.all,
                    pageJumpingEnabled: true,
                    headerVisible: true,
                    selectedDayPredicate: (day) => _highlightedDays.contains(day),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        if (_highlightedDays.contains(selectedDay)) {
                          // Unselect all if the same date is tapped
                          _highlightedDays.clear();
                          _selectedDay = null;
                        } else {
                          if (_highlightedDays.isNotEmpty) {
                            _highlightedDays.clear(); // Ensure old selection is cleared
                          }
                          if (_numDays > 0) {
                            _highlightedDays = List.generate(
                                _numDays, (i) => selectedDay.add(Duration(days: i)));
                          }
                          _selectedDay = selectedDay;
                        }
                        _focusedDay = focusedDay;
                      });
                    },
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.5),
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Color(0xFFD55454),
                        shape: BoxShape.circle,
                      ),
                      withinRangeTextStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Stepper for selecting number of period days
              Text(
                "Number of Days of Period",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove, color: Colors.black),
                    onPressed: () => _updateDays(-1),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '$_numDays',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.black),
                    onPressed: () => _updateDays(1),
                  ),
                ],
              ),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    if (_selectedDay == null)
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Color(0xFFD55454), width: 1.5),
                        ),
                        child: const Text(
                          "I don't remember",
                          style: TextStyle(color: Color(0xFFD55454)),
                        ),
                      ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _selectedDay == null ? null : () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _selectedDay == null ? Color(0xFFF6CDCD) : Color(0xFFD55454),
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: _selectedDay == null ? Color(0xFFD55454) : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
