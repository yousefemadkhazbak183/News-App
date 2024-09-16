import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/news/cubit/sources_news_states.dart';
import 'package:news_app/model/api_manager.dart';

class NewsWidgetCubit extends Cubit<SourcesNewsStates> {
  NewsWidgetCubit() : super(LoadingNewsStates());

  void getNewsSources(String sourceId) async {
    try {
      emit(LoadingNewsStates());
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if (response?.status == 'error') {
        emit(ErrorNewsStates(errorMessage: response!.message!));
      } else if (response?.status == 'ok') {
        emit(SuccessNewsState(newsList: response!.articles!));
      }
    } catch (e) {
      emit(ErrorNewsStates(errorMessage: e.toString()));
    }
  }
}
