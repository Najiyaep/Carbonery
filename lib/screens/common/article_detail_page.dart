import 'package:flutter/material.dart';
import 'package:carbonery/models/blog_model.dart';

class BlogDetailScreen extends StatelessWidget {
  final Blog blog;

  BlogDetailScreen({required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(blog.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (blog.imageUrl != null)
                Image.network(blog.imageUrl!),
              SizedBox(height: 16),
              Text(
                blog.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'By ${blog.authorName}',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 8),
              Text(
                'Published on ${blog.publishedDate.toLocal()}',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 16),
              Text(
                blog.description,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
