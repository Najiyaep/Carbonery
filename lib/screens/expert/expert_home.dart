import 'package:carbonery/data/air_quality.dart';
import 'package:carbonery/data/fetch_data.dart';
import 'package:carbonery/screens/common/aqi_page.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:carbonery/screens/expert/blog_page.dart';
import 'package:carbonery/screens/expert/expert_aqi.dart';
import 'package:carbonery/services/auth_service.dart';

class ExpertHome extends StatefulWidget {
  const ExpertHome({Key? key}) : super(key: key);

  @override
  State<ExpertHome> createState() => _ExpertHomeState();
}

class _ExpertHomeState extends State<ExpertHome> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade900,
        title: Text(
          'Expert Dashboard',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drawer widget
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.cyan.shade900, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
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
                    leading: Icon(Icons.home, color: Colors.white),
                    title: Text('Dashboard', style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    leading: Icon(Icons.feedback, color: Colors.white),
                    title: Text('Message', style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings, color: Colors.white),
                    title: Text('Settings', style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.white),
                    title: Text('Logout', style: TextStyle(color: Colors.white)),
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
                          List<double> progressValues = [
                            0.7,
                            0.5,
                            0.8,
                            0.3
                          ]; // Example progress values
                          List<String> texts = [
                            '740Kt',
                            '512Kt',
                            '800kt',
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
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
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
                  // BlogListScreen Container
                  Expanded(
                    child: Container(
                      height: 100,
                      padding: EdgeInsets.all(15),
                      width: double.infinity,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: BlogListScreen(),
                    ),
                  ),
                ],
              ),
            ),
            // Second half of page
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 350,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          child: TableCalendar(
                            firstDay: DateTime.utc(2010, 10, 16),
                            lastDay: DateTime.utc(2030, 3, 14),
                            focusedDay: _focusedDay,
                            selectedDayPredicate: (day) {
                              return isSameDay(_selectedDay, day);
                            },
                            onDaySelected: (selectedDay, focusedDay) {
                              setState(() {
                                _selectedDay = selectedDay;
                                _focusedDay = focusedDay;
                              },
                              );

                            },
                            calendarStyle:CalendarStyle(markersMaxCount: 1,
                            selectedDecoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            )),
                          ),
                        ),
                      ),
                    ),
                    // Placeholder Container with CircularPercentIndicator
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExpertAqi(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          height: 260,
                          width: double.infinity, // Set a fixed height for the placeholder container
                          child: Center(
                            child:FutureBuilder(
                                future: fetchData(),
                                builder: (context, snap) {
                                  if(snap.hasData) {
                                    return AqiScreen(snap.data!);
                                  } else {
                                    return const Scaffold(
                                      body: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  }
                                }
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:carbonery/constants/constant.dart';
// import 'package:carbonery/services/auth_service.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';
//
// class AdminHome extends StatefulWidget {
//   const AdminHome({super.key});
//
//   @override
//   State<AdminHome> createState() => _AdminHomeState();
// }
//
// class _AdminHomeState extends State<AdminHome> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//       ),
//       backgroundColor: Colors.grey.shade300,
//       // drawer: Drawer(backgroundColor: Colors.grey.shade300,
//       // child: Column(
//       //   children: [
//       //     DrawerHeader(child: Icon(Icons.favorite)),
//       //     ListTile(
//       //       leading: Icon(Icons.home),
//       //       title: Text('Dashboard'),
//       //     ),
//       // ListTile(
//       //   leading: Icon(Icons.chat),
//       //   title: Text('Message'),
//       // ),
//       //     ListTile(
//       //       leading: Icon(Icons.settings),
//       //       title: Text('Settings'),
//       //     ),
//       //     ListTile(
//       //       leading: Icon(Icons.logout),
//       //       title: Text('Logout'),
//       //       onTap: ()
//       //       async{
//       //
//       //         await AuthService().logout().then((value) => Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false));
//       //       },
//       //     ),
//       //   ],
//       // ),
//       // ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Drawer(
//               backgroundColor: Colors.grey.shade300,
//               width: 200,
//               child: Column(
//                 children: [
//                   DrawerHeader(child: CircleAvatar(
//                     maxRadius: 50,
//                     child: Image.asset(
//                      'assets/img/user.png',
//                       width: 200,
//                      height: 200,
//                    ),
//                   ),),
//                   ListTile(
//                     leading: Icon(Icons.home),
//                     title: Text('Dashboard'),
//                   ),
//                   ListTile(
//                     leading: Icon(Icons.feedback),
//                     title: Text('Message'),
//                   ),
//                   ListTile(
//                     leading: Icon(Icons.settings),
//                     title: Text('Settings'),
//                   ),
//                   ListTile(
//                     leading: Icon(Icons.logout),
//                     title: Text('Logout'),
//                     onTap: ()
//                     async{
//
//                       await AuthService().logout().then((value) => Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false));
//                     },
//                   ),
//                 ],
//               ),
//             ),
//
//             // First half of page
//             Expanded(
//               flex: 2,
//               child: Column(
//                 children: [
//                   // First 4 boxes in grid
//                   AspectRatio(
//                     aspectRatio: 4,
//                     child: SizedBox(
//                       width: double.infinity,
//                       child: GridView.builder(
//                         itemCount: 4,
//                         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 4,
//                         ),
//                         itemBuilder: (context, index) {
//                           // Define image paths, texts, and subtitles for each grid item
//                           List<String> imagePaths = [
//                             'assets/img/group.png', // Image 1 for first grid
//                             'assets/img/human-footprints.png', // Image 2 for second grid
//                             'assets/img/high-quality.png', // Image 3 for third grid
//                             'assets/img/feedback.png', // Image 4 for fourth grid
//                           ];
//                           List<String> texts = [
//                             '10',
//                             '512Kt',
//                             '4',
//                             '10',
//                           ];
//                           List<String> subtitles = [
//                             'Users',
//                             'Total Emission',
//                             'Top Contributors',
//                             'Feedbacks',
//                           ];
//
//                           return Container(
//                             width: 150,
//                             height: 200,
//                             decoration: BoxDecoration(
//                               color: Colors.white70,
//                               borderRadius: BorderRadius.circular(10), // Adjust as needed
//                             ),
//                             margin: const EdgeInsets.all(8.0),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   imagePaths[index],
//                                   fit: BoxFit.cover,
//                                   height: 50,
//                                   width: 50,
//                                 ),
//                                 SizedBox(height: 8), // Add spacing between image and text
//                                 Text(
//                                   texts[index],
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 SizedBox(height: 4), // Add spacing between text and subtitle
//                                 Text(
//                                   subtitles[index],
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//
//                         },
//                       ),
//                     ),
//                   ),
//
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: 7,
//                       itemBuilder: (context, index) {
//                         return Container(
//                           color: Colors.white70, // Example color, replace as needed
//                           margin: const EdgeInsets.all(8.0),
//                           child: ListTile(
//                             title: Text('Day ${index + 1}'),
//                             // Other tile properties as needed
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             // Second half of page
//           Expanded(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     height: 400,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       color: Colors.grey[400],
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Row(
//                           //   children: [
//                           //      SizedBox(
//                           //        height: 70,
//                           //        width: 70,
//                           //      child: ClipRRect(
//                           //       borderRadius: BorderRadius.circular(40),
//                           //        child: Placeholder(), // Placeholder for the image
//                           //       ),
//                           //      ),
//                           //    ],
//                           //  ),
//                           Expanded(
//                             child: Center(
//                               child: SfRadialGauge(
//                                 axes: <RadialAxis>[
//                                   RadialAxis(
//                                     radiusFactor: 0.5,
//                                     pointers: <GaugePointer>[
//                                       RangePointer(
//                                         value: 40,
//                                         cornerStyle: CornerStyle.bothCurve,
//                                         color: Color(0xffbc4b51),
//                                       )
//                                     ],
//                                     interval: 5,
//                                     startAngle: 5,
//                                     endAngle: 5,
//                                     showTicks: false,
//                                     showLabels: false,
//                                     annotations: <GaugeAnnotation>[
//                                       GaugeAnnotation(
//                                         widget: Column(
//                                           mainAxisAlignment: MainAxisAlignment.center,
//                                           children: [
//                                             Text(
//                                               '40%',
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 20,
//                                               ),
//                                             ),
//                                             Text(
//                                               'Carbon Footprint',
//                                               style: TextStyle(fontSize: 18),
//                                             )
//                                           ],
//                                         ),
//                                         angle: 250,
//                                         positionFactor: 0.1,
//                                       ),
//                                     ],
//                                   ),
//                                   RadialAxis(
//                                     radiusFactor: 0.65,
//                                     pointers: [
//                                       RangePointer(
//                                         value: 30,
//                                         cornerStyle: CornerStyle.bothCurve,
//                                         color: Color(0xffe5c687),
//                                       ),
//                                     ],
//                                     interval: 5,
//                                     startAngle: 5,
//                                     endAngle: 5,
//                                     showTicks: false,
//                                     showLabels: false,
//                                   ),
//                                   RadialAxis(
//                                     radiusFactor: 0.8,
//                                     pointers: [
//                                       RangePointer(
//                                         value: 15,
//                                         cornerStyle: CornerStyle.bothCurve,
//                                         color: Color(0xff38a3a5),
//                                       ),
//                                     ],
//                                     interval: 5,
//                                     startAngle: 5,
//                                     endAngle: 5,
//                                     showTicks: false,
//                                     showLabels: false,
//                                   ),
//                                   RadialAxis(
//                                     radiusFactor: 0.95,
//                                     pointers: [
//                                       RangePointer(
//                                         value: 15,
//                                         cornerStyle: CornerStyle.bothCurve,
//                                         color: Color(0xff6a5d7b),
//                                       ),
//                                     ],
//                                     interval: 5,
//                                     startAngle: 5,
//                                     endAngle: 5,
//                                     showTicks: false,
//                                     showLabels: false,
//                                   ),
//                                   // Add other RadialAxis as needed
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//
//           // List of stuff
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           color: Colors.white70,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//
//     );
//   }
// }