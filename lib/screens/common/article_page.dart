import 'package:carbonery/screens/common/article_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:carbonery/models/category_model.dart';
import 'package:carbonery/models/blog_model.dart';
import 'package:carbonery/services/blog_service.dart';

final List<CategoryModel> categoryList = [
  CategoryModel(id: "1", title: "All"),
  CategoryModel(id: "2", title: "Climate Foresight"),
  CategoryModel(id: "3", title: "Sustainability at Work"),
  CategoryModel(id: "4", title: "Planet-Friendly living"),
  CategoryModel(id: "5", title: "Offsetting"),
  CategoryModel(id: "6", title: "News"),
];

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  int _selectedCategoryIndex = 0; // Track the selected category index
  final BlogService _blogService = BlogService();
  late Stream<List<Blog>> _blogsStream;

  @override
  void initState() {
    super.initState();
    _blogsStream = _blogService.getArticles(categoryList[_selectedCategoryIndex].title!);
  }

  void _onCategorySelected(int index) {
    setState(() {
      _selectedCategoryIndex = index;
      _blogsStream = _blogService.getArticles(categoryList[index].title!);
      print(categoryList[index].title);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                Text(
                  'Category',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  // Uncomment and implement the logic for "View All" if needed
                  // children: [
                  //   Text("View All",style: TextStyle(color: Colors.blue,fontSize: 14,fontWeight: FontWeight.w700)),
                  //   SizedBox(width: 10,),
                  //   Icon(Icons.arrow_forward,color: Colors.blue,)
                  // ],
                )
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 60,
              child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  final CategoryModel category = categoryList[index];
                  final bool isSelected = _selectedCategoryIndex == index;
                  final Color cardColor = isSelected ? Colors.green : Colors.white70;
                  final Color textColor = isSelected ? Colors.white : Colors.black;
                  double cardWidth = (category.title!.length * 8.0) + 20.0;

                  if (index == categoryList.length - 1) {
                    cardWidth = 150.0; // Set a specific width for the last card, if necessary
                  }

                  return GestureDetector(
                    onTap: () => _onCategorySelected(index),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: SizedBox(
                        width: cardWidth,
                        child: Card(
                          color: cardColor,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                category.title!,
                                style: TextStyle(color: textColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: StreamBuilder<List<Blog>>(
                stream: _blogsStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No blogs found.'));
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Blog blog = snapshot.data![index];
                      return ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>BlogDetailScreen(blog: blog)));
                        },
                        leading: blog.imageUrl != null ? Image.network(blog.imageUrl!) : null,
                        title: Text(blog.title),
                        subtitle: Text('By ${blog.authorName}'),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
