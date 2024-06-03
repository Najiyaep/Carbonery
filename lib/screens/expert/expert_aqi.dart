import 'package:carbonery/data/fetch_data.dart';
import 'package:carbonery/screens/common/aqi_page.dart';
import 'package:flutter/material.dart';
class ExpertAqi extends StatefulWidget {
  const ExpertAqi({super.key});

  @override
  State<ExpertAqi> createState() => _ExpertAqiState();
}

class _ExpertAqiState extends State<ExpertAqi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: fetchData(),
          builder: (context, snap) {
            if(snap.hasData) {
              return AqiScreen(snap.data!);
            } else {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }
      ),
    );
  }
}
