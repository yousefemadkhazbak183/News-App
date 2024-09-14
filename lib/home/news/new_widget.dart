import 'package:flutter/material.dart';
import 'package:news_app/home/news/news_item.dart';
import 'package:news_app/home/news/news_widget_view_model.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/theme/app_color.dart';
import 'package:provider/provider.dart';

class NewWidget extends StatefulWidget {
  Sources sourceId;

  NewWidget({required this.sourceId});

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  NewsWidgetViewModel viewModel = NewsWidgetViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNews(widget.sourceId.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<NewsWidgetViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.errorMessage != null) {
              return Column(
                children: [
                  Text(viewModel.errorMessage!),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.getNews(widget.sourceId.id ?? '');
                      },
                      child: const Text('Try Again')),
                ],
              );
            } else if (viewModel.newsList == null) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColor.primaryColor,
                ),
              );
            } else {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return NewsItem(articles: viewModel.newsList![index]);
                },
                itemCount: viewModel.newsList!.length,
              );
            }
          },
        )

        // FutureBuilder<NewResponse?>(
        //     future: ApiManager.getNewsBySourceId(widget.sourceId.id ?? ""),
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return const Center(
        //           child: CircularProgressIndicator(
        //             color: AppColor.primaryColor,
        //           ),
        //         );
        //       } else if (snapshot.hasError) {
        //         return Column(
        //           children: [
        //             Text('Something Error'),
        //             ElevatedButton(
        //                 onPressed: () {
        //                   ApiManager.getNewsBySourceId(widget.sourceId.id ?? '');
        //                   setState(() {});
        //                 },
        //                 child: Text('Try Again')),
        //           ],
        //         );
        //       }
        //       if (snapshot.data!.status != 'ok') {
        //         return Column(
        //           children: [
        //             Text(snapshot.data!.message!),
        //             ElevatedButton(
        //                 onPressed: () {
        //                   ApiManager.getNewsBySourceId(widget.sourceId.id ?? "");
        //                   setState(() {});
        //                 },
        //                 child: const Text('Try Again')),
        //           ],
        //         );
        //       }
        //       var listNews = snapshot.data!.articles!;
        //       return ListView.builder(
        //         itemBuilder: (context, index) {
        //           return NewsItem(articles: listNews[index]);
        //         },
        //         itemCount: listNews.length,
        //       );
        //   }
        //     ),
        );
  }
}
