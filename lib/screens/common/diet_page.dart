// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// //
// // class DietPage extends StatefulWidget {
// //   const DietPage({Key? key}) : super(key: key);
// //
// //   @override
// //   State<DietPage> createState() => _DietPageState();
// // }
// //
// // class _DietPageState extends State<DietPage> {
// //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// //   Map<String, double> consumptionData = {};
// //   String? selectedTitle;
// //   double emissionFactor = 0.5; // Example emission factor (in kg CO2/kg food)
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
// //                 _buildGridItem('assets/img/non-veg.png', 'Non-Veg'),
// //                 _buildGridItem('assets/img/vegitarian.png', 'Vegetarian'),
// //                 _buildGridItem('assets/img/vegan.png', 'Vegan'),
// //                 _buildGridItem('assets/img/processed.png', 'Processed'),
// //                 _buildGridItem('assets/img/organic.png', 'Organic'),
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
// //             consumptionData[title] = 0.3; // Update with actual values
// //           });
// //           Navigator.pop(context);
// //         },
// //         title: Text("Low"),
// //         subtitle: Text("0.1-0.5kg"),
// //         tileColor: consumptionData[title] == 0.3 ? Colors.blueAccent : null,
// //       ),
// //       ListTile(
// //         onTap: () {
// //           setState(() {
// //             consumptionData[title] = 8; // Update with actual values
// //           });
// //           Navigator.pop(context);
// //         },
// //         title: Text("Medium"),
// //         subtitle: Text("6-10kg"),
// //         tileColor: consumptionData[title] == 8 ? Colors.blueAccent : null,
// //       ),
// //       ListTile(
// //         onTap: () {
// //           setState(() {
// //             consumptionData[title] = 22.5; // Update with actual values
// //           });
// //           Navigator.pop(context);
// //         },
// //         title: Text("High"),
// //         subtitle: Text("15-30kg"),
// //         tileColor: consumptionData[title] == 22.5 ? Colors.blueAccent : null,
// //       ),
// //     ];
// //   }
// //
// //   double _calculateTotalEmission() {
// //     double totalEmission = 0;
// //     consumptionData.forEach((device, consumption) {
// //       totalEmission += consumption * emissionFactor;
// //     });
// //     print(totalEmission);
// //     return totalEmission;
// //   }
// // }
// //
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
//
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// //
// // class DietPage extends StatefulWidget {
// //   const DietPage({Key? key}) : super(key: key);
// //
// //   @override
// //   State<DietPage> createState() => _DietPageState();
// // }
// //
// // class _DietPageState extends State<DietPage> {
// //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// //   Map<String, double> consumptionData = {};
// //   String? selectedTitle;
// //   double emissionFactor = 0.5; // Example emission factor (in kg CO2/kg food)
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
// //         title: Text("Diet Emission Calculator", style: TextStyle(color: Colors.black)),
// //         actions: [
// //           IconButton(
// //             icon: Icon(Icons.history, color: Colors.black),
// //             onPressed: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(builder: (context) => EmissionHistoryPage(uid: uid)),
// //               );
// //             },
// //           ),
// //         ],
// //       ),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: GridView(
// //               padding: EdgeInsets.all(20),
// //               children: [
// //                 _buildGridItem('assets/img/non-veg.png', 'Non-Veg'),
// //                 _buildGridItem('assets/img/vegitarian.png', 'Vegetarian'),
// //                 _buildGridItem('assets/img/vegan.png', 'Vegan'),
// //                 _buildGridItem('assets/img/processed.png', 'Processed'),
// //                 _buildGridItem('assets/img/organic.png', 'Organic'),
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
// //             consumptionData[title] = 0.3; // Update with actual values
// //           });
// //           Navigator.pop(context);
// //         },
// //         title: Text("Low"),
// //         subtitle: Text("0.1-0.5kg"),
// //         tileColor: consumptionData[title] == 0.3 ? Colors.blueAccent : null,
// //       ),
// //       ListTile(
// //         onTap: () {
// //           setState(() {
// //             consumptionData[title] = 8; // Update with actual values
// //           });
// //           Navigator.pop(context);
// //         },
// //         title: Text("Medium"),
// //         subtitle: Text("6-10kg"),
// //         tileColor: consumptionData[title] == 8 ? Colors.blueAccent : null,
// //       ),
// //       ListTile(
// //         onTap: () {
// //           setState(() {
// //             consumptionData[title] = 22.5; // Update with actual values
// //           });
// //           Navigator.pop(context);
// //         },
// //         title: Text("High"),
// //         subtitle: Text("15-30kg"),
// //         tileColor: consumptionData[title] == 22.5 ? Colors.blueAccent : null,
// //       ),
// //     ];
// //   }
// //
// //   void _calculateTotalEmission() async {
// //     double totalEmission = 0;
// //     consumptionData.forEach((title, consumption) {
// //       totalEmission += consumption * emissionFactor;
// //     });
// //
// //     // Save to Firestore
// //     await _saveEmissionToFirestore(totalEmission);
// //
// //     print(totalEmission);
// //   }
// //
// //   Future<void> _saveEmissionToFirestore(double totalEmission) async {
// //     String userId = FirebaseAuth.instance.currentUser!.uid;
// //     DateTime now = DateTime.now();
// //     String formattedDate = "${now.year}-${now.month}-${now.day}";
// //
// //     DocumentReference docRef = _firestore.collection('diet_emissions').doc(userId);
// //
// //     await _firestore.runTransaction((transaction) async {
// //       DocumentSnapshot docSnapshot = await transaction.get(docRef);
// //
// //       if (!docSnapshot.exists) {
// //         transaction.set(docRef, {
// //           'history': [
// //             {
// //               'date': formattedDate,
// //               'emission': totalEmission,
// //             }
// //           ]
// //         });
// //       } else {
// //         transaction.update(docRef, {
// //           'history': FieldValue.arrayUnion([
// //             {
// //               'date': formattedDate,
// //               'emission': totalEmission,
// //             }
// //           ])
// //         });
// //       }
// //     });
// //
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(content: Text('Emission data saved successfully')),
// //     );
// //   }
// // }
// //
// // class EmissionHistoryPage extends StatelessWidget {
// //   final String uid;
// //   const EmissionHistoryPage({Key? key, required this.uid}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Emission History'),
// //       ),
// //       body: StreamBuilder<DocumentSnapshot>(
// //         stream: FirebaseFirestore.instance.collection('diet_emissions').doc(uid).snapshots(),
// //         builder: (context, snapshot) {
// //           if (!snapshot.hasData) {
// //             return Center(child: CircularProgressIndicator());
// //           }
// //
// //           var history = snapshot.data!['history'] as List<dynamic>;
// //
// //           return ListView.builder(
// //             itemCount: history.length,
// //             itemBuilder: (context, index) {
// //               var entry = history[index];
// //               return ListTile(
// //                 title: Text("Date: ${entry['date']}"),
// //                 subtitle: Text("Emission: ${entry['emission']} kg CO2"),
// //               );
// //             },
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class DietPage extends StatefulWidget {
//   const DietPage({Key? key}) : super(key: key);
//
//   @override
//   State<DietPage> createState() => _DietPageState();
// }
//
// class _DietPageState extends State<DietPage> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   Map<String, double> consumptionData = {};
//   String? selectedTitle;
//   double emissionFactor = 0.5; // Example emission factor (in kg CO2/kg food)
//   var uid;
//
//   @override
//   void initState() {
//     getData();
//     super.initState();
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
//                 _buildGridItem('assets/img/non-veg.png', 'Non-Veg'),
//                 _buildGridItem('assets/img/vegitarian.png', 'Vegetarian'),
//                 _buildGridItem('assets/img/vegan.png', 'Vegan'),
//                 _buildGridItem('assets/img/processed.png', 'Processed'),
//                 _buildGridItem('assets/img/organic.png', 'Organic'),
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
//             consumptionData[title] = 0.3; // Update with actual values
//           });
//           Navigator.pop(context);
//         },
//         title: Text("Low"),
//         subtitle: Text("0.1-0.5kg"),
//         tileColor: consumptionData[title] == 0.3 ? Colors.blueAccent : null,
//       ),
//       ListTile(
//         onTap: () {
//           setState(() {
//             consumptionData[title] = 8; // Update with actual values
//           });
//           Navigator.pop(context);
//         },
//         title: Text("Medium"),
//         subtitle: Text("6-10kg"),
//         tileColor: consumptionData[title] == 8 ? Colors.blueAccent : null,
//       ),
//       ListTile(
//         onTap: () {
//           setState(() {
//             consumptionData[title] = 22.5; // Update with actual values
//           });
//           Navigator.pop(context);
//         },
//         title: Text("High"),
//         subtitle: Text("15-30kg"),
//         tileColor: consumptionData[title] == 22.5 ? Colors.blueAccent : null,
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
//     print(totalEmission);
//   }
//
//   Future<void> _saveEmissionToFirestore(double totalEmission) async {
//     String userId = FirebaseAuth.instance.currentUser!.uid;
//     DateTime now = DateTime.now();
//     String formattedDate = "${now.year}-${now.month}-${now.day}";
//
//     DocumentReference docRef = _firestore.collection('diet_emissions').doc(userId);
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
//         stream: FirebaseFirestore.instance.collection('diet_emissions').doc(uid).snapshots(),
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DietPage extends StatefulWidget {
  const DietPage({Key? key}) : super(key: key);

  @override
  State<DietPage> createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, double> consumptionData = {};
  String? selectedTitle;
  double emissionFactor = 0.5; // Example emission factor (in kg CO2/kg food)
  var uid;

  @override
  void initState() {
    getData();
    super.initState();
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
                MaterialPageRoute(builder: (context) => DietEmissionHistoryPage(uid: uid)),
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
                _buildGridItem('assets/img/non-veg.png', 'Non-Veg'),
                _buildGridItem('assets/img/vegitarian.png', 'Vegetarian'),
                _buildGridItem('assets/img/vegan.png', 'Vegan'),
                _buildGridItem('assets/img/processed.png', 'Processed'),
                _buildGridItem('assets/img/organic.png', 'Organic'),
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
            consumptionData[title] = 0.3; // Update with actual values
          });
          Navigator.pop(context);
        },
        title: Text("Low"),
        subtitle: Text("0.1-0.5kg"),
        tileColor: consumptionData[title] == 0.3 ? Colors.blueAccent : null,
      ),
      ListTile(
        onTap: () {
          setState(() {
            consumptionData[title] = 8; // Update with actual values
          });
          Navigator.pop(context);
        },
        title: Text("Medium"),
        subtitle: Text("6-10kg"),
        tileColor: consumptionData[title] == 8 ? Colors.blueAccent : null,
      ),
      ListTile(
        onTap: () {
          setState(() {
            consumptionData[title] = 22.5; // Update with actual values
          });
          Navigator.pop(context);
        },
        title: Text("High"),
        subtitle: Text("15-30kg"),
        tileColor: consumptionData[title] == 22.5 ? Colors.blueAccent : null,
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
        .collection('diet_emissions')
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

class DietEmissionHistoryPage extends StatelessWidget {
  final String uid;
  const DietEmissionHistoryPage({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diet Emission History', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('diet_emissions')
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
              var doc = documents[index];
              var data = doc.data() as Map<String, dynamic>;
              var date = (data['date'] as Timestamp).toDate();
              var formattedDate = DateFormat('yyyy-MM-dd').format(date);
              var formattedTime = DateFormat('hh:mm a').format(date);

              return Dismissible(
                key: Key(doc.id),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (direction) {
                  _deleteEmission(doc.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Emission entry deleted"),
                      action: SnackBarAction(
                        label: "Undo",
                        onPressed: () {
                          _undoDelete(doc.id, data);
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

  void _deleteEmission(String docId) {
    FirebaseFirestore.instance
        .collection('diet_emissions')
        .doc(uid)
        .collection('daily_emissions')
        .doc(docId)
        .delete();
  }

  void _undoDelete(String docId, Map<String, dynamic> data) {
    FirebaseFirestore.instance
        .collection('diet_emissions')
        .doc(uid)
        .collection('daily_emissions')
        .doc(docId)
        .set(data);
  }

  Future<void> storeTotalEmission(double totalEmission) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('total_emission_diet', totalEmission);
  }

  getTotalEmission() async {
    final prefs = await SharedPreferences.getInstance();

    final val=await prefs.getDouble('total_emission_diet');
    print(val);
    return val;

  }
}
