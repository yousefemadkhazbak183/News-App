import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/NewResponse.dart';
import 'package:news_app/theme/app_color.dart';

class NewsItem extends StatelessWidget {
  Articles articles;

  NewsItem({required this.articles});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              fit: BoxFit.fill,
              imageUrl: articles.urlToImage ?? "",
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                color: AppColor.primaryColor,
              )),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(height: 10),
          Text(
            articles.author ?? "",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 10),
          Text(
            articles.title ?? "",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            articles.publishedAt ?? "",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
