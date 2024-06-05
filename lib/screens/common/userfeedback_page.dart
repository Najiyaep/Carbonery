import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final TextEditingController _reviewController = TextEditingController();
  double _rating = 0;
  late Stream<List<GenReview>> _reviewsStream;
  late User _user;

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser!;
    _reviewsStream = fetchReviews();
  }

  Stream<List<GenReview>> fetchReviews() {
    return FirebaseFirestore.instance
        .collection('reviews')
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => GenReview.fromMap(doc.data()))
        .toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reviews')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Write a Review:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 30.0,
              itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            TextFormField(
              controller: _reviewController,
              decoration: InputDecoration(labelText: 'Your Review'),
              maxLines: 3,
            ),
            SizedBox(height: 16.0),
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[200]),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ))
              ),
              onPressed: () => saveReview(),
              child: Text('Submit Review',style: TextStyle(color: Colors.black),),
            ),
            SizedBox(height: 16.0),
            Text(
              'Recent Reviews:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: StreamBuilder<List<GenReview>>(
                stream: _reviewsStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final review = snapshot.data![index];
                        return buildReviewItem(review);
                      },
                    );
                  } else if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Center(child: Text('No reviews available'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildReviewItem(GenReview review) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                review.userName,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              RatingBarIndicator(
                rating: review.rating,
                itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                itemCount: 5,
                itemSize: 20.0,
              ),
              SizedBox(height: 8.0),
              Text(
                review.reviewText,
                style: TextStyle(fontSize: 14.0),
              ),
              SizedBox(height: 8.0),
              Text(
                'Date: ${review.date.day}/${review.date.month}/${review.date.year}',
                style: TextStyle(fontSize: 12.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveReview() async {
    final String reviewText = _reviewController.text.trim();
    if (reviewText.isNotEmpty && _rating > 0) {
      final newReview = GenReview(
        userName: _user.displayName ?? _user.email ?? 'User',
        rating: _rating,
        reviewText: reviewText,
        date: DateTime.now(),
      );

      try {
        await FirebaseFirestore.instance.collection('reviews').add(newReview.toMap());
        _reviewController.clear();
        setState(() {
          _rating = 0;
        });
      } catch (e) {
        print("Error saving review: $e");
      }
    } else {
      print("Review text or rating is empty");
    }
  }
}

class GenReview {
  final String userName;
  final double rating;
  final String reviewText;
  final DateTime date;

  GenReview({
    required this.userName,
    required this.rating,
    required this.reviewText,
    required this.date,
  });

  factory GenReview.fromMap(Map<String, dynamic> map) {
    return GenReview(
      userName: map['userName'] ?? 'Anonymous',
      rating: map['rating'] ?? 0,
      reviewText: map['reviewText'] ?? '',
      date: (map['date'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'rating': rating,
      'reviewText': reviewText,
      'date': date,
    };
  }
}
