import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rickman/presentation/UI/Widgets/CustomLongTextFormField.dart';
import '../About us/Widget/TextCard.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackState();
}

class _FeedbackState extends State<FeedbackPage> {
  final TextEditingController _feedbackController = TextEditingController();
  double _rating = 0;

  Future<void> _sendFeedback(double _rating, String feedback) async {
    final currentUser = FirebaseAuth.instance.currentUser!;
    if (currentUser != null) {
      final userName = currentUser.displayName;
      try {
        // Add feedback to Firestore
        await FirebaseFirestore.instance.collection('feedback').add({
          'userName': userName, // Add userId to the document
          'rating': _rating,
          'feedback': feedback,
          'timestamp': DateTime.now(),
        });

        // Show success message or navigate to another screen
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Feedback submitted successfully'),
            duration: Duration(seconds: 2),
          ),
        );
      } catch (error) {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to submit feedback'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
                children: [
                  TextCard(content: "Feedback"),
                  SizedBox(height: screenHeight * 0.015),
                  const Text(
                    "We are happy that you are using our application. We made it with love for you, and we are happy to experience it and use it, and use it and the rest of the family of our applications that we work on with every possible effort for you for a fun experience with us. Your evaluation of this application and providing your opinion in it will help us to develop more for you.",
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  const Text(
                    "Rating",
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Center(
                    child: RatingBar.builder(
                      initialRating: 0,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      glowColor: Colors.amber,
                      maxRating: 5,
                      unratedColor: Colors.grey,
                      itemPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        setState(() {
                          _rating = rating;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  CustomLongTextFormField(
                    label: "Your Feedback",
                    inputType: TextInputType.text,
                    controller: _feedbackController,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  SizedBox(
                    height: screenHeight * 0.08,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Colors.black),
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                        elevation: MaterialStateProperty.all(0),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(screenHeight * 0.01),
                        )),
                        textStyle: MaterialStateProperty.all(const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        )),
                      ),
                      onPressed: () {
                        // Call function to send feedback to Firestore
                        _sendFeedback(
                          // Pass the rating and feedback from the UI
                          _rating, // Replace with actual rating
                          _feedbackController.text, // Feedback text
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(screenHeight * 0.015),
                            child: Text(
                              "Send Your Feedback",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
