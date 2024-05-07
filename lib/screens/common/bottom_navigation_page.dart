import 'package:carbonery/screens/common/activity_page.dart';
import 'package:carbonery/screens/common/aqi_page.dart';
import 'package:carbonery/screens/common/article_page.dart';
import 'package:carbonery/screens/common/community_page.dart';
import 'package:carbonery/screens/common/my_page.dart';
import 'package:carbonery/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:carbonery/screens/common/home_page.dart';



class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {

  int _selectedIndex=0;

  List<Widget> _widgetOptions=[

    HomePage(),
    AqiPage(),
    CommunityPage(),
    ArticlePage(),
    ActivityPage(),



  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.grey.shade300,
          width: 200,
          child: Column(
            children: [
              DrawerHeader(child: CircleAvatar(
                maxRadius: 50,
                child: Image.asset(
                  'assets/img/user.png',
                  width: 200,
                  height: 200,
                ),
              ),),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('home'),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
              ),
              ListTile(
                leading: Icon(Icons.update),
                title: Text('History'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: ()
                async{

                  await AuthService().logout().then((value) => Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false));
                },
              ),
            ],
          ),
        ),

        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.bar_chart),
              onPressed: () {


                // Add your notification functionality here
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {


                // Add your notification functionality here
              },
            ),
          ],
        ),

        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: BottomNavigationBar(
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.black,
              showSelectedLabels:false,

              onTap: (value){
                setState(() {
                  _selectedIndex=value;
                });
              },
              currentIndex:_selectedIndex,
              backgroundColor: Colors.green,

              items: [

                BottomNavigationBarItem(icon: Icon(Icons.home_outlined,color: Colors.green,),label: "Home", backgroundColor: Colors.white,),
                BottomNavigationBarItem(icon: Icon(Icons.speed,color: Colors.green,),label: "Home", backgroundColor: Colors.white,),
                BottomNavigationBarItem(icon: Icon(Icons.people_outlined,color: Colors.green,),label: "Bookmark", backgroundColor: Colors.white,),
                BottomNavigationBarItem(icon: Icon(Icons.chrome_reader_mode_outlined,color: Colors.green,),label: "Profile", backgroundColor: Colors.white,),
                BottomNavigationBarItem(icon: Icon(Icons.multiline_chart_outlined,color: Colors.green,),label: "Settings", backgroundColor: Colors.white,),


              ],
            ),
          ),
        ),



        body: _widgetOptions.elementAt(_selectedIndex)
    );
  }
}
