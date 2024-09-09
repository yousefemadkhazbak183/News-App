import 'package:flutter/material.dart';
import 'package:news_app/home/home_news/news_item.dart';
import 'package:news_app/model/NewResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/api_manager.dart';
import 'package:news_app/theme/app_color.dart';

class NewWidget extends StatefulWidget {
  Sources sourceId;

  NewWidget({required this.sourceId});

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewResponse?>(
        future: ApiManager.getNewsBySourceId(widget.sourceId.id ?? ""),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.primaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text('Something Error'),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewsBySourceId(widget.sourceId.id ?? '');
                      setState(() {});
                    },
                    child: Text('Try Again')),
              ],
            );
          }
          if (snapshot.data!.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewsBySourceId(widget.sourceId.id ?? "");
                      setState(() {});
                    },
                    child: const Text('Try Again')),
              ],
            );
          }
          var listNews = snapshot.data!.articles!;
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(articles: listNews[index]);
            },
            itemCount: listNews.length,
          );
        });
  }
}
