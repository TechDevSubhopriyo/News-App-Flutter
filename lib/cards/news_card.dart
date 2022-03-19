import 'package:flutter/material.dart';

import '../models/news_model.dart';

class NewsCard extends StatefulWidget {
  var news;
  NewsCard({Key? key, required this.news}) : super(key: key);

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  News? newsItem;
  @override
  void initState() {
    newsItem = widget.news;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/news", arguments: newsItem);
      },
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: EdgeInsets.zero,
        height: 320,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 216, 216, 216),
                offset: Offset(4, 4),
                blurRadius: 8.0,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ),
            ]),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                child: Image.network(newsItem?.image ?? '', fit: BoxFit.fill,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                  return const FlutterLogo();
                }),
              )),
              Center(
                child: Padding(
                  child: Text(
                    newsItem?.title ?? '',
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  padding: const EdgeInsets.all(8),
                ),
              ),
              Padding(
                child: Text(
                  newsItem?.description ?? '',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.fade,
                ),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 8),
              ),
              Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Published on ${newsItem?.publishedDate}",
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                    ),
                  ))
            ]),
      ),
    );
  }
}
