import 'dart:io';


import 'package:carbonery/data/category_list.dart';
import 'package:carbonery/models/blog_model.dart';
import 'package:carbonery/services/blog_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlogListScreen extends StatefulWidget {
  @override
  State<BlogListScreen> createState() => _BlogListScreenState();
}

class _BlogListScreenState extends State<BlogListScreen> {
  final BlogService blogService = BlogService();
  var id;
  var name;
  getdata() async{

    SharedPreferences _pref=await SharedPreferences.getInstance();

    id=await  _pref.getString('id');
    name=await  _pref.getString('name');

    print(id);
    print(name);

    setState(() {

    });




  }

  @override
  void initState() {
   getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text("Blogs"),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BlogFormScreen()),
                );
              },
            ),
          ],
        ),
        Expanded(
          child: StreamBuilder<List<Blog>>(
            stream: blogService.getBlogs(id),
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
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.teal[50],
                      child: ListTile(
                        leading: blog.imageUrl != null
                            ? Image.network(blog.imageUrl!)
                            : null,
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${blog.title} "),
                            Text("${blog.category}",style: TextStyle(color: Colors.black54),),
                          ],
                        ),
                        subtitle: Text('By ${blog.authorName}'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlogFormScreen(blog: blog),
                            ),
                          );
                        },
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            blogService.deleteBlog(blog.id!);
                          },
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class BlogFormScreen extends StatefulWidget {
  final Blog? blog;

  BlogFormScreen({this.blog});

  @override
  _BlogFormScreenState createState() => _BlogFormScreenState();
}

class _BlogFormScreenState extends State<BlogFormScreen> {
  final _formKey = GlobalKey<FormState>();


   TextEditingController _title=TextEditingController();
   TextEditingController _description=TextEditingController();
   TextEditingController _authorId=TextEditingController();
   TextEditingController _authorName=TextEditingController();
  late DateTime _publishedDate;
  final BlogService blogService = BlogService();
  File? _imageFile;
  final List<String> categoryList = [
    "All",
    "Climate Foresight",
    "Sustainability at Work",
    "Planet-Friendly living",
    "Offsetting",
    "News",
  ];
  String? slectedCategory="All";

  int? _status;

  var id;
  var name;
  getdata() async{

    SharedPreferences _pref=await SharedPreferences.getInstance();

    id=await  _pref.getString('id');
    name=await  _pref.getString('name');

    print(id);
    print(name);

    setState(() {

    });




  }



  @override
  void initState() {
    super.initState();

    getdata();
    Future.delayed(Duration(seconds: 2),(){

      if (widget.blog != null) {
        _title.text = widget.blog!.title;
        _description.text = widget.blog!.description;
        _authorId.text = widget.blog!.authorId;
        _authorName.text = widget.blog!.authorName;
        _publishedDate = widget.blog!.publishedDate;
        slectedCategory=widget.blog!.category;

      } else {
        _title.text ="";
        _description.text = '';
        _authorId.text = id;
        _authorName.text = name;
        _publishedDate = DateTime.now();
         slectedCategory="All";

      }
    });
  }



  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.blog != null ? 'Edit Blog' : 'Create Blog'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // if (_imageFile != null)
                //   Image.file(_imageFile!),
                SizedBox(height: 10),
                // ElevatedButton(
                //   onPressed: _pickImage,
                //   child: Text('Pick Image'),
                // ),
                TextFormField(

                  controller: _title,
                  decoration: InputDecoration(labelText: 'Title'),
                  onSaved: (value) => _title.text = value!,
                  validator: (value) => value!.isEmpty ? 'Please enter a title' : null,
                ),
                TextFormField(
                 controller: _description,
                  decoration: InputDecoration(labelText: 'Description'),
                  onSaved: (value) => _description.text = value!,
                  validator: (value) => value!.isEmpty ? 'Please enter a description' : null,
                ),
                TextFormField(
                  readOnly: true,
                  controller: _authorId,
                  decoration: InputDecoration(labelText: 'Author ID'),
                  onSaved: (value) => _authorId.text = value!,
                  validator: (value) => value!.isEmpty ? 'Please enter an author ID' : null,
                ),
                TextFormField(
                  readOnly: true,
                  controller: _authorName,
                  decoration: InputDecoration(labelText: 'Author Name'),
                  onSaved: (value) => _authorName.text = value!,
                  validator: (value) => value!.isEmpty ? 'Please enter an author name' : null,
                ),

                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Category'),
                  value:slectedCategory,
                  items: categoryList.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      slectedCategory = value!;
                    });
                  },
                  validator: (value) => value == null ? 'Please select a category' : null,
                ),
                SizedBox(height: 20),
                TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green[400]),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ))
                  ),
                  onPressed: _saveForm,
                  child: Text('           Save           ',
                  style: TextStyle(color: Colors.white70),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Blog blog = Blog(
        id: widget.blog?.id,
        title: _title.text!,
        description: _description.text!,
        authorId: _authorId.text!,
        authorName: _authorName.text!,
        publishedDate: _publishedDate,
        status: 1,
        category: slectedCategory
        // imageUrl: widget.blog?.imageUrl,
      );
      if (widget.blog != null) {
        blogService.updateBlog(blog, _imageFile);
      } else {
        blogService.createBlog(blog, _imageFile);
      }
      Navigator.pop(context);
    }
  }
}
