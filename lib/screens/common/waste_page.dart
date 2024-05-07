import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WastePage extends StatefulWidget {
  const WastePage({Key? key}) : super(key: key);

  @override
  State<WastePage> createState() => _WastePageState();
}

class _WastePageState extends State<WastePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, double> consumptionData = {};
  String? selectedTitle;
  double emissionFactor = 0.4; // Example emission factor (in kg CO2/kg food)

  @override
  void initState() {
    getData();
    super.initState();
  }

  var uid;

  getData() async {
    uid = FirebaseAuth.instance.currentUser!.uid;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
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
    );
  }

  Widget _buildGridItem(String imagePath, String title) {
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
          _calculateTotalEmission();
        },
        title: Text("Low"),
        subtitle: Text("0.1-0.3kg"),
      ),
      ListTile(
        onTap: () {
          setState(() {
            consumptionData[title] = 0.4;
          });
          Navigator.pop(context);
          _calculateTotalEmission();
        },
        title: Text("Medium"),
        subtitle: Text("0.3-0.5kg"),
      ),
      ListTile(
        onTap: () {
          setState(() {
            consumptionData[title] = 0.5;
          });
          Navigator.pop(context);
          _calculateTotalEmission();
        },
        title: Text("High"),
        subtitle: Text("0.4-0.6kg"),
      ),
    ];
  }

  void _calculateTotalEmission() {
    double totalEmission = 0;
    consumptionData.values.forEach((consumption) {
      totalEmission += consumption * emissionFactor;
    });
    print('Total Emission: $totalEmission kg CO2');
    _firestore.collection('emission').doc(uid).update({
      'waste_consumption': consumptionData,
      'total_waste_consumption': totalEmission,
      //'uid': uid,
    });
  }
}
