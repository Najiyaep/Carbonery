import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
            consumptionData[title] = 0.3; // Update with actual values
          });
          Navigator.pop(context);
          _calculateTotalEmission();
        },
        title: Text("Low"),
        subtitle: Text("0.1-0.5kg"),
      ),
      ListTile(
        onTap: () {
          setState(() {
            consumptionData[title] = 8; // Update with actual values
          });
          Navigator.pop(context);
          _calculateTotalEmission();
        },
        title: Text("Medium"),
        subtitle: Text("6-10kg"),
      ),
      ListTile(
        onTap: () {
          setState(() {
            consumptionData[title] = 22.5; // Update with actual values
          });
          Navigator.pop(context);
          _calculateTotalEmission();
        },
        title: Text("High"),
        subtitle: Text("15-30kg"),
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
      'diet_consumption': consumptionData,
      'total_diet_consumption': totalEmission,
      //'uid': uid,
    });
  }
}
