// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// //
// // class EnergyPage extends StatefulWidget {
// //   const EnergyPage({Key? key}) : super(key: key);
// //
// //   @override
// //   State<EnergyPage> createState() => _EnergyPageState();
// // }
// //
// // class _EnergyPageState extends State<EnergyPage> {
// //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// //   Map<String, int> consumptionData = {};
// //   String? selectedTitle;
// //   double emissionFactor = 0.5; // Example emission factor (in kg CO2/kWh)
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
// //     uid = await FirebaseAuth.instance.currentUser!.uid;
// //
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
// //         crossAxisAlignment: CrossAxisAlignment.stretch,
// //         children: [
// //           if (selectedTitle != null) _buildSelectedWidget(selectedTitle!, consumptionData),
// //           Expanded(
// //             child: Container(
// //               child: GridView(
// //                 padding: EdgeInsets.all(20),
// //                 children: [
// //                   _buildGridItem('assets/img/lamp.png', 'Light'),
// //                   _buildGridItem('assets/img/fan.png', 'Fan'),
// //                   _buildGridItem('assets/img/smart.png', 'TV'),
// //                   _buildGridItem('assets/img/computer.png', 'Computer'),
// //                   _buildGridItem('assets/img/blender.png', 'Blender'),
// //                   _buildGridItem('assets/img/washing-machine.png', 'Washing Machine'),
// //                   _buildGridItem('assets/img/air-conditioner.png', 'AC'),
// //                   _buildGridItem('assets/img/iron.png', 'Box'),
// //                   _buildGridItem('assets/img/refrigerator.png', 'Fridge'),
// //                   _buildGridItem('assets/img/solarpanel.png', 'Solar Panel'),
// //                 ],
// //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                   crossAxisCount: 2,
// //                   mainAxisSpacing: 10,
// //                   crossAxisSpacing: 10,
// //                 ),
// //               ),
// //             ),
// //           ),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               ElevatedButton(
// //                 onPressed: () {
// //                   double totalEmission = _calculateTotalEmission();
// //                   print('Total Home Emission: $totalEmission kg CO2');
// //
// //                   FirebaseFirestore.instance.collection('emission').doc(uid).set({
// //                     'home_consumption': consumptionData,
// //                     'total_home_consumption': totalEmission,
// //                     'uid': uid,
// //                   });
// //                 },
// //                 style: ElevatedButton.styleFrom(
// //
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(10),
// //                   ),
// //                   backgroundColor: Colors.green
// //                 ),
// //                 child: Text('Calculate Total Emission',style: TextStyle(color: Colors.white),),
// //               ),
// //               SizedBox(width: 10),
// //               ElevatedButton(
// //                 onPressed: () {
// //                   setState(() {
// //                     consumptionData.clear();
// //                     selectedTitle = null;
// //                   });
// //                 },
// //                 style: ElevatedButton.styleFrom(
// //
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(10),
// //                     ),
// //                     backgroundColor: Colors.lightBlue[700],
// //                 ),
// //                 child: Text('Reset Selection',style: TextStyle(color: Colors.white),),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildSelectedWidget(String title, Map<String, int> consumptionData) {
// //     return Padding(
// //       padding: EdgeInsets.all(20),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(
// //             'Selected Item: $title',
// //             style: TextStyle(
// //               fontSize: 20,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //           SizedBox(height: 10),
// //           Text(
// //             'Consumption Data:',
// //             style: TextStyle(
// //               fontSize: 16,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //           SizedBox(height: 5),
// //           Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: consumptionData.entries.map((entry) {
// //               return Text('${entry.key}: ${entry.value}');
// //             }).toList(),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildGridItem(String imagePath, String title) {
// //     bool isAlreadySelected = consumptionData.containsKey(title);
// //     return GestureDetector(
// //       onTap: isAlreadySelected
// //           ? null
// //           : () {
// //         setState(() {
// //           selectedTitle = title;
// //         });
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
// //                     children: [
// //                       Text(
// //                         "Choose your consumption",
// //                         style: TextStyle(
// //                           fontSize: 24,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                       SizedBox(height: 20),
// //                       ListTile(
// //                         onTap: () {
// //                           setState(() {
// //                             consumptionData[title] = 400;
// //                           });
// //                           Navigator.pop(context);
// //                         },
// //                         title: Text("Low"),
// //                         subtitle: Text("200-600 kwh"),
// //                         tileColor: consumptionData[title] == 400 ? Colors.blueAccent : null,
// //                       ),
// //                       ListTile(
// //                         onTap: () {
// //                           setState(() {
// //                             consumptionData[title] = 800;
// //                           });
// //                           Navigator.pop(context);
// //                         },
// //                         title: Text("Medium"),
// //                         subtitle: Text("600-1000 kwh"),
// //                         tileColor: consumptionData[title] == 800 ? Colors.grey.withOpacity(0.3) : null,
// //                       ),
// //                       ListTile(
// //                         onTap: () {
// //                           setState(() {
// //                             consumptionData[title] = 1200;
// //                           });
// //                           Navigator.pop(context);
// //                         },
// //                         title: Text("High"),
// //                         subtitle: Text("Exceeds 1000kwh"),
// //                         tileColor: consumptionData[title] == 1200 ? Colors.grey.withOpacity(0.3) : null,
// //                       ),
// //                     ],
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
// //   double _calculateTotalEmission() {
// //     double totalEmission = 0;
// //     consumptionData.forEach((device, consumption) {
// //       totalEmission += consumption * emissionFactor;
// //     });
// //     print(totalEmission);
// //     return totalEmission;
// //   }
// // }
//
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class EnergyPage extends StatefulWidget {
//   const EnergyPage({Key? key}) : super(key: key);
//
//   @override
//   State<EnergyPage> createState() => _EnergyPageState();
// }
//
// class _EnergyPageState extends State<EnergyPage> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   Map<String, int> consumptionData = {};
//   String? selectedTitle;
//   double emissionFactor = 0.5; // Example emission factor (in kg CO2/kWh)
//
//   @override
//   void initState() {
//     getData();
//     super.initState();
//   }
//
//   var uid;
//
//   getData() async {
//     uid = await FirebaseAuth.instance.currentUser!.uid;
//
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Expanded(
//             child: Container(
//               child: GridView(
//                 padding: EdgeInsets.all(20),
//                 children: [
//                   _buildGridItem('assets/img/lamp.png', 'Light'),
//                   _buildGridItem('assets/img/fan.png', 'Fan'),
//                   _buildGridItem('assets/img/smart.png', 'TV'),
//                   _buildGridItem('assets/img/computer.png', 'Computer'),
//                   _buildGridItem('assets/img/blender.png', 'Blender'),
//                   _buildGridItem('assets/img/washing-machine.png', 'Washing Machine'),
//                   _buildGridItem('assets/img/air-conditioner.png', 'AC'),
//                   _buildGridItem('assets/img/iron.png', 'Box'),
//                   _buildGridItem('assets/img/refrigerator.png', 'Fridge'),
//                   _buildGridItem('assets/img/solarpanel.png', 'Solar Panel'),
//                 ],
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 10,
//                   crossAxisSpacing: 10,
//                 ),
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   double totalEmission = _calculateTotalEmission();
//                   print('Total Home Emission: $totalEmission kg CO2');
//
//                   FirebaseFirestore.instance.collection('emission').doc(uid).set({
//                     'home_consumption': consumptionData,
//                     'total_home_consumption': totalEmission,
//                     'uid': uid,
//                   });
//                 },
//                 style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     backgroundColor: Colors.green
//                 ),
//                 child: Text('Calculate Total Emission', style: TextStyle(color: Colors.white),),
//               ),
//               SizedBox(width: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     consumptionData.clear();
//                     selectedTitle = null;
//                   });
//                 },
//                 style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   backgroundColor: Colors.lightBlue[700],
//                 ),
//                 child: Text('Reset Selection', style: TextStyle(color: Colors.white),),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildGridItem(String imagePath, String title) {
//     bool isAlreadySelected = consumptionData.containsKey(title);
//     return GestureDetector(
//       onTap: isAlreadySelected
//           ? null
//           : () {
//         setState(() {
//           selectedTitle = title;
//         });
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
//                     children: [
//                       Text(
//                         "Choose your consumption",
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       ListTile(
//                         onTap: () {
//                           setState(() {
//                             consumptionData[title] = 400;
//                           });
//                           Navigator.pop(context);
//                         },
//                         title: Text("Low"),
//                         subtitle: Text("200-600 kwh"),
//                         tileColor: consumptionData[title] == 400 ? Colors.blueAccent : null,
//                       ),
//                       ListTile(
//                         onTap: () {
//                           setState(() {
//                             consumptionData[title] = 800;
//                           });
//                           Navigator.pop(context);
//                         },
//                         title: Text("Medium"),
//                         subtitle: Text("600-1000 kwh"),
//                         tileColor: consumptionData[title] == 800 ? Colors.grey.withOpacity(0.3) : null,
//                       ),
//                       ListTile(
//                         onTap: () {
//                           setState(() {
//                             consumptionData[title] = 1200;
//                           });
//                           Navigator.pop(context);
//                         },
//                         title: Text("High"),
//                         subtitle: Text("Exceeds 1000kwh"),
//                         tileColor: consumptionData[title] == 1200 ? Colors.grey.withOpacity(0.3) : null,
//                       ),
//                     ],
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
//   double _calculateTotalEmission() {
//     double totalEmission = 0;
//     consumptionData.forEach((device, consumption) {
//       totalEmission += consumption * emissionFactor;
//     });
//     print(totalEmission);
//     return totalEmission;
//   }
// }





import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnergyPage extends StatefulWidget {
  const EnergyPage({Key? key}) : super(key: key);

  @override
  State<EnergyPage> createState() => _EnergyPageState();
}

class _EnergyPageState extends State<EnergyPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, int> consumptionData = {};
  String? selectedTitle;
  double emissionFactor = 0.5; // Example emission factor (in kg CO2/kWh)
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
            icon: Icon(Icons.history),
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmissionHistoryPage(uid: uid)),
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
              children: [
                _buildGridItem('assets/img/lamp.png', 'Light'),
                _buildGridItem('assets/img/fan.png', 'Fan'),
                _buildGridItem('assets/img/smart.png', 'TV'),
                _buildGridItem('assets/img/computer.png', 'Computer'),
                _buildGridItem('assets/img/blender.png', 'Blender'),
                _buildGridItem('assets/img/washing-machine.png', 'Washing Machine'),
                _buildGridItem('assets/img/air-conditioner.png', 'AC'),
                _buildGridItem('assets/img/iron.png', 'Box'),
                _buildGridItem('assets/img/refrigerator.png', 'Fridge'),
                _buildGridItem('assets/img/solarpanel.png', 'Solar Panel'),
              ],
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  var result = _calculateTotalEmission();
                  double totalEmission = result['emission'];
                  DateTime date = result['date'];
                  print('Total Home Emission: $totalEmission kg CO2');

                  await FirebaseFirestore.instance
                      .collection('emission')
                      .doc(uid)
                      .collection('daily_emissions')
                      .doc(date.toIso8601String())
                      .set({
                    'home_consumption': consumptionData,
                    'total_home_consumption': totalEmission,
                    'date': date,
                  });

                  // Show success message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Emission data saved successfully')),
                  );
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.green),
                child: Text('Calculate Total Emission', style: TextStyle(color: Colors.white)),
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
                child: Text('Reset Selection', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(String imagePath, String title) {
    bool isAlreadySelected = consumptionData.containsKey(title);
    return GestureDetector(
      onTap: isAlreadySelected
          ? null
          : () {
        setState(() {
          selectedTitle = title;
        });
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
                    children: [
                      Text(
                        "Choose your consumption",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      ListTile(
                        onTap: () {
                          setState(() {
                            consumptionData[title] = 400;
                          });
                          Navigator.pop(context);
                        },
                        title: Text("Low"),
                        subtitle: Text("200-600 kwh"),
                        tileColor: consumptionData[title] == 400 ? Colors.blueAccent : null,
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            consumptionData[title] = 800;
                          });
                          Navigator.pop(context);
                        },
                        title: Text("Medium"),
                        subtitle: Text("600-1000 kwh"),
                        tileColor: consumptionData[title] == 800 ? Colors.grey.withOpacity(0.3) : null,
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            consumptionData[title] = 1200;
                          });
                          Navigator.pop(context);
                        },
                        title: Text("High"),
                        subtitle: Text("Exceeds 1000kwh"),
                        tileColor: consumptionData[title] == 1200 ? Colors.grey.withOpacity(0.3) : null,
                      ),
                    ],
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

  Map<String, dynamic> _calculateTotalEmission() {
    double totalEmission = 0;
    consumptionData.forEach((device, consumption) {
      totalEmission += consumption * emissionFactor;
    });
    return {'emission': totalEmission, 'date': DateTime.now()};
  }
}

class EmissionHistoryPage extends StatelessWidget {
  final String uid;

  EmissionHistoryPage({required this.uid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History",style: TextStyle(color: Colors.black),),
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('emission')
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
              storeTotalEmission(double.parse(documents[0]['total_home_consumption'].toString()));

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
                    title: Text("Emission: ${data['total_home_consumption']} kg CO2"),
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
        .collection('emission')
        .doc(uid)
        .collection('daily_emissions')
        .doc(docId)
        .delete();
  }

  void _undoDelete(String docId, Map<String, dynamic> data) {
    FirebaseFirestore.instance
        .collection('emission')
        .doc(uid)
        .collection('daily_emissions')
        .doc(docId)
        .set(data);
  }



  Future<void> storeTotalEmission(double totalEmission) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('total_emission_energy', totalEmission);
  }

  getTotalEmission() async {
    final prefs = await SharedPreferences.getInstance();

    final val=await prefs.getDouble('total_emission_energy');
    print(val);
    return val;

  }
}
