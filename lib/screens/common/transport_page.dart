// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// //
// // class TransportPage extends StatefulWidget {
// //   const TransportPage({Key? key}) : super(key: key);
// //
// //   @override
// //   State<TransportPage> createState() => _TransportPageState();
// // }
// //
// // class _TransportPageState extends State<TransportPage> {
// //   List<Map<String, dynamic>> selectedTransports = [];
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
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Selected Transports'),
// //       ),
// //       body: Column(
// //         crossAxisAlignment: CrossAxisAlignment.stretch,
// //         children: [
// //           Expanded(
// //             child: GridView(
// //               padding: EdgeInsets.all(20),
// //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                 crossAxisCount: 2,
// //                 mainAxisSpacing: 10,
// //                 crossAxisSpacing: 10,
// //               ),
// //               children: [
// //                 _buildGridItem('assets/img/sedan.png', 'Car'),
// //                 _buildGridItem('assets/img/cars.png', 'Carpool'),
// //                 _buildGridItem('assets/img/bike.png', 'Bike'),
// //                 _buildGridItem('assets/img/buses.png', 'Bus'),
// //                 _buildGridItem('assets/img/train.png', 'Train'),
// //                 _buildGridItem('assets/img/plane.png', 'Plane'),
// //                 _buildGridItem('assets/img/bicycle.png', 'Bicycle'),
// //                 _buildGridItem('assets/img/walk.png', 'Walk'),
// //               ],
// //             ),
// //           ),
// //           ElevatedButton(
// //             onPressed: () {
// //               final totalEmissions = _calculateTotalEmissions();
// //               _submitEmissionsToFirebase(totalEmissions);
// //             },
// //             child: Text('Submit Emissions',),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildGridItem(String imagePath, String title) {
// //     String selectedFuelType = 'Gasoline'; // Default fuel type
// //     int passengerCount = 1; // Default passenger count
// //     String? railType; // Default rail type is null
// //     int distance = 0; // Default distance
// //     int time = 0; // Default time
// //
// //     return GestureDetector(
// //       onTap: () {
// //         showModalBottomSheet(
// //           context: context,
// //           isScrollControlled: true,
// //           builder: (BuildContext context) {
// //             return StatefulBuilder(
// //               builder: (BuildContext context, StateSetter setState) {
// //                 return SingleChildScrollView(
// //                   child: Container(
// //                     width: MediaQuery.of(context).size.width,
// //                     padding: EdgeInsets.only(
// //                       bottom: MediaQuery.of(context).viewInsets.bottom,
// //                     ),
// //                     child: Padding(
// //                       padding: EdgeInsets.all(20),
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Text(
// //                             "How much did you travel?",
// //                             style: TextStyle(
// //                               fontSize: 24,
// //                               fontWeight: FontWeight.bold,
// //                             ),
// //                           ),
// //                           // SizedBox(height: 20),
// //                           // Text(
// //                           //   "Date and Time",
// //                           //   style: TextStyle(
// //                           //     fontSize: 18,
// //                           //     fontWeight: FontWeight.bold,
// //                           //   ),
// //                           // ),
// //                           // ListTile(
// //                           //   leading: Icon(Icons.calendar_today),
// //                           //   title: Text("Date Traveled: Today"),
// //                           // ),
// //                           // ListTile(
// //                           //   leading: Icon(Icons.access_time),
// //                           //   title: Text("Time Traveled: 12:00 PM"),
// //                           // ),
// //                           SizedBox(height: 20),
// //                           Text(
// //                             "Fuel Type",
// //                             style: TextStyle(
// //                               fontSize: 18,
// //                               fontWeight: FontWeight.bold,
// //                             ),
// //                           ),
// //                           DropdownButton<String>(
// //                             value: selectedFuelType,
// //                             onChanged: (String? newValue) {
// //                               setState(() {
// //                                 selectedFuelType = newValue!;
// //                               });
// //                             },
// //                             items: <String>['Gasoline', 'Diesel', 'Electric', 'Aviation Fuel']
// //                                 .map<DropdownMenuItem<String>>((String value) {
// //                               return DropdownMenuItem<String>(
// //                                 value: value,
// //                                 child: Text(value),
// //                               );
// //                             }).toList(),
// //                           ),
// //                           SizedBox(height: 20),
// //                           Text(
// //                             "Distance Traveled (miles)",
// //                             style: TextStyle(
// //                               fontSize: 18,
// //                               fontWeight: FontWeight.bold,
// //                             ),
// //                           ),
// //                           TextFormField(
// //                             keyboardType: TextInputType.number,
// //                             onChanged: (value) {
// //                               distance = int.tryParse(value) ?? 0;
// //                             },
// //                           ),
// //                           SizedBox(height: 20),
// //                           Text(
// //                             "Time Traveled (hours)",
// //                             style: TextStyle(
// //                               fontSize: 18,
// //                               fontWeight: FontWeight.bold,
// //                             ),
// //                           ),
// //                           TextFormField(
// //                             keyboardType: TextInputType.number,
// //                             onChanged: (value) {
// //                               time = int.tryParse(value) ?? 0;
// //                             },
// //                           ),
// //                           if (title == 'Train') ...[
// //                             SizedBox(height: 20),
// //                             Text(
// //                               "Rail Type",
// //                               style: TextStyle(
// //                                 fontSize: 18,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                             TextFormField(
// //                               onChanged: (value) {
// //                                 railType = value;
// //                               },
// //                             ),
// //                           ],
// //                           SizedBox(height: 20),
// //
// //
// //
// //
// //                           if (title != 'Train' && title != 'Plane') ...[
// //                             Text(
// //                               "Number of Passengers",
// //                               style: TextStyle(
// //                                 fontSize: 18,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                             Row(
// //                               mainAxisAlignment: MainAxisAlignment.center,
// //                               children: [
// //                                 IconButton(
// //                                   onPressed: () {
// //                                     setState(() {
// //                                       if (passengerCount > 1) {
// //                                         passengerCount--;
// //                                       }
// //                                     });
// //                                   },
// //                                   icon: Icon(Icons.remove),
// //                                 ),
// //                                 Text(
// //                                   '$passengerCount',
// //                                   style: TextStyle(
// //                                     fontSize: 20,
// //                                   ),
// //                                 ),
// //                                 IconButton(
// //                                   onPressed: () {
// //                                     setState(() {
// //                                       passengerCount++;
// //                                     });
// //                                   },
// //                                   icon: Icon(Icons.add),
// //                                 ),
// //                               ],
// //                             ),
// //                           ],
// //
// //                           SizedBox(height: 20),
// //                           ElevatedButton(
// //                             onPressed: () {
// //                               Navigator.pop(context);
// //                               // Pass selectedFuelType, distance, time, and passengerCount
// //                               _addSelectedTransport(title, selectedFuelType, distance, time,
// //                                   passengerCount: passengerCount, railType: railType);
// //                             },
// //                             child: Text('Select',
// //                             style: TextStyle(color: Colors.black),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 );
// //               },
// //             );
// //           },
// //         );
// //       },
// //       child: Container(
// //         color: Colors.white,
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
// //   void _addSelectedTransport(String title, String? fuelType, int distance, int time,
// //       {int? passengerCount, String? railType}) {
// //     final Map<String, dynamic> transport = {
// //       'type': title,
// //       'fuelType': fuelType,
// //       'distance': distance,
// //       'time': time,
// //     };
// //
// //     // Add passenger count if it's not null and title is not 'Plane' or 'Train'
// //     if (passengerCount != null && title != 'Plane' && title != 'Train') {
// //       transport['passengerCount'] = passengerCount;
// //     }
// //
// //     // Add rail type if it's not null and title is 'Train'
// //     if (railType != null && title == 'Train') {
// //       transport['railType'] = railType;
// //     }
// //
// //     selectedTransports.add(transport);
// //
// //     // Update the UI to reflect the selected transports
// //     setState(() {});
// //     print(selectedTransports);
// //   }
// //
// //   double _calculateCarbonEmission(Map<String, dynamic> transport) {
// //     double emission = 0.0;
// //
// //     // Define emission factors for different vehicle types and fuel types
// //     Map<String, Map<String, double>> emissionFactors = {
// //       'Car': {'Gasoline': 8.89, 'Diesel': 10.14},
// //       'Bus': {'Diesel': 10.14},
// //       'Train': {'Electric': 0.4}, // Assuming electric trains
// //       'Plane': {'Aviation Fuel': 9.57}, // Placeholder value
// //       'Carpool': {'Gasoline': 8.89, 'Diesel': 10.14},
// //     };
// //
// //     // Get the emission factor based on vehicle type and fuel type
// //     var factor = emissionFactors[transport['type']]?[transport['fuelType']];  // need to check this
// //
// //     // Check if factor is null before proceeding
// //     if (factor != null) {
// //       // Calculate emissions based on the specific formula
// //       // Example: Emission = Distance * Factor + Time * Factor + PassengerCount * Factor
// //       emission = transport['distance'] * factor +
// //           transport['time'] * factor +
// //           (transport['passengerCount'] ?? 1) * factor; // Assuming 1 passenger if not provided
// //     } else {
// //       print('Emission factor not found for ${transport['type']} and ${transport['fuelType']}');
// //     }
// //
// //     print(emission);
// //     return emission;
// //   }
// //
// //
// //
// //   double _calculateTotalEmissions() {
// //     double totalEmissions = 0.0;
// //     for (var transport in selectedTransports) {
// //       totalEmissions += _calculateCarbonEmission(transport);
// //     }
// //     print(selectedTransports);
// //     print(totalEmissions);
// //     return totalEmissions;
// //   }
// //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// //
// //   void _submitEmissionsToFirebase(double totalEmissions) {
// //     print(totalEmissions);
// //     _firestore.collection('emission').doc(uid).update({
// //
// //       'total_transport_consumption': totalEmissions,
// //       //'uid': uid,
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
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class TransportPage extends StatefulWidget {
//   const TransportPage({Key? key}) : super(key: key);
//
//   @override
//   State<TransportPage> createState() => _TransportPageState();
// }
//
// class _TransportPageState extends State<TransportPage> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   List<Map<String, dynamic>> selectedTransports = [];
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
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Expanded(
//             child: GridView(
//               padding: EdgeInsets.all(20),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 10,
//               ),
//               children: [
//                 _buildGridItem('assets/img/sedan.png', 'Car'),
//                 _buildGridItem('assets/img/cars.png', 'Carpool'),
//                 _buildGridItem('assets/img/bike.png', 'Bike'),
//                 _buildGridItem('assets/img/buses.png', 'Bus'),
//                 _buildGridItem('assets/img/train.png', 'Train'),
//                 _buildGridItem('assets/img/plane.png', 'Plane'),
//                 _buildGridItem('assets/img/bicycle.png', 'Bicycle'),
//                 _buildGridItem('assets/img/walk.png', 'Walk'),
//               ],
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               final totalEmissions = _calculateTotalEmissions();
//               _submitEmissionsToFirebase(totalEmissions);
//             },
//             style: ElevatedButton.styleFrom(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               backgroundColor: Colors.green,
//             ),
//             child: Text('Calculate Total Emission'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildGridItem(String imagePath, String title) {
//     String selectedFuelType = 'Gasoline'; // Default fuel type
//     int passengerCount = 1; // Default passenger count
//     String? railType; // Default rail type is null
//     int distance = 0; // Default distance
//     int time = 0; // Default time
//
//     return GestureDetector(
//       onTap: () {
//         showModalBottomSheet(
//           context: context,
//           isScrollControlled: true,
//           builder: (BuildContext context) {
//             return StatefulBuilder(
//               builder: (BuildContext context, StateSetter setState) {
//                 return SingleChildScrollView(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     padding: EdgeInsets.only(
//                       bottom: MediaQuery.of(context).viewInsets.bottom,
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.all(20),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "How much did you travel?",
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 20),
//                           Text(
//                             "Fuel Type",
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           DropdownButton<String>(
//                             value: selectedFuelType,
//                             onChanged: (String? newValue) {
//                               setState(() {
//                                 selectedFuelType = newValue!;
//                               });
//                             },
//                             items: <String>['Gasoline', 'Diesel', 'Electric', 'Aviation Fuel']
//                                 .map<DropdownMenuItem<String>>((String value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: Text(value),
//                               );
//                             }).toList(),
//                           ),
//                           SizedBox(height: 20),
//                           Text(
//                             "Distance Traveled (miles)",
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           TextFormField(
//                             keyboardType: TextInputType.number,
//                             onChanged: (value) {
//                               distance = int.tryParse(value) ?? 0;
//                             },
//                           ),
//                           SizedBox(height: 20),
//                           Text(
//                             "Time Traveled (hours)",
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           TextFormField(
//                             keyboardType: TextInputType.number,
//                             onChanged: (value) {
//                               time = int.tryParse(value) ?? 0;
//                             },
//                           ),
//                           if (title == 'Train') ...[
//                             SizedBox(height: 20),
//                             Text(
//                               "Rail Type",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             TextFormField(
//                               onChanged: (value) {
//                                 railType = value;
//                               },
//                             ),
//                           ],
//                           SizedBox(height: 20),
//                           if (title != 'Train' && title != 'Plane') ...[
//                             Text(
//                               "Number of Passengers",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 IconButton(
//                                   onPressed: () {
//                                     setState(() {
//                                       if (passengerCount > 1) {
//                                         passengerCount--;
//                                       }
//                                     });
//                                   },
//                                   icon: Icon(Icons.remove),
//                                 ),
//                                 Text(
//                                   '$passengerCount',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                   ),
//                                 ),
//                                 IconButton(
//                                   onPressed: () {
//                                     setState(() {
//                                       passengerCount++;
//                                     });
//                                   },
//                                   icon: Icon(Icons.add),
//                                 ),
//                               ],
//                             ),
//                           ],
//                           SizedBox(height: 20),
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                               _addSelectedTransport(title, selectedFuelType, distance, time,
//                                   passengerCount: passengerCount, railType: railType);
//                             },
//                             style: ButtonStyle(
//                                 backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
//                                 shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(50),
//                                 ))
//                             ),
//                             child: Text(
//                               '  Select  ',
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           },
//         );
//       },
//       child: Container(
//         color: Colors.white,
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
//   void _addSelectedTransport(String title, String? fuelType, int distance, int time,
//       {int? passengerCount, String? railType}) {
//     final Map<String, dynamic> transport = {
//       'type': title,
//       'fuelType': fuelType,
//       'distance': distance,
//       'time': time,
//     };
//
//     if (passengerCount != null && title != 'Plane' && title != 'Train') {
//       transport['passengerCount'] = passengerCount;
//     }
//
//     if (railType != null && title == 'Train') {
//       transport['railType'] = railType;
//     }
//
//     selectedTransports.add(transport);
//     setState(() {});
//   }
//
//   double _calculateCarbonEmission(Map<String, dynamic> transport) {
//     double emission = 0.8; //0.0
//     Map<String, Map<String, double>> emissionFactors = {
//       'Car': {'Gasoline': 8.89, 'Diesel': 10.14},
//       'Bus': {'Diesel': 10.14},
//       'Train': {'Electric': 0.4},
//       'Plane': {'Aviation Fuel': 9.57},
//       'Carpool': {'Gasoline': 8.89, 'Diesel': 10.14},
//     };
//
//     var factor = emissionFactors[transport['type']]?[transport['fuelType']];
//
//     if (factor != null) {
//       emission = transport['distance'] * factor +
//           transport['time'] * factor +
//           (transport['passengerCount'] ?? 1) * factor;
//     } else {
//       print('Emission factor not found for ${transport['type']} and ${transport['fuelType']}');
//     }
//
//     return emission;
//   }
//
//   double _calculateTotalEmissions() {
//     double totalEmissions = 0.0;
//     for (var transport in selectedTransports) {
//       totalEmissions += _calculateCarbonEmission(transport);
//     }
//     return totalEmissions;
//   }
//
//   void _submitEmissionsToFirebase(double totalEmissions) async {
//     String userId = FirebaseAuth.instance.currentUser!.uid;
//     DateTime now = DateTime.now();
//     String formattedDate = "${now.year}-${now.month}-${now.day}";
//
//     DocumentReference docRef = _firestore.collection('transport_emissions').doc(userId);
//
//     await _firestore.runTransaction((transaction) async {
//       DocumentSnapshot docSnapshot = await transaction.get(docRef);
//
//       if (!docSnapshot.exists) {
//         transaction.set(docRef, {
//           'history': [
//             {
//               'date': formattedDate,
//               'emission': totalEmissions,
//             }
//           ]
//         });
//       } else {
//         transaction.update(docRef, {
//           'history': FieldValue.arrayUnion([
//             {
//               'date': formattedDate,
//               'emission': totalEmissions,
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
//         title: Text('Emission History'),
//       ),
//       body: StreamBuilder<DocumentSnapshot>(
//         stream: FirebaseFirestore.instance.collection('transport_emissions').doc(uid).snapshots(),
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

class TransportPage extends StatefulWidget {
  const TransportPage({Key? key}) : super(key: key);

  @override
  State<TransportPage> createState() => _TransportPageState();
}

class _TransportPageState extends State<TransportPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> selectedTransports = [];
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
                MaterialPageRoute(builder: (context) => TransportEmissionHistoryPage(uid: uid)),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GridView(
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              children: [
                _buildGridItem('assets/img/sedan.png', 'Car'),
                _buildGridItem('assets/img/cars.png', 'Carpool'),
                _buildGridItem('assets/img/bike.png', 'Bike'),
                _buildGridItem('assets/img/buses.png', 'Bus'),
                _buildGridItem('assets/img/train.png', 'Train'),
                _buildGridItem('assets/img/plane.png', 'Plane'),
                _buildGridItem('assets/img/bicycle.png', 'Bicycle'),
                _buildGridItem('assets/img/walk.png', 'Walk'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final totalEmissions = _calculateTotalEmissions();
              _submitEmissionsToFirebase(totalEmissions);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.green,
            ),
            child: Text('Calculate Total Emission'),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(String imagePath, String title) {
    String selectedFuelType = 'Gasoline'; // Default fuel type
    int passengerCount = 1; // Default passenger count
    String? railType; // Default rail type is null
    int distance = 0; // Default distance
    int time = 0; // Default time

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
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
                        children: [
                          Text(
                            "How much did you travel?",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Fuel Type",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          DropdownButton<String>(
                            value: selectedFuelType,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedFuelType = newValue!;
                              });
                            },
                            items: <String>['Gasoline', 'Diesel', 'Electric', 'Aviation Fuel']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Distance Traveled (miles)",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              distance = int.tryParse(value) ?? 0;
                            },
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Time Traveled (hours)",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              time = int.tryParse(value) ?? 0;
                            },
                          ),
                          if (title == 'Train') ...[
                            SizedBox(height: 20),
                            Text(
                              "Rail Type",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextFormField(
                              onChanged: (value) {
                                railType = value;
                              },
                            ),
                          ],
                          SizedBox(height: 20),
                          if (title != 'Train' && title != 'Plane') ...[
                            Text(
                              "Number of Passengers",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (passengerCount > 1) {
                                        passengerCount--;
                                      }
                                    });
                                  },
                                  icon: Icon(Icons.remove),
                                ),
                                Text(
                                  '$passengerCount',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      passengerCount++;
                                    });
                                  },
                                  icon: Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                          SizedBox(height: 20),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _addSelectedTransport(title, selectedFuelType, distance, time,
                                  passengerCount: passengerCount, railType: railType);
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ))
                            ),
                            child: Text(
                              '  Select  ',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
      child: Container(
        color: Colors.white,
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

  void _addSelectedTransport(String title, String? fuelType, int distance, int time,
      {int? passengerCount, String? railType}) {
    final Map<String, dynamic> transport = {
      'type': title,
      'fuelType': fuelType,
      'distance': distance,
      'time': time,
    };

    if (passengerCount != null && title != 'Plane' && title != 'Train') {
      transport['passengerCount'] = passengerCount;
    }

    if (railType != null && title == 'Train') {
      transport['railType'] = railType;
    }

    selectedTransports.add(transport);
    setState(() {});
  }

  double _calculateCarbonEmission(Map<String, dynamic> transport) {
    double emission = 0.8; // Default emission value
    Map<String, Map<String, double>> emissionFactors = {
      'Car': {'Gasoline': 8.89, 'Diesel': 10.14},
      'Bus': {'Diesel': 10.14},
      'Train': {'Electric': 0.4},
      'Plane': {'Aviation Fuel': 9.57},
      'Carpool': {'Gasoline': 8.89, 'Diesel': 10.14},
    };

    var factor = emissionFactors[transport['type']]?[transport['fuelType']];

    if (factor != null) {
      emission = transport['distance'] * factor +
          transport['time'] * factor +
          (transport['passengerCount'] ?? 1) * factor;
    } else {
      print('Emission factor not found for ${transport['type']} and ${transport['fuelType']}');
    }

    return emission;
  }

  double _calculateTotalEmissions() {
    double totalEmissions = 0.0;
    for (var transport in selectedTransports) {
      totalEmissions += _calculateCarbonEmission(transport);
    }
    return totalEmissions;
  }

  void _submitEmissionsToFirebase(double totalEmissions) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    DateTime now = DateTime.now();

    await FirebaseFirestore.instance
        .collection('transport_emissions')
        .doc(userId)
        .collection('daily_emissions')
        .doc(now.toIso8601String())
        .set({
      'transports': selectedTransports,
      'total_emission': totalEmissions,
      'date': now,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Emission data saved successfully')),
    );
  }
}

class TransportEmissionHistoryPage extends StatelessWidget {
  final String uid;
  const TransportEmissionHistoryPage({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transport Emission History', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('transport_emissions')
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
        .collection('transport_emissions')
        .doc(uid)
        .collection('daily_emissions')
        .doc(docId)
        .delete();
  }

  void _undoDelete(String docId, Map<String, dynamic> data) {
    FirebaseFirestore.instance
        .collection('transport_emissions')
        .doc(uid)
        .collection('daily_emissions')
        .doc(docId)
        .set(data);
  }
  Future<void> storeTotalEmission(double totalEmission) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('total_emission_transport', totalEmission);
  }

  getTotalEmission() async {
    final prefs = await SharedPreferences.getInstance();

    final val=await prefs.getDouble('total_emission_transport');
    print(val);
    return val;

  }
}
