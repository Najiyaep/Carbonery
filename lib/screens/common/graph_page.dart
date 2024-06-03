// import 'package:carbonery/constants/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';
//
// class GraphPage extends StatefulWidget {
//   const GraphPage({super.key});
//
//   @override
//   State<GraphPage> createState() => _GraphPageState();
// }
//
// class _GraphPageState extends State<GraphPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.white,
//       surfaceTintColor: Colors.white,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 SizedBox(
//                   height: 70,
//                   width: 70,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(60),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: EdgeInsets.all(defaultPadding),
//               child: SfRadialGauge(
//                 axes: <RadialAxis>[
//                   RadialAxis(
//                     radiusFactor: 0.5,
//                     pointers: <GaugePointer>[
//                       RangePointer(
//                         value: 40,
//                         cornerStyle: CornerStyle.bothCurve,
//                         color: Color(0xffbc4b51),
//                       )
//                     ],
//                     interval: 5,
//                     startAngle: 5,
//                     endAngle: 5,
//                     showTicks: false,
//                     showLabels: false,
//                     annotations: <GaugeAnnotation>[
//                       GaugeAnnotation(
//                         widget: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               '40%',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20,
//                               ),
//                             ),
//                             Text(
//                               'Home Energy',
//                               style: TextStyle(fontSize: 18),
//                             )
//                           ],
//                         ),
//                         angle: 270,
//                         positionFactor: 0.1,
//                       ),
//                     ],
//                   ),
//                   RadialAxis(
//                     radiusFactor: 0.65,
//                     pointers: [
//                       RangePointer(
//                         value: 30,
//                         cornerStyle: CornerStyle.bothCurve,
//                         color: Color(0xffe5c687),
//                       ),
//                     ],
//                     interval: 5,
//                     startAngle: 5,
//                     endAngle: 5,
//                     showTicks: false,
//                     showLabels: false,
//                   ),
//                   RadialAxis(
//                     radiusFactor: 0.8,
//                     pointers: [
//                       RangePointer(
//                         value: 15,
//                         cornerStyle: CornerStyle.bothCurve,
//                         color: Color(0xff38a3a5),
//                       ),
//                     ],
//                     interval: 5,
//                     startAngle: 5,
//                     endAngle: 5,
//                     showTicks: false,
//                     showLabels: false,
//                   ),
//                   RadialAxis(
//                     radiusFactor: 0.95,
//                     pointers: [
//                       RangePointer(
//                         value: 50,
//                         cornerStyle: CornerStyle.bothCurve,
//                         color: Color(0xff6a5d7b),
//                       ),
//                     ],
//                     interval: 5,
//                     startAngle: 5,
//                     endAngle: 5,
//                     showTicks: false,
//                     showLabels: false,
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:carbonery/widgets/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphPage extends StatefulWidget {
  const GraphPage({super.key});

  @override
  State<GraphPage> createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  int touchedIndex = -1;
  var totalDietConsumption;
  var totalHomeConsumption;
  var totalTransportConsumption;
  var totalWasteConsumption;
  var isLoading = true;
  var totalConsumption;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var id = await FirebaseAuth.instance.currentUser!.uid;
      print(id);
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('emission').doc(id).get();

      if (userDoc.exists) {
        setState(() {
          totalDietConsumption = userDoc['total_diet_consumption'] ?? 0.0;
          totalHomeConsumption = userDoc['total_home_consumption'] ?? 0.0;
          totalTransportConsumption = userDoc['total_transport_consumption'] ?? 0.0;
          totalWasteConsumption = userDoc['total_waste_consumption'] ?? 0.0;
          totalConsumption = totalDietConsumption + totalHomeConsumption + totalTransportConsumption + totalWasteConsumption;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (error) {
      print('Error fetching data: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  List<PieChartSectionData> showingSections() {
    return [
      PieChartSectionData(
        color: Color(0xffbc4b51),
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
      PieChartSectionData(
        color: Color(0xffe5c687),
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
      PieChartSectionData(
        color: Color(0xff38a3a5),
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
      PieChartSectionData(
        color: Color(0xff6a5d7b),
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
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Graph Page'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Center(
        child: Container(
          height: 300,
          width: 300,
          child: AspectRatio(
            aspectRatio: 1.3,
            child: PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    setState(() {
                      if (!event.isInterestedForInteractions || pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
                        touchedIndex = -1;
                        return;
                      }
                      touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                    });
                  },
                ),
                borderData: FlBorderData(show: false),
                sectionsSpace: 0,
                centerSpaceRadius: 40,
                sections: showingSections(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
