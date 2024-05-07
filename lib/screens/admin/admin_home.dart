import 'package:carbonery/constants/constant.dart';
import 'package:carbonery/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

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
      backgroundColor: Colors.grey.shade300,
      // drawer: Drawer(backgroundColor: Colors.grey.shade300,
      // child: Column(
      //   children: [
      //     DrawerHeader(child: Icon(Icons.favorite)),
      //     ListTile(
      //       leading: Icon(Icons.home),
      //       title: Text('Dashboard'),
      //     ),
      // ListTile(
      //   leading: Icon(Icons.chat),
      //   title: Text('Message'),
      // ),
      //     ListTile(
      //       leading: Icon(Icons.settings),
      //       title: Text('Settings'),
      //     ),
      //     ListTile(
      //       leading: Icon(Icons.logout),
      //       title: Text('Logout'),
      //       onTap: ()
      //       async{
      //
      //         await AuthService().logout().then((value) => Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false));
      //       },
      //     ),
      //   ],
      // ),
      // ),
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
                    onTap: ()
                    async{

                      await AuthService().logout().then((value) => Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false));
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
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                        ),
                        itemBuilder: (context, index) {
                          // Define image paths, texts, and subtitles for each grid item
                          List<String> imagePaths = [
                            'assets/img/group.png', // Image 1 for first grid
                            'assets/img/human-footprints.png', // Image 2 for second grid
                            'assets/img/high-quality.png', // Image 3 for third grid
                            'assets/img/feedback.png', // Image 4 for fourth grid
                          ];
                          List<String> texts = [
                            '10',
                            '512Kt',
                            '4',
                            '10',
                          ];
                          List<String> subtitles = [
                            'Users',
                            'Total Emission',
                            'Top Contributors',
                            'Feedbacks',
                          ];

                          return Container(
                            width: 150,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(10), // Adjust as needed
                            ),
                            margin: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  imagePaths[index],
                                  fit: BoxFit.cover,
                                  height: 50,
                                  width: 50,
                                ),
                                SizedBox(height: 8), // Add spacing between image and text
                                Text(
                                  texts[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4), // Add spacing between text and subtitle
                                Text(
                                  subtitles[index],
                                  style: TextStyle(
                                    fontSize: 12,
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

                  Expanded(
                    child: ListView.builder(
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.white70, // Example color, replace as needed
                          margin: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text('Day ${index + 1}'),
                            // Other tile properties as needed
                          ),
                        );
                      },
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
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[400],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Row(
                          //   children: [
                          //      SizedBox(
                          //        height: 70,
                          //        width: 70,
                          //      child: ClipRRect(
                          //       borderRadius: BorderRadius.circular(40),
                          //        child: Placeholder(), // Placeholder for the image
                          //       ),
                          //      ),
                          //    ],
                          //  ),
                          Expanded(
                            child: Center(
                              child: SfRadialGauge(
                                axes: <RadialAxis>[
                                  RadialAxis(
                                    radiusFactor: 0.5,
                                    pointers: <GaugePointer>[
                                      RangePointer(
                                        value: 40,
                                        cornerStyle: CornerStyle.bothCurve,
                                        color: Color(0xffbc4b51),
                                      )
                                    ],
                                    interval: 5,
                                    startAngle: 5,
                                    endAngle: 5,
                                    showTicks: false,
                                    showLabels: false,
                                    annotations: <GaugeAnnotation>[
                                      GaugeAnnotation(
                                        widget: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '40%',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Text(
                                              'Carbon Footprint',
                                              style: TextStyle(fontSize: 18),
                                            )
                                          ],
                                        ),
                                        angle: 250,
                                        positionFactor: 0.1,
                                      ),
                                    ],
                                  ),
                                  RadialAxis(
                                    radiusFactor: 0.65,
                                    pointers: [
                                      RangePointer(
                                        value: 30,
                                        cornerStyle: CornerStyle.bothCurve,
                                        color: Color(0xffe5c687),
                                      ),
                                    ],
                                    interval: 5,
                                    startAngle: 5,
                                    endAngle: 5,
                                    showTicks: false,
                                    showLabels: false,
                                  ),
                                  RadialAxis(
                                    radiusFactor: 0.8,
                                    pointers: [
                                      RangePointer(
                                        value: 15,
                                        cornerStyle: CornerStyle.bothCurve,
                                        color: Color(0xff38a3a5),
                                      ),
                                    ],
                                    interval: 5,
                                    startAngle: 5,
                                    endAngle: 5,
                                    showTicks: false,
                                    showLabels: false,
                                  ),
                                  RadialAxis(
                                    radiusFactor: 0.95,
                                    pointers: [
                                      RangePointer(
                                        value: 15,
                                        cornerStyle: CornerStyle.bothCurve,
                                        color: Color(0xff6a5d7b),
                                      ),
                                    ],
                                    interval: 5,
                                    startAngle: 5,
                                    endAngle: 5,
                                    showTicks: false,
                                    showLabels: false,
                                  ),
                                  // Add other RadialAxis as needed
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

          // List of stuff
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


