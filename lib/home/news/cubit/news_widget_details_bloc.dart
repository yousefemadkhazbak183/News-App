import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/news/cubit/news_widget_cubit.dart';
import 'package:news_app/home/news/cubit/sources_news_states.dart';
import 'package:news_app/home/news/news_item.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/theme/app_color.dart';

class NewsWidgetDetailsBloc extends StatefulWidget {
  Sources sourcesId;

  NewsWidgetDetailsBloc({required this.sourcesId});

  @override
  State<NewsWidgetDetailsBloc> createState() => _NewsWidgetDetailsBlocState();
}

class _NewsWidgetDetailsBlocState extends State<NewsWidgetDetailsBloc> {
  NewsWidgetCubit bloc = NewsWidgetCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.getNewsSources(widget.sourcesId.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsWidgetCubit, SourcesNewsStates>(
        bloc: bloc,
        builder: (context, states) {
          if (states is LoadingNewsStates) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.primaryColor,
              ),
            );
          } else if (states is ErrorNewsStates) {
            return Column(
              children: [
                Text(states.errorMessage),
                ElevatedButton(
                    onPressed: () {
                      bloc.getNewsSources(widget.sourcesId.id ?? "");
                    },
                    child: const Text('Try Again')),
              ],
            );
          } else if (states is SuccessNewsState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return NewsItem(articles: states.newsList[index]);
              },
              itemCount: states.newsList.length,
            );
          }
          return Container();
        });

    // FutureBuilder<NewResponse?>(
    //   future: ApiManager.getNewsBySourceId(widget.sourcesId.id ?? ""),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(
    //           color: AppColor.primaryColor,
    //         ),
    //       );
    //     } else if (snapshot.hasError) {
    //       return Column(
    //         children: [
    //           Text('Something Error'),
    //           ElevatedButton(
    //               onPressed: () {
    //                 ApiManager.getNewsBySourceId(widget.sourcesId.id ?? '');
    //                 setState(() {});
    //               },
    //               child: Text('Try Again')),
    //         ],
    //       );
    //     }
    //     if (snapshot.data!.status != 'ok') {
    //       return Column(
    //         children: [
    //           Text(snapshot.data!.message!),
    //           ElevatedButton(
    //               onPressed: () {
    //                 ApiManager.getNewsBySourceId(widget.sourcesId.id ?? "");
    //                 setState(() {});
    //               },
    //               child: const Text('Try Again')),
    //         ],
    //       );
    //     }
    //     var listNews = snapshot.data!.articles!;
    //     return ListView.builder(
    //       itemBuilder: (context, index) {
    //         return NewsItem(articles: listNews[index]);
    //       },
    //       itemCount: listNews.length,
    //     );
    //   });
  }
}
