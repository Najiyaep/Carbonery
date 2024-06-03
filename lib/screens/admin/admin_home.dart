import 'package:carbonery/screens/admin/expert_handle.dart';
import 'package:carbonery/screens/admin/feedback_page.dart';
import 'package:carbonery/screens/admin/user_handle.dart';
import 'package:carbonery/services/auth_service.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            DrawerHeader(
              child: CircleAvatar(
                maxRadius: 50,
                child: Image.asset(
                  'assets/img/user.png',
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Dashboard'),
            ),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text('Message'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeedbackView(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () async {
                await AuthService().logout().then((value) =>
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login', (route) => false));
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // First grid (Users)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserHandle()),
                  );
                },
                child: GridItem(
                  image: 'assets/img/group.png',
                  title: 'Users',
                  size: 180, // Adjust the size of the grid item
                  imageSize: 60, // Adjust the size of the image
                  fontSize: 14.0, // Adjust the size of the font
                ),
              ),
              SizedBox(height: 20), // Spacer between grids
              // Second grid (Climate Expert)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExpertHandle()),
                  );
                },
                child: GridItem(
                  image: 'assets/img/weather-forecast.png',
                  title: 'Climate Expert',
                  size: 180, // Adjust the size of the grid item
                  imageSize: 60, // Adjust the size of the image
                  fontSize: 14.0, // Adjust the size of the font
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String image;
  final String title;
  final double size;
  final double imageSize;
  final double fontSize;

  const GridItem({
    required this.image,
    required this.title,
    required this.size,
    required this.imageSize,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            width: imageSize,
            height: imageSize,
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
