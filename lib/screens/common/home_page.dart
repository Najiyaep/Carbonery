import 'package:carbonery/screens/common/energy_page.dart';
import 'package:carbonery/screens/common/graph_page.dart';
import 'package:carbonery/screens/common/transport_page.dart';
import 'package:carbonery/screens/common/waste_page.dart';
import 'package:carbonery/widgets/app_colors.dart';
import 'package:carbonery/widgets/apptext.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'diet_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 60,),
                CircularPercentIndicator(
                  radius: 140,
                  lineWidth: 20,
                  percent: 0.4,
                  progressColor: Colors.green,
                  backgroundColor: Colors.green.shade100,
                  circularStrokeCap: CircularStrokeCap.round,
                ),
                SizedBox(height: 60,),
                AppText(data: "Your Consumption"),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: (){
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
                                //Text("Electricity")
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
                                //Text("Electricity")
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
                                //Text("Electricity")
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
                                //Text("Electricity",)
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
                                      touchedIndex = pieTouchResponse
                                          .touchedSection!.touchedSectionIndex;
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
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EnergyPage(),
                                  ),
                                );
                              },
                              child: Text(
                                'Enter',
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
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DietPage(),
                                  ),
                                );
                              },
                              child: Text(
                                'Enter',
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
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TransportPage(),
                                  ),
                                );
                              },
                              child: Text(
                                'Enter',
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
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WastePage(),
                                  ),
                                );
                              },
                              child: Text(
                                'Enter',
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

                // Add more container widgets here
              ],
            ),
          ),
        ],
      ),
    );

  }


  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Color(0xffbc4b51),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Color(0xffe5c687),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Color(0xff38a3a5),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Color(0xff6a5d7b),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}