import 'package:flutter/material.dart';
import 'log_period_screen.dart'; // Import the LogPeriodScreen

class TrackingReasonScreen extends StatefulWidget {
  const TrackingReasonScreen({Key? key}) : super(key: key);

  @override
  _TrackingReasonScreenState createState() => _TrackingReasonScreenState();
}

class _TrackingReasonScreenState extends State<TrackingReasonScreen> {
  // List of reasons that the user can select
  List<String> selectedReasons = [];

  // Helper function to handle the selection of a reason
  void handleSelection(String reason, bool? isSelected) {
    setState(() {
      if (isSelected == true) {
        selectedReasons.add(reason); // Add to the list if selected
      } else {
        selectedReasons.remove(reason); // Remove from the list if unselected
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
              'assets/images/background5.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // **Back Button**
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color(0xFFF6CDCD), // Light pink
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // **Title**
                  const Text(
                    'Why are you tracking your cycle?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF641D15),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // **Subtitle**
                  const Text(
                    'You can choose as many as you like.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // **Checkbox Options**
                  Column(
                    children: [
                      _buildCheckboxTile(
                        'To receive period predictions and track ovulation',
                        'Period predictions and ovulation tracking',
                      ),
                      _buildCheckboxTile(
                        'To gain insights into my reproductive health and understand my body',
                        'Reproductive health insights',
                      ),
                      _buildCheckboxTile(
                        'To monitor symptoms and manage conditions like PMS or PCOS',
                        'Symptom monitoring',
                      ),
                      _buildCheckboxTile(
                        'To align my fitness and lifestyle with my cycle for better well-being',
                        'Fitness and lifestyle alignment',
                      ),
                    ],
                  ),
                  const Spacer(),

                  // **Next Button**
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (selectedReasons.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LogPeriodScreen(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please select at least one reason to continue.'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD55454),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // **Helper Widget for Checkbox List Tile with Grey Background & Checkbox on Right**
  Widget _buildCheckboxTile(String title, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey[200], // Light grey background
        borderRadius: BorderRadius.circular(8),
      ),
      child: CheckboxListTile(
        value: selectedReasons.contains(value),
        onChanged: (bool? isSelected) {
          handleSelection(value, isSelected);
        },
        title: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
        controlAffinity: ListTileControlAffinity.trailing, // **Checkbox moved to the right**
      ),
    );
  }
}
