import 'package:carbonery/widgets/app_colors.dart';
import 'package:carbonery/widgets/apptext.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [

          SliverFillRemaining(
            hasScrollBody: false,

            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // First Card
                AppText(data: "Your Activity",),
                SizedBox(height: 10,),
                Container(

                  height: 220,
                  width: double.infinity,
                  child: Card(

                    color: Colors.yellow[50],
                    elevation: 10,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20),),),
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
                                color: Colors.green,
                              ),
                              child: Icon(
                                Icons.star_purple500_sharp,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // Title
                          Positioned(
                            top: 5,
                            left: 60, // Adjust the left position according to your preference
                            child: Text(
                              'Badges',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          // Button
                          // Positioned(
                          //   bottom: 0,
                          //   left: 0,
                          //   child: ElevatedButton(
                          //     onPressed: () {
                          //       // Add your button onPressed logic here
                          //     },
                          //     child: Text('Enter',style: TextStyle(color: Colors.black),),
                          //   ),
                          // ),
                          // Image
                          Positioned(
                            right: 150,
                            bottom: 40,
                            child: Image.asset(
                              'assets/img/badge.png', // Provide your image path here
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
                SizedBox(height: 10,),

                Container(
                  height: 220,
                  width: double.infinity,
                  child: Card(

                    color: Colors.yellow[50],
                    elevation: 10,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
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
                                color: Colors.teal,
                              ),
                              child: Icon(
                                Icons.flag,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // Title
                          Positioned(
                            top: 5,
                            left: 60, // Adjust the left position according to your preference
                            child: Text(
                              'Personal Best',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          // Button
                          // Positioned(
                          //   bottom: 30,
                          //   left: 30,
                          //   child: ElevatedButton(
                          //     onPressed: () {
                          //       // Add your button onPressed logic here
                          //     },
                          //     child: Text('Enter',style: TextStyle(color: Colors.black),),
                          //   ),
                          // ),
                          // Image
                          Positioned(
                            right: 150,
                            bottom: 40,
                            child: Image.asset(
                              'assets/img/trophy.png', // Provide your image path here
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
                SizedBox(height: 10,),

                Container(
                  height: 220,
                  width: double.infinity,
                  child: Card(

                    color: Colors.yellow[50],
                    elevation: 10,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
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
                                color: Colors.teal,
                              ),
                              child: Icon(
                                Icons.summarize,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // Title
                          Positioned(
                            top: 5,
                            left: 60, // Adjust the left position according to your preference
                            child: Text(
                              'Weekly Summary',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Positioned(
                            bottom: 30,
                              left: 30,
                              child: Text('Average Carbon emission------kt/d')),
                          // Button
                          // Positioned(
                          //   bottom: 30,
                          //   left: 30,
                          //   child: ElevatedButton(
                          //     onPressed: () {
                          //       // Add your button onPressed logic here
                          //     },
                          //     child: Text('Enter',style: TextStyle(color: Colors.black),),
                          //   ),
                          // ),
                          // Image
                          Positioned(
                            right: 10,
                            bottom: 50,
                            child: Image.asset(
                              'assets/img/summary.png', // Provide your image path here
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
                SizedBox(height: 10,),

                // Container(
                //   height: 220,
                //   width: double.infinity,
                //   child: Card(
                //
                //     color: Colors.yellow[50],
                //     elevation: 10,
                //     shadowColor: Colors.grey,
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(20))),
                //     child: Padding(
                //       padding: const EdgeInsets.all(16.0),
                //       child: Stack(
                //         children: [
                //           // Icon
                //           Positioned(
                //             top: 0,
                //             left: 0,
                //             child: Container(
                //               width: 60,
                //               height: 40,
                //               decoration: BoxDecoration(
                //                 shape: BoxShape.circle,
                //                 color: Colors.blueGrey,
                //               ),
                //               child: Icon(
                //                 Icons.delete,
                //                 size: 20,
                //                 color: Colors.white,
                //               ),
                //             ),
                //           ),
                //           // Title
                //           Positioned(
                //             top: 0,
                //             left: 60, // Adjust the left position according to your preference
                //             child: Text(
                //               'Waste Management',
                //               style: TextStyle(fontSize: 30),
                //             ),
                //           ),
                //           // Button
                //           Positioned(
                //             bottom: 30,
                //             left: 30,
                //             child: ElevatedButton(
                //               onPressed: () {
                //                 // Add your button onPressed logic here
                //               },
                //               child: Text('Enter',style: TextStyle(color: Colors.black),),
                //             ),
                //           ),
                //           // Image
                //           Positioned(
                //             right: 10,
                //             bottom: 20,
                //             child: Image.asset(
                //               'assets/img/garbage.png', // Provide your image path here
                //               height: 80,
                //               width: 80,
                //               fit: BoxFit.cover,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),





              ],
            ),
          )

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
            color: AppColors.contentColorBlue,
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
            color: AppColors.contentColorYellow,
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
            color: AppColors.contentColorPurple,
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
            color: AppColors.contentColorGreen,
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