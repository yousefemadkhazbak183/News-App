import 'package:news_app/model/SourceResponse.dart';

abstract class SourcesStates {}

class InitialStates extends SourcesStates {}

class LoadingStates extends SourcesStates {}

class ErrorStates extends SourcesStates {
  String errorMessage;

  ErrorStates({required this.errorMessage});
}

class SuccessStates extends SourcesStates {
  List<Sources> sourceList;

  SuccessStates({required this.sourceList});
}
