import 'package:carbonery/services/auth_service.dart';
import 'package:carbonery/widgets/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ExpertHome extends StatefulWidget {
  const ExpertHome({Key? key}) : super(key: key);

  @override
  State<ExpertHome> createState() => _ExpertHomeState();
}

class _ExpertHomeState extends State<ExpertHome> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Drawer(
              backgroundColor: Colors.grey.shade300,
              width: 200,
              child: Column(
                children: [
                  DrawerHeader(
                    child: CircleAvatar(
                      maxRadius: 50,
                      backgroundImage: AssetImage(
                        'assets/img/user.png',
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Dashboard'),
                  ),
                  ListTile(
                    leading: Icon(Icons.feedback),
                    title: Text('Message'),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
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

            // First half of page
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  // First 4 boxes in grid
                  AspectRatio(
                    aspectRatio: 4,
                    child: SizedBox(
                      width: double.infinity,
                      child: GridView.builder(
                        itemCount: 4,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                        ),
                        itemBuilder: (context, index) {
                          // Define progress values, texts, and subtitles for each grid item
                          List<double> progressValues = [0.2, 0.5, 0.7, 0.3]; // Example progress values
                          List<String> texts = [
                            '740Kt',
                            '512Kt',
                            '1000kt',
                            '370Kt',
                          ];
                          List<String> subtitles = [
                            'Home Energy',
                            'Dietary',
                            'Transportation',
                            'Waste management',
                          ];
                          List<Color> progressColors = [
                            Color(0xffbc4b51),
                            Color(0xffe5c687),
                            Color(0xff38a3a5),
                            Color(0xff6a5d7b),
                          ];

                          return Container(
                            width: 150,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 12,
                                  width: 150,
                                  child: LinearProgressIndicator(
                                    value: progressValues[index],
                                    backgroundColor: Colors.grey[300],
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      progressColors[index],
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  texts[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  subtitles[index],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  // Your Container
                  Expanded(
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        ),
                      ),
                ],
              ),
            ),

            // Second half of page
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 350,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey,
                      ),
                    ),

                  ),

                  // Placeholder Container
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



