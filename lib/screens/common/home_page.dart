import 'package:carbonery/screens/common/energy_page.dart';
import 'package:carbonery/screens/common/graph_page.dart';
import 'package:carbonery/screens/common/transport_page.dart';
import 'package:carbonery/screens/common/waste_page.dart';
import 'package:carbonery/widgets/app_colors.dart';
import 'package:carbonery/widgets/apptext.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/user_model.dart';
import 'diet_page.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int touchedIndex = -1;
//  var totalDietConsumption ;
//  var totalHomeConsumption ;
//   var totalTransportConsumption ;
//   var totalWasteConsumption;
//  var isLoading = true; // Loading state
//   var totalConsumption;
//   UserModel? currentUser;
//
//
//
//   getTotalEmission() async {
//     final prefs = await SharedPreferences.getInstance();
//
//     final val=
//
//
//
//     totalDietConsumption =  await prefs.getDouble('total_emission_diet')??0.0;
//     totalHomeConsumption =  await prefs.getDouble('total_emission_energy')??0.0;
//     totalTransportConsumption = await prefs.getDouble('total_emission_transport')?? 0.0;
//     totalWasteConsumption = await prefs.getDouble('total_emission_waste')??0.0;
//     isLoading = false; // Data fetched, stop loading
//
//     totalConsumption = totalDietConsumption + totalHomeConsumption + totalTransportConsumption + totalWasteConsumption;
//
//
//
//   }
//   @override
//   void initState() {
//     super.initState();
//
//     getTotalEmission();
//     _fetchCurrentUser();
//
//
//   }
//   Future<void> _fetchCurrentUser() async {
//     try {
//       User? user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         DocumentSnapshot userDoc = await FirebaseFirestore.instance
//             .collection('user')
//             .doc(user.uid)
//             .get();
//         setState(() {
//           currentUser = UserModel.fromJson(userDoc);
//         });
//       }
//     } catch (e) {
//       print('Error fetching user data: $e');
//     }
//   }
//   Future<void> fetchData() async {
//     try {
//
//       var id=await FirebaseAuth.instance.currentUser!.uid;
//       print(id);
//       // Fetch the document for the current user
//       String userId = id; // Replace with the actual user ID
//       DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('emission').doc(userId).get();
//
//       if (userDoc.exists) {
//         setState(() {
//           totalDietConsumption = userDoc['total_emission'] ?? 0.0;
//           totalHomeConsumption = userDoc['total_home_consumption'] ?? 0.0;
//           totalTransportConsumption = userDoc['total_emission'] ?? 0.0;
//           totalWasteConsumption = userDoc['total_emission'] ?? 0.0;
//           isLoading = false; // Data fetched, stop loading
//
//           totalConsumption = totalDietConsumption + totalHomeConsumption + totalTransportConsumption + totalWasteConsumption;
//
//
//
//         });
//       } else {
//         setState(() {
//           isLoading = false; // No data found, stop loading
//         });
//       }
//     } catch (error) {
//       print('Error fetching data: $error');
//       setState(() {
//         isLoading = false; // Error occurred, stop loading
//       });
//     }
//   }
//
//   List<PieChartSectionData> showingSections() {
//   totalConsumption = totalDietConsumption + totalHomeConsumption + totalTransportConsumption + totalWasteConsumption;
//
//     return [
//       PieChartSectionData(
//         color: Color(0xffbc4b51),
//         value: totalDietConsumption / totalConsumption * 100,
//         title: '${(totalDietConsumption / totalConsumption * 100).toStringAsFixed(1)}%',
//         radius: touchedIndex == 0 ? 60.0 : 50.0,
//         titleStyle: TextStyle(
//           fontSize: touchedIndex == 0 ? 25.0 : 16.0,
//           fontWeight: FontWeight.bold,
//           color: AppColors.mainTextColor1,
//           shadows: [Shadow(color: Colors.black, blurRadius: 2)],
//         ),
//       ),
//       PieChartSectionData(
//         color: Color(0xffe5c687),
//         value: totalHomeConsumption / totalConsumption * 100,
//         title: '${(totalHomeConsumption / totalConsumption * 100).toStringAsFixed(1)}%',
//         radius: touchedIndex == 1 ? 60.0 : 50.0,
//         titleStyle: TextStyle(
//           fontSize: touchedIndex == 1 ? 25.0 : 16.0,
//           fontWeight: FontWeight.bold,
//           color: AppColors.mainTextColor1,
//           shadows: [Shadow(color: Colors.black, blurRadius: 2)],
//         ),
//       ),
//       PieChartSectionData(
//         color: Color(0xff38a3a5),
//         value: totalTransportConsumption / totalConsumption * 100,
//         title: '${(totalTransportConsumption / totalConsumption * 100).toStringAsFixed(1)}%',
//         radius: touchedIndex == 2 ? 60.0 : 50.0,
//         titleStyle: TextStyle(
//           fontSize: touchedIndex == 2 ? 25.0 : 16.0,
//           fontWeight: FontWeight.bold,
//           color: AppColors.mainTextColor1,
//           shadows: [Shadow(color: Colors.black, blurRadius: 2)],
//         ),
//       ),
//       PieChartSectionData(
//         color: Color(0xff6a5d7b),
//         value: totalWasteConsumption / totalConsumption * 100,
//         title: '${(totalWasteConsumption / totalConsumption * 100).toStringAsFixed(1)}%',
//         radius: touchedIndex == 3 ? 60.0 : 50.0,
//         titleStyle: TextStyle(
//           fontSize: touchedIndex == 3 ? 25.0 : 16.0,
//           fontWeight: FontWeight.bold,
//           color: AppColors.mainTextColor1,
//           shadows: [Shadow(color: Colors.black, blurRadius: 2)],
//         ),
//       ),
//
//     ];
//
//     setState(() {
//
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     print(totalTransportConsumption);
//     double totalConsumption = totalDietConsumption + totalHomeConsumption + totalTransportConsumption + totalWasteConsumption;
//     double maxConsumption =50.0; // Set this to the maximum expected consumption value if known
//     double consumptionPercent = (totalConsumption / maxConsumption).clamp(0.0, 1.0); // Normalize to 0-1 range for percent
// print(consumptionPercent);
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int touchedIndex = -1;
  double totalDietConsumption = 0.0;
  double totalHomeConsumption = 0.0;
  double totalTransportConsumption = 0.0;
  double totalWasteConsumption = 0.0;
  bool isLoading = true;
  double totalConsumption = 0.0;
  UserModel? currentUser;

  Future<void> getTotalEmission() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      totalDietConsumption = prefs.getDouble('total_emission_diet') ?? 0.0;
      totalHomeConsumption = prefs.getDouble('total_emission_energy') ?? 0.0;
      totalTransportConsumption = prefs.getDouble('total_emission_transport') ?? 0.0;
      totalWasteConsumption = prefs.getDouble('total_emission_waste') ?? 0.0;

      totalConsumption = totalDietConsumption + totalHomeConsumption + totalTransportConsumption + totalWasteConsumption;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getTotalEmission();
    _fetchCurrentUser();
    fetchData();
  }

  Future<void> _fetchCurrentUser() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('user')
            .doc(user.uid)
            .get();
        setState(() {
          currentUser = UserModel.fromJson(userDoc);
        });
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Future<void> fetchData() async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot homeDoc = await FirebaseFirestore.instance.collection('emission').doc(userId).get();
      DocumentSnapshot dietDoc = await FirebaseFirestore.instance.collection('diet_emissions').doc(userId).get();
      DocumentSnapshot transportDoc = await FirebaseFirestore.instance.collection('transport_emissions').doc(userId).get();
      DocumentSnapshot wasteDoc = await FirebaseFirestore.instance.collection('waste_emissions').doc(userId).get();

      setState(() {
        totalHomeConsumption = homeDoc.exists ? homeDoc['total_home_consumption'] ?? 0.0 : 0.0;
        totalDietConsumption = dietDoc.exists ? dietDoc['total_emission'] ?? 0.0 : 0.0;
        totalTransportConsumption = transportDoc.exists ? transportDoc['total_emission'] ?? 0.0 : 0.0;
        totalWasteConsumption = wasteDoc.exists ? wasteDoc['total_emission'] ?? 0.0 : 0.0;

        totalConsumption = totalDietConsumption + totalHomeConsumption + totalTransportConsumption + totalWasteConsumption;
        isLoading = false;
      });
    } catch (error) {
      print('Error fetching data: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  List<PieChartSectionData> showingSections() {
    double totalConsumption = totalDietConsumption +
        totalHomeConsumption +
        totalTransportConsumption +
        totalWasteConsumption;

    if (totalConsumption == 0) {
      return [];
    }

    List<PieChartSectionData> sections = [];

    if (totalDietConsumption != null && totalDietConsumption > 0) {
      sections.add(
        PieChartSectionData(
          color: const Color(0xffbc4b51),
          value: totalDietConsumption / totalConsumption * 100,
          title: '${(totalDietConsumption / totalConsumption * 100).toStringAsFixed(1)}%',
          radius: touchedIndex == 0 ? 60.0 : 50.0,
          titleStyle: TextStyle(
            fontSize: touchedIndex == 0 ? 25.0 : 16.0,
            fontWeight: FontWeight.bold,
            color: AppColors.mainTextColor1,
            shadows: [Shadow(color: Colors.black, blurRadius: 2)],
          ),
        ),
      );
    }

    if (totalHomeConsumption != null && totalHomeConsumption > 0) {
      sections.add(
        PieChartSectionData(
          color: const Color(0xffe5c687),
          value: totalHomeConsumption / totalConsumption * 100,
          title: '${(totalHomeConsumption / totalConsumption * 100).toStringAsFixed(1)}%',
          radius: touchedIndex == 1 ? 60.0 : 50.0,
          titleStyle: TextStyle(
            fontSize: touchedIndex == 1 ? 25.0 : 16.0,
            fontWeight: FontWeight.bold,
            color: AppColors.mainTextColor1,
            shadows: [Shadow(color: Colors.black, blurRadius: 2)],
          ),
        ),
      );
    }

    if (totalTransportConsumption != null && totalTransportConsumption > 0) {
      sections.add(
        PieChartSectionData(
          color: const Color(0xff38a3a5),
          value: totalTransportConsumption / totalConsumption * 100,
          title: '${(totalTransportConsumption / totalConsumption * 100).toStringAsFixed(1)}%',
          radius: touchedIndex == 2 ? 60.0 : 50.0,
          titleStyle: TextStyle(
            fontSize: touchedIndex == 2 ? 25.0 : 16.0,
            fontWeight: FontWeight.bold,
            color: AppColors.mainTextColor1,
            shadows: [Shadow(color: Colors.black, blurRadius: 2)],
          ),
        ),
      );
    }

    if (totalWasteConsumption != null && totalWasteConsumption > 0) {
      sections.add(
        PieChartSectionData(
          color: const Color(0xff6a5d7b),
          value: totalWasteConsumption / totalConsumption * 100,
          title: '${(totalWasteConsumption / totalConsumption * 100).toStringAsFixed(1)}%',
          radius: touchedIndex == 3 ? 60.0 : 50.0,
          titleStyle: TextStyle(
            fontSize: touchedIndex == 3 ? 25.0 : 16.0,
            fontWeight: FontWeight.bold,
            color: AppColors.mainTextColor1,
            shadows: [Shadow(color: Colors.black, blurRadius: 2)],
          ),
        ),
      );
    }

    return sections;
  }

  @override
  Widget build(BuildContext context) {
    double maxConsumption = 50.0; // Set this to the maximum expected consumption value if known
    double consumptionPercent = (totalConsumption / maxConsumption).clamp(0.0, 1.0);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: isLoading
                ? Center(child: CircularProgressIndicator()) // Show loading indicator
                : Column(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 60),
                // CircularPercentIndicator(
                //   radius: 140,
                //   lineWidth: 20,
                //   percent: (totalConsumption / maxConsumption).clamp(0.0, 1.0), // Ensure percent is between 0.0 and 1.0
                //   center: Text(
                //     '${((totalConsumption / maxConsumption)/100).toStringAsFixed(1)}%', // Show total emission percentage
                //     style: TextStyle(
                //       fontSize: 20.0,
                //       fontWeight: FontWeight.bold,
                //       color: AppColors.mainTextColor1,
                //     ),
                //   ),
                //   progressColor: Colors.green,
                //   backgroundColor: Colors.green.shade100,
                //   circularStrokeCap: CircularStrokeCap.round,
                // ),
                //
                currentUser != null
                    ? RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                    children: [
                      TextSpan(
                        text: "Welcome ",
                      ),
                      TextSpan(
                        text: "${currentUser!.name}",
                        style: TextStyle(fontSize: 28, color: Colors.green),
                      ),
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            '👋',
                            style:
                            TextStyle(fontSize: 30, color: Colors.orange),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                    : Center(child: CircularProgressIndicator()),
                SizedBox(height: 60),
                AppText(data: "Your Consumption"),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GraphPage()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Color(0xffbc4b51),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.restaurant, color: Colors.white, size: 18),
                                ),
                                SizedBox(width: 15),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Color(0xffe5c687),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.solar_power, color: Colors.white, size: 18),
                                ),
                                SizedBox(width: 15),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Color(0xff38a3a5),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.emoji_transportation, color: Colors.white, size: 18),
                                ),
                                SizedBox(width: 15),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Color(0xff6a5d7b),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.delete, color: Colors.white, size: 18),
                                ),
                                SizedBox(width: 15),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 150,
                          width: 150,
                          child: AspectRatio(
                            aspectRatio: 0.8,
                            child: PieChart(
                              PieChartData(
                                pieTouchData: PieTouchData(
                                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                                    setState(() {
                                      if (!event.isInterestedForInteractions ||
                                          pieTouchResponse == null ||
                                          pieTouchResponse.touchedSection == null) {
                                        touchedIndex = -1;
                                        return;
                                      }
                                      touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                                    });
                                  },
                                ),
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                sectionsSpace: 0,
                                centerSpaceRadius: 30,
                                sections: showingSections(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Stack(
                        children: [
                          // Icon
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              width: 60,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff808782),
                              ),
                              child: Icon(
                                Icons.solar_power,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // Title
                          Positioned(
                            top: 5,
                            left: 60,
                            child: Text(
                              'Home Energy',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          // Button
                          Positioned(
                            bottom: 30,
                            left: 30,
                            child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.grey[200]),
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ))
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EnergyPage(),
                                  ),
                                );
                              },
                              child: Text(
                                '    Enter    ',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          // Image
                          Positioned(
                            right: 10,
                            bottom: 30,
                            child: Image.asset(
                              'assets/img/eco-house.png',
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Container(
                  height: 200,
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Stack(
                        children: [
                          // Icon
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              width: 60,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff808782),
                              ),
                              child: Icon(
                                Icons.restaurant,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // Title
                          Positioned(
                            top: 5,
                            left: 60,
                            child: Text(
                              'Dietry',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          // Button
                          Positioned(
                            bottom: 30,
                            left: 30,
                            child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.grey[200]),
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ))
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DietPage(),
                                  ),
                                );
                              },
                              child: Text(
                                '    Enter    ',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          // Image
                          Positioned(
                            right: 10,
                            bottom: 30,
                            child: Image.asset(
                              'assets/img/beef.png',
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Container(
                  height: 200,
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Stack(
                        children: [
                          // Icon
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              width: 60,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff808782),
                              ),
                              child: Icon(
                                Icons.emoji_transportation_outlined,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // Title
                          Positioned(
                            top: 5,
                            left: 60,
                            child: Text(
                              'Transportation',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          // Button
                          Positioned(
                            bottom: 30,
                            left: 30,
                            child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.grey[200]),
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ))
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TransportPage(),
                                  ),
                                );
                              },
                              child: Text(
                                '    Enter    ',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          // Image
                          Positioned(
                            right: 10,
                            bottom: 30,
                            child: Image.asset(
                              'assets/img/transport.png',
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Container(
                  height: 200,
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Stack(
                        children: [
                          // Icon
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              width: 60,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff808782),
                              ),
                              child: Icon(
                                Icons.delete_sharp,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // Title
                          Positioned(
                            top: 5,
                            left: 60,
                            child: Text(
                              'Waste Management',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          // Button
                          Positioned(
                            bottom: 30,
                            left: 30,
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.grey[200]),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ))
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WastePage(),
                                  ),
                                );
                              },
                              child: Text(
                                '    Enter    ',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          // Image
                          Positioned(
                            right: 10,
                            bottom: 30,
                            child: Image.asset(
                              'assets/img/garbage.png',
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
