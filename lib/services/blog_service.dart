import 'package:carbonery/models/blog_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'dart:io';

class BlogService {
  final CollectionReference blogCollection = FirebaseFirestore.instance.collection('blogs');
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> createBlog(Blog blog, File? imageFile) async {
    if (imageFile != null) {
      String imageUrl = await _uploadImage(imageFile);
      blog.imageUrl = imageUrl;
    }
    await blogCollection.add(blog.toMap());
  }

  Future<void> updateBlog(Blog blog, File? imageFile) async {
    if (imageFile != null) {
      String imageUrl = await _uploadImage(imageFile);
      blog.imageUrl = imageUrl;
    }
    await blogCollection.doc(blog.id).update(blog.toMap());
  }

  Future<void> deleteBlog(String id) async {
    await blogCollection.doc(id).delete();
  }

  Stream<List<Blog>> getBlogs(String id) {
    return blogCollection.where('authorId',isEqualTo:id).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Blog.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  Stream<List<Blog>> getArticles(String category) {
    print(category);
    Query query = blogCollection;
    if (category != "All") {
      query = query.where('category', isEqualTo: category);
    }
    return query.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Blog.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  Future<String> _uploadImage(File imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref = storage.ref().child('blog_images').child(fileName);
    UploadTask uploadTask = ref.putFile(imageFile);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }
}
