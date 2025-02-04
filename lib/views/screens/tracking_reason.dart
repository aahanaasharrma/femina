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
              'assets/images/background5.png', // Make sure the background3.png is in the assets folder
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Space before heading
                const SizedBox(height: 50), // Extra space for proper alignment

                // Title
                const Text(
                  'Why are you tracking your cycle?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF641D15),
                  ),
                ),
                const SizedBox(height: 10), // Space between title and description

                // Subtitle
                const Text(
                  'You can choose as many as you like.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30), // Space after subtitle

                // Checkbox options for tracking reasons
                Column(
                  children: [
                    CheckboxListTile(
                      value: selectedReasons.contains('Period predictions and ovulation tracking'),
                      onChanged: (bool? isSelected) {
                        handleSelection('Period predictions and ovulation tracking', isSelected);
                      },
                      title: const Text(
                        'To receive period predictions and track ovulation',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    CheckboxListTile(
                      value: selectedReasons.contains('Reproductive health insights'),
                      onChanged: (bool? isSelected) {
                        handleSelection('Reproductive health insights', isSelected);
                      },
                      title: const Text(
                        'To gain insights into my reproductive health and understand my body',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    CheckboxListTile(
                      value: selectedReasons.contains('Symptom monitoring'),
                      onChanged: (bool? isSelected) {
                        handleSelection('Symptom monitoring', isSelected);
                      },
                      title: const Text(
                        'To monitor symptoms and manage conditions like PMS or PCOS',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    CheckboxListTile(
                      value: selectedReasons.contains('Fitness and lifestyle alignment'),
                      onChanged: (bool? isSelected) {
                        handleSelection('Fitness and lifestyle alignment', isSelected);
                      },
                      title: const Text(
                        'To align my fitness and lifestyle with my cycle for better well-being.',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const Spacer(), // Push the next button to the bottom

                // Next Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Ensure at least one reason is selected before navigating
                      if (selectedReasons.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LogPeriodScreen(), // Navigate to the next page
                          ),
                        );
                      } else {
                        // Show an error if no options are selected
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
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 40), // Extra space at the bottom
              ],
            ),
          ),
        ],
      ),
    );
  }
}
