import 'dart:convert';

NewsModel welcomeFromJson(String str) => NewsModel.fromJson(json.decode(str));

String NewsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    required this.news,
  });

  List<News> news;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        news: List<News>.from(json["News"].map((x) => News.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "News": List<dynamic>.from(news.map((x) => x.toJson())),
      };
}

class News {
  News({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.publishedDate,
    required this.url,
  });

  String id;
  String title;
  String image;
  String description;
  DateTime publishedDate;
  String url;

  factory News.fromJson(Map<String, dynamic> json) => News(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        description: json["description"],
        publishedDate: DateTime.parse(json["published_date"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "description": description,
        "published_date":
            "${publishedDate.year.toString().padLeft(4, '0')}-${publishedDate.month.toString().padLeft(2, '0')}-${publishedDate.day.toString().padLeft(2, '0')}",
        "url": url,
      };
}
