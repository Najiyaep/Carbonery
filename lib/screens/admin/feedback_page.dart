import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedbackView extends StatefulWidget {
  const FeedbackView({Key? key}) : super(key: key);

  @override
  State<FeedbackView> createState() => _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Feedbacks",style: TextStyle(color: Colors.black),),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('feedbacks')
            .orderBy('date', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No feedbacks found.'));
          }

          var feedbackDocs = snapshot.data!.docs;

          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Add padding to the ListView
            itemCount: feedbackDocs.length,
            itemBuilder: (context, index) {
              var feedbackData = feedbackDocs[index].data() as Map<String, dynamic>;
              var userName = feedbackData['userName'] ?? 'Anonymous';
              var rating = feedbackData['rating'] ?? 0.0;
              var reviewText = feedbackData['reviewText'] ?? '';
              var date = (feedbackData['date'] as Timestamp).toDate();

              return buildReviewItem(userName, rating, reviewText, date);
            },
          );
        },
      ),
    );
  }

  Widget buildReviewItem(String userName, double rating, String reviewText, DateTime date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green[50],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              RatingBarIndicator(
                rating: rating,
                itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                itemCount: 5,
                itemSize: 20.0,
              ),
              SizedBox(height: 8.0),
              Text(
                reviewText,
                style: TextStyle(fontSize: 14.0),
              ),
              SizedBox(height: 8.0),
              Text(
                'Date: ${date.day}/${date.month}/${date.year}',
                style: TextStyle(fontSize: 12.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
