import 'package:flutter/material.dart';
class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          _buildListItem(Icons.home, 'Home'),
          SizedBox(height: 10),
          _buildListItem(Icons.account_circle, 'Profile'),
          SizedBox(height: 10),
          _buildListItem(Icons.calculate,'Calculator settings'),
          SizedBox(height: 10),
          _buildListItem(Icons.history, 'History'),
          SizedBox(height: 10),
          _buildListItem(Icons.wind_power, 'Activity'),
          SizedBox(height: 10),
          _buildListItem(Icons.privacy_tip, 'Privacy'),
          SizedBox(height: 10,),
          _buildListItem(Icons.notifications, 'Notifications'),
          SizedBox(height: 10),
          _buildListItem(Icons.data_exploration, 'Data analysis'),
          SizedBox(height: 10),
          _buildListItem(Icons.settings, 'Settings'),
        ],
      ),
    );
  }

  Widget _buildListItem(IconData iconData, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffc6dabf),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xff114b5f),
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.all(10),
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 15),
          Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

