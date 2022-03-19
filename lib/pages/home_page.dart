import 'package:flutter/material.dart';
import 'package:news_app/cards/news_card.dart';
import 'package:news_app/constants/strings.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/services/api_manager.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<NewsModel> _news;
  var _locale = Strings.locale;
  var _title = (Strings.locale == 'english') ? "News App" : 'समाचार';

  void toggleLocale() {
    _locale = (_locale == 'english') ? 'hindi' : 'english';
    Strings.locale = _locale;
  }

  @override
  void initState() {
    _news = API_Manager().fetchNews(_locale);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          titleTextStyle: const TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 22),
          centerTitle: true,
          title: Text(_title),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    toggleLocale();
                    //Navigator.pushNamed(context, "/");
                    Navigator.popAndPushNamed(context, "/");
                  },
                  child: Icon(Icons.language),
                )),
          ],
          actionsIconTheme:
              IconThemeData(size: 30.0, color: Colors.black, opacity: 10.0),
        ),
        body: FutureBuilder<NewsModel>(
            future: _news,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.news.length,
                    itemBuilder: (context, index) {
                      var newsItem = snapshot.data?.news[index];

                      return NewsCard(news: newsItem);
                    });
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
