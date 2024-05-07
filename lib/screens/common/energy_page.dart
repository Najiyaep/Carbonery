import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  @override
  void initState() {
    getData();
    super.initState();
  }

  var uid;

  getData() async {
    uid = await FirebaseAuth.instance.currentUser!.uid;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (selectedTitle != null) _buildSelectedWidget(selectedTitle!, consumptionData),
          Expanded(
            child: Container(
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  double totalEmission = _calculateTotalEmission();
                  print('Total Home Emission: $totalEmission kg CO2');

                  FirebaseFirestore.instance.collection('emission').doc(uid).set({
                    'home_consumption': consumptionData,
                    'total_home_consumption': totalEmission,
                    'uid': uid,
                  });
                },
                child: Text('Calculate Total Emission'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    consumptionData.clear();
                    selectedTitle = null;
                  });
                },
                child: Text('Reset Selection'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedWidget(String title, Map<String, int> consumptionData) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selected Item: $title',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Consumption Data:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: consumptionData.entries.map((entry) {
              return Text('${entry.key}: ${entry.value}');
            }).toList(),
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
        color: isAlreadySelected ? Colors.red.withOpacity(0.3) : Colors.white,
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

  double _calculateTotalEmission() {
    double totalEmission = 0;
    consumptionData.forEach((device, consumption) {
      totalEmission += consumption * emissionFactor;
    });
    print(totalEmission);
    return totalEmission;
  }
}
