import 'dart:ui';

import 'package:carbonery/data/air_quality.dart';
import 'package:carbonery/screens/common/aqi_painter.dart';
import 'package:flutter/material.dart';
class AirScreen extends StatelessWidget {
  final AirQuality airQuality;
  const AirScreen(this.airQuality, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text(
            'Air Quality Indicator',
            style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.black12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: kToolbarHeight * 3),
                child: SizedBox(
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
                          painter: AirQualityPainter(airQuality.aqi),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 400,
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: Column(
                              children: [
                                Container(
                                  width: 400,
                                  height: MediaQuery.of(context).size.height * 0.25,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/${airQuality.emojiRef}"
                                          )
                                      )
                                  ),
                                ),
                                Container(
                                  width: 400,
                                  height: MediaQuery.of(context).size.height * 0.15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.green.shade50,
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        airQuality.message!,
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
                ),
              )
            ],
          ),
        )
    );
  }
}