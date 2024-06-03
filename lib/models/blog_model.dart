class Blog {
  String? id;
  String title;
  String description;
  String authorId;
  String authorName;
  DateTime publishedDate;
 int? status;
  String? imageUrl;
  String?category;

  Blog({
    this.id,
    required this.title,
    required this.description,
    required this.authorId,
    required this.authorName,
    required this.publishedDate,
    required this.status,
    this.imageUrl,
    this.category
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'authorId': authorId,
      'authorName': authorName,
      'publishedDate': publishedDate.toIso8601String(),
      'status': status,
      'imageUrl': imageUrl,
      'category':category
    };
  }

  factory Blog.fromMap(Map<String, dynamic> map, String documentId) {
    return Blog(
      id: documentId,
      title: map['title'],
      description: map['description'],
      authorId: map['authorId'],
      authorName: map['authorName'],
      publishedDate: DateTime.parse(map['publishedDate']),
      status: map['status'],
      imageUrl: map['imageUrl'],
      category: map['category']
    );
  }
}
