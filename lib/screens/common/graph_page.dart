import 'package:carbonery/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GraphPage extends StatefulWidget {
  const GraphPage({super.key});

  @override
  State<GraphPage> createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 70,
                  width: 70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    radiusFactor: 0.5,
                    pointers: <GaugePointer>[
                      RangePointer(
                        value: 40,
                        cornerStyle: CornerStyle.bothCurve,
                        color: Color(0xffbc4b51),
                      )
                    ],
                    interval: 5,
                    startAngle: 5,
                    endAngle: 5,
                    showTicks: false,
                    showLabels: false,
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '40%',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'Home Energy',
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        angle: 270,
                        positionFactor: 0.1,
                      ),
                    ],
                  ),
                  RadialAxis(
                    radiusFactor: 0.65,
                    pointers: [
                      RangePointer(
                        value: 30,
                        cornerStyle: CornerStyle.bothCurve,
                        color: Color(0xffe5c687),
                      ),
                    ],
                    interval: 5,
                    startAngle: 5,
                    endAngle: 5,
                    showTicks: false,
                    showLabels: false,
                  ),
                  RadialAxis(
                    radiusFactor: 0.8,
                    pointers: [
                      RangePointer(
                        value: 15,
                        cornerStyle: CornerStyle.bothCurve,
                        color: Color(0xff38a3a5),
                      ),
                    ],
                    interval: 5,
                    startAngle: 5,
                    endAngle: 5,
                    showTicks: false,
                    showLabels: false,
                  ),
                  RadialAxis(
                    radiusFactor: 0.95,
                    pointers: [
                      RangePointer(
                        value: 15,
                        cornerStyle: CornerStyle.bothCurve,
                        color: Color(0xff6a5d7b),
                      ),
                    ],
                    interval: 5,
                    startAngle: 5,
                    endAngle: 5,
                    showTicks: false,
                    showLabels: false,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}