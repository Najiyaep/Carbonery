import 'package:carbonery/screens/common/article_page.dart';
import 'package:flutter/material.dart';
class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
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
                      color: Colors.green[400],
                    ),
                    child: Icon(
                      Icons.eco,
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
                    'Offset Emission',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                // Button
                Positioned(
                  bottom: 30,
                  left: 30,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey[200]),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ))
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArticlePage(),

                        ),
                      );
                    },
                    child: Text(
                      '    Join    ',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                // Image
                Positioned(
                  right: 10,
                  bottom: 30,
                  child: Image.asset(
                    'assets/img/carbon-free.png',
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
    );
  }
}
