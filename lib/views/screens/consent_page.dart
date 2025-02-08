import 'package:flutter/material.dart';
import 'userdetails_name_page.dart';

class ConsentPage extends StatefulWidget {
  const ConsentPage({Key? key}) : super(key: key);

  @override
  State<ConsentPage> createState() => _ConsentPageState();
}

class _ConsentPageState extends State<ConsentPage> {
  bool _isDataCollected = false;
  bool _isRightsAgreed = false;

  bool get _canProceed => _isDataCollected && _isRightsAgreed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start, // Align text formally
            children: [
              Center(child: Image.asset('assets/images/dataprivacy.png')),

              const SizedBox(height: 20),

              Center(
                child: Text(
                  'Your Health. Your Privacy.',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF641D15),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),

              Text(
                'Your data will never be stored or shared with any company except '
                    'Femina.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15),

              Text(
                'By using this app, you consent to the collection and use of personal '
                    'data solely for the purpose of predicting menstrual cycle dates and '
                    'improving our app\'s functionality.',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              const SizedBox(height: 15),

              Text(
                'You have the right to access, update, or delete your personal data '
                    'stored within our app.',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),

              const SizedBox(height: 40),

              // Consent checkboxes
              Column(
                children: [
                  CheckboxListTile(
                    value: _isDataCollected,
                    onChanged: (bool? value) {
                      setState(() {
                        _isDataCollected = value!;
                      });
                    },
                    title: const Text('I consent to the collection of my data'),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  const SizedBox(height: 10),
                  CheckboxListTile(
                    value: _isRightsAgreed,
                    onChanged: (bool? value) {
                      setState(() {
                        _isRightsAgreed = value!;
                      });
                    },
                    title: const Text('I agree to the rights mentioned'),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Next Button
              Center(
                child: ElevatedButton(
                  onPressed: _canProceed
                      ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserDetailsNamePage(),
                      ),
                    );
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    _canProceed ? Color(0xFFD55454) : Color(0xFFF6CDCD),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 64), // Bigger button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24), // More rounded
                    ),
                  ),
                  child: Text('Next', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
