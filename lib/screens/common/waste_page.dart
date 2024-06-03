// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:flutter/material.dart';
// // //
// // // class WastePage extends StatefulWidget {
// // //   const WastePage({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   State<WastePage> createState() => _WastePageState();
// // // }
// // //
// // // class _WastePageState extends State<WastePage> {
// // //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// // //   Map<String, double> consumptionData = {};
// // //   String? selectedTitle;
// // //   double emissionFactor = 0.4; // Example emission factor (in kg CO2/kg food)
// // //
// // //   @override
// // //   void initState() {
// // //     getData();
// // //     super.initState();
// // //   }
// // //
// // //   var uid;
// // //
// // //   getData() async {
// // //     uid = FirebaseAuth.instance.currentUser!.uid;
// // //     setState(() {});
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         backgroundColor: Colors.white,
// // //       ),
// // //       body: Container(
// // //         child: GridView(
// // //           padding: EdgeInsets.all(20),
// // //           children: [
// // //             _buildGridItem('assets/img/foodwaste.png', 'Food Waste'),
// // //             _buildGridItem('assets/img/plasticwaste.png', 'Plastic Waste'),
// // //             _buildGridItem('assets/img/paperwaste.png', 'Paper Waste'),
// // //             _buildGridItem('assets/img/can.png', 'Metal Waste'),
// // //             _buildGridItem('assets/img/e-waste.png', 'E-Waste'),
// // //             _buildGridItem('assets/img/leaves.png', 'Leaves'),
// // //           ],
// // //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// // //             crossAxisCount: 2,
// // //             mainAxisSpacing: 10,
// // //             crossAxisSpacing: 10,
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   Widget _buildGridItem(String imagePath, String title) {
// // //     return GestureDetector(
// // //       onTap: () {
// // //         showModalBottomSheet(
// // //           context: context,
// // //           isScrollControlled: true,
// // //           builder: (BuildContext context) {
// // //             return SingleChildScrollView(
// // //               child: Container(
// // //                 width: MediaQuery.of(context).size.width,
// // //                 padding: EdgeInsets.only(
// // //                   bottom: MediaQuery.of(context).viewInsets.bottom,
// // //                 ),
// // //                 child: Padding(
// // //                   padding: EdgeInsets.all(20),
// // //                   child: Column(
// // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // //                     children: _buildBottomSheetContent(title),
// // //                   ),
// // //                 ),
// // //               ),
// // //             );
// // //           },
// // //         );
// // //       },
// // //       child: Container(
// // //         color: Colors.white,
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: [
// // //             Stack(
// // //               alignment: Alignment.center,
// // //               children: [
// // //                 CircleAvatar(
// // //                   radius: 25,
// // //                   backgroundColor: Colors.greenAccent,
// // //                 ),
// // //                 Image.asset(
// // //                   imagePath,
// // //                   height: 70,
// // //                   width: 70,
// // //                 ),
// // //               ],
// // //             ),
// // //             SizedBox(height: 5),
// // //             Text(
// // //               title,
// // //               textAlign: TextAlign.center,
// // //               style: TextStyle(
// // //                 fontSize: 16,
// // //                 fontWeight: FontWeight.bold,
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   List<Widget> _buildBottomSheetContent(String title) {
// // //     return [
// // //       Text(
// // //         "Select your consumption level:",
// // //         style: TextStyle(
// // //           fontSize: 24,
// // //           fontWeight: FontWeight.bold,
// // //         ),
// // //       ),
// // //       SizedBox(height: 20),
// // //       ListTile(
// // //         onTap: () {
// // //           setState(() {
// // //             consumptionData[title] = 0.2;
// // //           });
// // //           Navigator.pop(context);
// // //           _calculateTotalEmission();
// // //         },
// // //         title: Text("Low"),
// // //         subtitle: Text("0.1-0.3kg"),
// // //       ),
// // //       ListTile(
// // //         onTap: () {
// // //           setState(() {
// // //             consumptionData[title] = 0.4;
// // //           });
// // //           Navigator.pop(context);
// // //           _calculateTotalEmission();
// // //         },
// // //         title: Text("Medium"),
// // //         subtitle: Text("0.3-0.5kg"),
// // //       ),
// // //       ListTile(
// // //         onTap: () {
// // //           setState(() {
// // //             consumptionData[title] = 0.5;
// // //           });
// // //           Navigator.pop(context);
// // //           _calculateTotalEmission();
// // //         },
// // //         title: Text("High"),
// // //         subtitle: Text("0.4-0.6kg"),
// // //       ),
// // //     ];
// // //   }
// // //
// // //   void _calculateTotalEmission() {
// // //     double totalEmission = 0;
// // //     consumptionData.values.forEach((consumption) {
// // //       totalEmission += consumption * emissionFactor;
// // //     });
// // //     print('Total Emission: $totalEmission kg CO2');
// // //     _firestore.collection('emission').doc(uid).update({
// // //       'waste_consumption': consumptionData,
// // //       'total_waste_consumption': totalEmission,
// // //       //'uid': uid,
// // //     });
// // //   }
// // // }
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// //
// // class WastePage extends StatefulWidget {
// //   const WastePage({Key? key}) : super(key: key);
// //
// //   @override
// //   State<WastePage> createState() => _WastePageState();
// // }
// //
// // class _WastePageState extends State<WastePage> {
// //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// //   Map<String, double> consumptionData = {};
// //   String? selectedTitle;
// //   double emissionFactor = 0.4; // Example emission factor (in kg CO2/kg food)
// //
// //   @override
// //   void initState() {
// //     getData();
// //     super.initState();
// //   }
// //
// //   var uid;
// //
// //   getData() async {
// //     uid = FirebaseAuth.instance.currentUser!.uid;
// //     setState(() {});
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //       ),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: GridView(
// //               padding: EdgeInsets.all(20),
// //               children: [
// //                 _buildGridItem('assets/img/foodwaste.png', 'Food Waste'),
// //                 _buildGridItem('assets/img/plasticwaste.png', 'Plastic Waste'),
// //                 _buildGridItem('assets/img/paperwaste.png', 'Paper Waste'),
// //                 _buildGridItem('assets/img/can.png', 'Metal Waste'),
// //                 _buildGridItem('assets/img/e-waste.png', 'E-Waste'),
// //                 _buildGridItem('assets/img/leaves.png', 'Leaves'),
// //               ],
// //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                 crossAxisCount: 2,
// //                 mainAxisSpacing: 10,
// //                 crossAxisSpacing: 10,
// //               ),
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 ElevatedButton(
// //                   onPressed: _calculateTotalEmission,
// //                   style: ElevatedButton.styleFrom(
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(10),
// //                     ),
// //                     backgroundColor: Colors.green,
// //                   ),
// //                   child: Text(
// //                     'Calculate Total Emission',
// //                     style: TextStyle(color: Colors.white),
// //                   ),
// //                 ),
// //                 SizedBox(width: 10),
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     setState(() {
// //                       consumptionData.clear();
// //                       selectedTitle = null;
// //                     });
// //                   },
// //                   style: ElevatedButton.styleFrom(
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(10),
// //                     ),
// //                     backgroundColor: Colors.lightBlue[700],
// //                   ),
// //                   child: Text(
// //                     'Reset Selection',
// //                     style: TextStyle(color: Colors.white),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildGridItem(String imagePath, String title) {
// //     bool isAlreadySelected = consumptionData.containsKey(title);
// //     return GestureDetector(
// //       onTap: () {
// //         showModalBottomSheet(
// //           context: context,
// //           isScrollControlled: true,
// //           builder: (BuildContext context) {
// //             return SingleChildScrollView(
// //               child: Container(
// //                 width: MediaQuery.of(context).size.width,
// //                 padding: EdgeInsets.only(
// //                   bottom: MediaQuery.of(context).viewInsets.bottom,
// //                 ),
// //                 child: Padding(
// //                   padding: EdgeInsets.all(20),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: _buildBottomSheetContent(title),
// //                   ),
// //                 ),
// //               ),
// //             );
// //           },
// //         );
// //       },
// //       child: Container(
// //         color: isAlreadySelected ? Colors.blueAccent.withOpacity(0.3) : Colors.white,
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Stack(
// //               alignment: Alignment.center,
// //               children: [
// //                 CircleAvatar(
// //                   radius: 25,
// //                   backgroundColor: Colors.greenAccent,
// //                 ),
// //                 Image.asset(
// //                   imagePath,
// //                   height: 70,
// //                   width: 70,
// //                 ),
// //               ],
// //             ),
// //             SizedBox(height: 5),
// //             Text(
// //               title,
// //               textAlign: TextAlign.center,
// //               style: TextStyle(
// //                 fontSize: 16,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   List<Widget> _buildBottomSheetContent(String title) {
// //     return [
// //       Text(
// //         "Select your consumption level:",
// //         style: TextStyle(
// //           fontSize: 24,
// //           fontWeight: FontWeight.bold,
// //         ),
// //       ),
// //       SizedBox(height: 20),
// //       ListTile(
// //         onTap: () {
// //           setState(() {
// //             consumptionData[title] = 0.2;
// //           });
// //           Navigator.pop(context);
// //         },
// //         title: Text("Low"),
// //         subtitle: Text("0.1-0.3kg"),
// //         tileColor: consumptionData[title] == 0.2 ? Colors.blueAccent : null,
// //       ),
// //       ListTile(
// //         onTap: () {
// //           setState(() {
// //             consumptionData[title] = 0.4;
// //           });
// //           Navigator.pop(context);
// //         },
// //         title: Text("Medium"),
// //         subtitle: Text("0.3-0.5kg"),
// //         tileColor: consumptionData[title] == 0.4 ? Colors.blueAccent : null,
// //       ),
// //       ListTile(
// //         onTap: () {
// //           setState(() {
// //             consumptionData[title] = 0.5;
// //           });
// //           Navigator.pop(context);
// //         },
// //         title: Text("High"),
// //         subtitle: Text("0.4-0.6kg"),
// //         tileColor: consumptionData[title] == 0.5 ? Colors.blueAccent : null,
// //       ),
// //     ];
// //   }
// //
// //   void _calculateTotalEmission() {
// //     double totalEmission = 0;
// //     consumptionData.values.forEach((consumption) {
// //       totalEmission += consumption * emissionFactor;
// //     });
// //     print('Total Emission: $totalEmission kg CO2');
// //     _firestore.collection('emission').doc(uid).update({
// //       'waste_consumption': consumptionData,
// //       'total_waste_consumption': totalEmission,
// //     });
// //   }
// // }
//
//
//
//
//
//
//
//
//
//
//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class WastePage extends StatefulWidget {
//   const WastePage({Key? key}) : super(key: key);
//
//   @override
//   State<WastePage> createState() => _WastePageState();
// }
//
// class _WastePageState extends State<WastePage> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   Map<String, double> consumptionData = {};
//   String? selectedTitle;
//   double emissionFactor = 0.4; // Example emission factor (in kg CO2/kg waste)
//   var uid;
//
//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }
//
//   getData() async {
//     uid = FirebaseAuth.instance.currentUser!.uid;
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text("Select your consumption", style: TextStyle(color: Colors.black)),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.history, color: Colors.black),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => EmissionHistoryPage(uid: uid)),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: GridView(
//               padding: EdgeInsets.all(20),
//               children: [
//                 _buildGridItem('assets/img/foodwaste.png', 'Food Waste'),
//                 _buildGridItem('assets/img/plasticwaste.png', 'Plastic Waste'),
//                 _buildGridItem('assets/img/paperwaste.png', 'Paper Waste'),
//                 _buildGridItem('assets/img/can.png', 'Metal Waste'),
//                 _buildGridItem('assets/img/e-waste.png', 'E-Waste'),
//                 _buildGridItem('assets/img/leaves.png', 'Leaves'),
//               ],
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 10,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: _calculateTotalEmission,
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     backgroundColor: Colors.green,
//                   ),
//                   child: Text(
//                     'Calculate Total Emission',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       consumptionData.clear();
//                       selectedTitle = null;
//                     });
//                   },
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     backgroundColor: Colors.lightBlue[700],
//                   ),
//                   child: Text(
//                     'Reset Selection',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildGridItem(String imagePath, String title) {
//     bool isAlreadySelected = consumptionData.containsKey(title);
//     return GestureDetector(
//       onTap: () {
//         showModalBottomSheet(
//           context: context,
//           isScrollControlled: true,
//           builder: (BuildContext context) {
//             return SingleChildScrollView(
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 padding: EdgeInsets.only(
//                   bottom: MediaQuery.of(context).viewInsets.bottom,
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.all(20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: _buildBottomSheetContent(title),
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//       },
//       child: Container(
//         color: isAlreadySelected ? Colors.blueAccent.withOpacity(0.3) : Colors.white,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Stack(
//               alignment: Alignment.center,
//               children: [
//                 CircleAvatar(
//                   radius: 25,
//                   backgroundColor: Colors.greenAccent,
//                 ),
//                 Image.asset(
//                   imagePath,
//                   height: 70,
//                   width: 70,
//                 ),
//               ],
//             ),
//             SizedBox(height: 5),
//             Text(
//               title,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   List<Widget> _buildBottomSheetContent(String title) {
//     return [
//       Text(
//         "Select your consumption level:",
//         style: TextStyle(
//           fontSize: 24,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       SizedBox(height: 20),
//       ListTile(
//         onTap: () {
//           setState(() {
//             consumptionData[title] = 0.2;
//           });
//           Navigator.pop(context);
//         },
//         title: Text("Low"),
//         subtitle: Text("0.1-0.3kg"),
//         tileColor: consumptionData[title] == 0.2 ? Colors.blueAccent : null,
//       ),
//       ListTile(
//         onTap: () {
//           setState(() {
//             consumptionData[title] = 0.4;
//           });
//           Navigator.pop(context);
//         },
//         title: Text("Medium"),
//         subtitle: Text("0.3-0.5kg"),
//         tileColor: consumptionData[title] == 0.4 ? Colors.blueAccent : null,
//       ),
//       ListTile(
//         onTap: () {
//           setState(() {
//             consumptionData[title] = 0.5;
//           });
//           Navigator.pop(context);
//         },
//         title: Text("High"),
//         subtitle: Text("0.4-0.6kg"),
//         tileColor: consumptionData[title] == 0.5 ? Colors.blueAccent : null,
//       ),
//     ];
//   }
//
//   void _calculateTotalEmission() async {
//     double totalEmission = 0;
//     consumptionData.forEach((title, consumption) {
//       totalEmission += consumption * emissionFactor;
//     });
//
//     // Save to Firestore
//     await _saveEmissionToFirestore(totalEmission);
//
//     print('Total Emission: $totalEmission kg CO2');
//   }
//
//   Future<void> _saveEmissionToFirestore(double totalEmission) async {
//     String userId = FirebaseAuth.instance.currentUser!.uid;
//     DateTime now = DateTime.now();
//     String formattedDate = "${now.year}-${now.month}-${now.day}";
//
//     DocumentReference docRef = _firestore.collection('waste_emissions').doc(userId);
//
//     await _firestore.runTransaction((transaction) async {
//       DocumentSnapshot docSnapshot = await transaction.get(docRef);
//
//       if (!docSnapshot.exists) {
//         transaction.set(docRef, {
//           'history': [
//             {
//               'date': formattedDate,
//               'emission': totalEmission,
//             }
//           ]
//         });
//       } else {
//         transaction.update(docRef, {
//           'history': FieldValue.arrayUnion([
//             {
//               'date': formattedDate,
//               'emission': totalEmission,
//             }
//           ])
//         });
//       }
//     });
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Emission data saved successfully')),
//     );
//   }
// }
//
// class EmissionHistoryPage extends StatelessWidget {
//   final String uid;
//   const EmissionHistoryPage({Key? key, required this.uid}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('History'),
//       ),
//       body: StreamBuilder<DocumentSnapshot>(
//         stream: FirebaseFirestore.instance.collection('waste_emissions').doc(uid).snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(child: CircularProgressIndicator());
//           }
//
//           var history = (snapshot.data!['history'] as List<dynamic>)
//               .map((entry) => Map<String, dynamic>.from(entry))
//               .toList();
//
//           // Sort history in descending order by date
//           history.sort((a, b) => b['date'].compareTo(a['date']));
//
//           return ListView.builder(
//             itemCount: history.length,
//             itemBuilder: (context, index) {
//               var entry = history[index];
//               return ListTile(
//                 title: Text("Emission: ${entry['emission']} kg CO2"),
//                 subtitle: Text("Date: ${entry['date']}"),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WastePage extends StatefulWidget {
  const WastePage({Key? key}) : super(key: key);

  @override
  State<WastePage> createState() => _WastePageState();
}

class _WastePageState extends State<WastePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, double> consumptionData = {};
  String? selectedTitle;
  double emissionFactor = 0.4; // Example emission factor (in kg CO2/kg waste)
  var uid;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    uid = FirebaseAuth.instance.currentUser!.uid;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Select your consumption", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.history, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WasteEmissionHistoryPage(uid: uid)),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView(
              padding: EdgeInsets.all(20),
              children: [
                _buildGridItem('assets/img/foodwaste.png', 'Food Waste'),
                _buildGridItem('assets/img/plasticwaste.png', 'Plastic Waste'),
                _buildGridItem('assets/img/paperwaste.png', 'Paper Waste'),
                _buildGridItem('assets/img/can.png', 'Metal Waste'),
                _buildGridItem('assets/img/e-waste.png', 'E-Waste'),
                _buildGridItem('assets/img/leaves.png', 'Leaves'),
              ],
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _calculateTotalEmission,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    'Calculate Total Emission',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      consumptionData.clear();
                      selectedTitle = null;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.lightBlue[700],
                  ),
                  child: Text(
                    'Reset Selection',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(String imagePath, String title) {
    bool isAlreadySelected = consumptionData.containsKey(title);
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _buildBottomSheetContent(title),
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Container(
        color: isAlreadySelected ? Colors.blueAccent.withOpacity(0.3) : Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.greenAccent,
                ),
                Image.asset(
                  imagePath,
                  height: 70,
                  width: 70,
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildBottomSheetContent(String title) {
    return [
      Text(
        "Select your consumption level:",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 20),
      ListTile(
        onTap: () {
          setState(() {
            consumptionData[title] = 0.2;
          });
          Navigator.pop(context);
        },
        title: Text("Low"),
        subtitle: Text("0.1-0.3kg"),
        tileColor: consumptionData[title] == 0.2 ? Colors.blueAccent : null,
      ),
      ListTile(
        onTap: () {
          setState(() {
            consumptionData[title] = 0.4;
          });
          Navigator.pop(context);
        },
        title: Text("Medium"),
        subtitle: Text("0.3-0.5kg"),
        tileColor: consumptionData[title] == 0.4 ? Colors.blueAccent : null,
      ),
      ListTile(
        onTap: () {
          setState(() {
            consumptionData[title] = 0.5;
          });
          Navigator.pop(context);
        },
        title: Text("High"),
        subtitle: Text("0.4-0.6kg"),
        tileColor: consumptionData[title] == 0.5 ? Colors.blueAccent : null,
      ),
    ];
  }

  void _calculateTotalEmission() async {
    double totalEmission = 0;
    consumptionData.forEach((title, consumption) {
      totalEmission += consumption * emissionFactor;
    });

    // Save to Firestore
    await _saveEmissionToFirestore(totalEmission);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Emission data saved successfully')),
    );
  }

  Future<void> _saveEmissionToFirestore(double totalEmission) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    String formattedTime = DateFormat('hh:mm a').format(now);

    await FirebaseFirestore.instance
        .collection('waste_emissions')
        .doc(userId)
        .collection('daily_emissions')
        .doc(now.toIso8601String())
        .set({
      'consumption': consumptionData,
      'total_emission': totalEmission,
      'date': now,
    });
  }
}

class WasteEmissionHistoryPage extends StatelessWidget {
  final String uid;
  const WasteEmissionHistoryPage({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Waste Emission History', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
        ),
        body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('waste_emissions')
        .doc(uid)
        .collection('daily_emissions')
        .orderBy('date', descending: true)
        .snapshots(),
    builder: (context, snapshot) {
    if (!snapshot.hasData) {
    return Center(child: CircularProgressIndicator());
    }
    var documents = snapshot.data!.docs;
    return ListView.builder(
    itemCount: documents.length,
      itemBuilder: (context, index) {
        storeTotalEmission(double.parse(documents[0]['total_emission'].toString()));
        var data = documents[index].data() as Map<String, dynamic>;
        var timestamp = data['date'].toDate();
        var formattedDate = DateFormat('yyyy-MM-dd').format(timestamp);
        var formattedTime = DateFormat('hh:mm a').format(timestamp);

        return Dismissible(
          key: Key(documents[index].id),
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.delete, color: Colors.white),
          ),
          onDismissed: (direction) {
            var removedDoc = documents[index];
            _deleteEmission(removedDoc.id);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Entry deleted'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    _undoDelete(removedDoc);
                  },
                ),
              ),
            );
          },

          child: Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.green[50],
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
            child: ListTile(
              title: Text("Emission: ${data['total_emission']} kg CO2"),
              subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formattedDate),
                Text(formattedTime),
              ],
            ),
            ),
          ),
        );
      },
    );
    },
        ),
    );
  }

  void _deleteEmission(String docId) async {
    await FirebaseFirestore.instance
        .collection('waste_emissions')
        .doc(uid)
        .collection('daily_emissions')
        .doc(docId)
        .delete();
  }

  void _undoDelete(QueryDocumentSnapshot removedDoc) async {
    await FirebaseFirestore.instance
        .collection('waste_emissions')
        .doc(uid)
        .collection('daily_emissions')
        .doc(removedDoc.id)
        .set(removedDoc.data() as Map<String, dynamic>);
  }
  Future<void> storeTotalEmission(double totalEmission) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('total_emission_waste', totalEmission);
  }

  getTotalEmission() async {
    final prefs = await SharedPreferences.getInstance();

    final val=await prefs.getDouble('total_emission_waste');
    print(val);
    return val;

  }
}

