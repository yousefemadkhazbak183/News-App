import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/category/cubit/sources_states.dart';
import 'package:news_app/model/api_manager.dart';

class CategoryDetailsBloc extends Cubit<SourcesStates> {
  CategoryDetailsBloc() : super(LoadingStates());

  void getSources(String categoryId) async {
    try {
      emit(LoadingStates());
      var response = await ApiManager.getSources(categoryId);
      if (response?.status == 'error') {
        emit(ErrorStates(errorMessage: response!.message!));
        return;
      }
      if (response?.status == 'ok') {
        emit(SuccessStates(sourceList: response!.sources!));
        return;
      }
    } catch (e) {
      emit(ErrorStates(errorMessage: e.toString()));
    }
  }
}
