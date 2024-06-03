import 'dart:ui';

import 'package:carbonery/data/air_quality.dart';
import 'package:carbonery/screens/common/aqi_painter.dart';
import 'package:flutter/material.dart';
class AqiScreen extends StatefulWidget {
  final AirQuality airQuality;
  const AqiScreen(this.airQuality, {super.key});

  @override
  State<AqiScreen> createState() => _AqiScreenState();
}

class _AqiScreenState extends State<AqiScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,

      child: Stack(
        children: [

          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(
                        MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.width
                    ),
                    painter: AirQualityPainter(widget.airQuality.aqi),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(


                      width: 400,


                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Container(
                            width: 400,
                            height: MediaQuery.of(context).size.height * 0.15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green.withOpacity(0.2),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  widget.airQuality.message!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}