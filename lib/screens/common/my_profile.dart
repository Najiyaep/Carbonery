import 'dart:io';
import 'package:carbonery/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;
  var filename;
  XFile? imageurl;
  var url;
  final ImagePicker _picker = ImagePicker();
  User? _user;
  String? _userName;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot<Map<String, dynamic>> userData = await FirebaseFirestore.instance
          .collection('user')
          .doc(user.uid)
          .get();

      setState(() {
        _user = user;
        _userName = userData.data()?['name'];  // Extract the user's name
      });
    }
  }

  Future<void> _selectImage() async {
    final imageFile = await _picker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      setState(() {
        _image = File(imageFile.path);
      });
    }
  }

  void showImagePicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              title: Text("Camera"),
              onTap: () {
                imageFromCamera();
              },
            ),
            ListTile(
              title: Text("Gallery"),
              onTap: () {
                imageFromGallery();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> imageFromGallery() async {
    final XFile? _image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageurl = _image;
    });
  }

  Future<void> imageFromCamera() async {
    final XFile? _image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      imageurl = _image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 240,
        actions: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 16, 0),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/personalinfo');
                  // Handle the edit action here
                },
                child: Text(
                  'Edit',
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(50.0, 50.0, 150.0, 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _selectImage,
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.green[50],
                    child: _image != null
                        ? ClipOval(
                      child: Image.file(
                        _image!,
                        fit: BoxFit.cover,
                        width: 90,
                        height: 90,
                      ),
                    )
                        : Icon(
                      Icons.camera_alt_sharp,
                      color: Colors.green[300],
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  _userName ?? 'name',  // Display the fetched user name
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Card(
        child: ListView(
          padding: EdgeInsets.all(5.0),
          children: [
            _buildListItem(Icons.rate_review, "Feedback", '/review'),
           // _buildListItem(Icons.history, "History", '/history'),
           // _buildListItem(Icons.payments_outlined, "Transaction", '/mypayments'),
            //_buildListItem(Icons.notifications_outlined, "Notifications", '/notificition'),
           // _buildListItem(Icons.lock_reset, "Reset Password", '/resetpassword'),
            _buildListItem(Icons.privacy_tip_outlined, "Privacy Policy", '/privacy'),
            _buildListItem(Icons.description, "Terms & Conditions", '/termc'),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                ),
                title: Text(
                  "Log Out",
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () async {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Confirm Logout"),
                        content: Text("Are you sure you want to log out?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () async {
                              await AuthService().logout().then((value) =>
                                  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false));
                            },
                            child: Text("Logout"),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(IconData icon, String text, String route) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(text),
        trailing: Icon(Icons.arrow_right),
        onTap: () {
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }
}
