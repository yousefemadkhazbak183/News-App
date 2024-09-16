import 'package:news_app/model/NewResponse.dart';

abstract class SourcesNewsStates {}

class LoadingNewsStates extends SourcesNewsStates {}

class ErrorNewsStates extends SourcesNewsStates {
  String errorMessage;

  ErrorNewsStates({required this.errorMessage});
}

class SuccessNewsState extends SourcesNewsStates {
  List<Articles> newsList;

  SuccessNewsState({required this.newsList});
}
