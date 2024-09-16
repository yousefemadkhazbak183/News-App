import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/category/category.dart';
import 'package:news_app/home/category/cubit/category_details_bloc.dart';
import 'package:news_app/home/category/cubit/sources_states.dart';
import 'package:news_app/tabs/tabs_widget.dart';
import 'package:news_app/theme/app_color.dart';

class CategoryDetailsMvvmBloc extends StatefulWidget {
  Category category;

  CategoryDetailsMvvmBloc({required this.category});

  @override
  State<CategoryDetailsMvvmBloc> createState() =>
      _CategoryDetailsMvvmBlocState();
}

class _CategoryDetailsMvvmBlocState extends State<CategoryDetailsMvvmBloc> {
  CategoryDetailsBloc bloc = CategoryDetailsBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsBloc, SourcesStates>(
        bloc: bloc,
        builder: (context, state) {
          if (state is LoadingStates) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColor.primaryColor,
            ));
          } else if (state is ErrorStates) {
            return Column(
              children: [
                Text(state.errorMessage),
                ElevatedButton(
                    onPressed: () {
                      bloc.getSources(widget.category.id);
                    },
                    child: const Text('Try Again')),
              ],
            );
          } else if (state is SuccessStates) {
            return TabsWidget(
              sourcesList: state.sourceList,
            );
          }
          return Container();
        });
    // FutureBuilder<SourceResponse?>(
    //   future: ApiManager.getSources(widget.category.id),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(
    //           child: CircularProgressIndicator(
    //             color: AppColor.primaryColor,
    //           ));
    //     } else if (snapshot.hasError) {
    //       return Column(
    //         children: [
    //           const Text('Something went error'),
    //           ElevatedButton(
    //               onPressed: () {
    //                 ApiManager.getSources(widget.category.id);
    //                 setState(() {});
    //               },
    //               child: const Text('Try Again')),
    //         ],
    //       );
    //     }
    //
    //     /// server (response) => (success) , (error)
    //     if (snapshot.data!.status != 'ok') {
    //       return Column(
    //         children: [
    //           Text(snapshot.data!.message!),
    //           ElevatedButton(
    //               onPressed: () {
    //                 ApiManager.getSources(widget.category.id);
    //               },
    //               child: const Text('Try Again')),
    //         ],
    //       );
    //     }
    //     // success
    //     var sourceList = snapshot.data!.sources!;
    //     return TabsWidget(
    //       sourcesList: sourceList,
    //     );
    //   }
    //   );
  }
}
