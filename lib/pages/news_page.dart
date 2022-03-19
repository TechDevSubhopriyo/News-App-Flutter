import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    final newsItem = ModalRoute.of(context)!.settings.arguments as News;
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              child: Image.network(newsItem.image, fit: BoxFit.fill,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                return const FlutterLogo(
                  size: 200,
                );
              }),
            ),
            Center(
              child: Padding(
                child: Text(
                  newsItem.title,
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                padding: const EdgeInsets.all(8),
              ),
            ),
            Padding(
              child: Text(
                newsItem.description,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
              ),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 8),
            ),
          ]),
    ));
  }
}
