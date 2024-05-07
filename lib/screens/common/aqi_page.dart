import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
class AqiPage extends StatefulWidget {
  const AqiPage({super.key});

  @override
  State<AqiPage> createState() => _AqiPageState();
}

class _AqiPageState extends State<AqiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: CircularPercentIndicator(radius: 150,
        lineWidth: 20,
        percent: 1,
        progressColor: Colors.green,
        backgroundColor: Colors.green.shade100,
        circularStrokeCap: CircularStrokeCap.round,),
      ),
    );
  }
}
