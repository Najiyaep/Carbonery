import 'package:flutter/material.dart';

class TransportPage extends StatefulWidget {
  const TransportPage({Key? key}) : super(key: key);

  @override
  State<TransportPage> createState() => _TransportPageState();
}

class _TransportPageState extends State<TransportPage> {
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
            _buildGridItem('assets/img/sedan.png', 'Car'),
            _buildGridItem('assets/img/cars.png', 'Carpool'),
            _buildGridItem('assets/img/bike.png', 'Bike'),
            _buildGridItem('assets/img/buses.png', 'Bus'),
            _buildGridItem('assets/img/train.png', 'Train'),
            _buildGridItem('assets/img/plane.png', 'Plane'),
            _buildGridItem('assets/img/bicycle.png', 'Bicycle'),
            _buildGridItem('assets/img/walk.png', 'Walk'),
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
                    children: [
                      Text(
                        "How much did you travelled?",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Date and Time",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.calendar_today),
                        title: Text("Date Traveled: Today"),
                      ),
                      ListTile(
                        leading: Icon(Icons.access_time),
                        title: Text("Time Traveled: 12:00 PM"),
                      ),
                      SizedBox(height: 20),
                      if (title != 'Bicycle' && title != 'Walk')
                        Text(
                          "Details",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      if (title != 'Bicycle' && title != 'Walk')
                        ListTile(
                          leading: Icon(Icons.directions_car),
                          title: Text("Vehicle Size: Large"),
                        ),
                      if (title != 'Bicycle' && title != 'Walk')
                        ListTile(
                          leading: Icon(Icons.local_gas_station),
                          title: Text("Fuel Type: Diesel"),
                        ),
                      if (title == 'Carpool')
                        ListTile(
                          leading: Icon(Icons.people),
                          title: Text("Number of Passengers: 4"),
                        ),
                      if (title == 'Train')
                        ListTile(
                          leading: Icon(Icons.train),
                          title: Text("Rail Type: High-speed"),
                        ),
                      if (title == 'Plane')
                        ListTile(
                          leading: Icon(Icons.airplanemode_active),
                          title: Text("Class: Business"),
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
}
