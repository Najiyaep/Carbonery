import 'package:carbonery/data/category_list.dart';
import 'package:carbonery/models/category_model.dart';
import 'package:flutter/material.dart';
class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Category',style: TextStyle(color:Colors.black87,fontSize: 18,fontWeight: FontWeight.w700 ),),
                Row(
                  children: [
                    Text("View All",style: TextStyle(color: Colors.blue,fontSize: 14,fontWeight: FontWeight.w700)),
                    SizedBox(width: 10,),
                    Icon(Icons.arrow_forward,color: Colors.blue,)
                  ],
                )
              ],
            ),
            SizedBox(height: 20,),
            Container(
              height: 60,
              child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  final CategoryModel category = categoryList[index];
                  final bool isSelected = false; // You need to implement the logic for selecting the category
                  final Color cardColor = isSelected ? Colors.green : Colors.yellow.shade50; // Adjust colors as needed
                  final Color textColor = isSelected ? Colors.white : Colors.black;
                  double cardWidth = (category.title!.length * 8.0) + 20.0; // Adjust as needed
                  if (index == categoryList.length - 1) {
                    // Extend the last card's width for "News"
                    cardWidth = 150.0; // Set a specific width for "News" card
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: SizedBox(
                      width: cardWidth,
                      child: Card(
                        color: cardColor,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(category.title!),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
}