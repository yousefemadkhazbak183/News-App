import 'package:flutter/material.dart';
import 'package:news_app/home/category/category.dart';
import 'package:news_app/home/category/category_details_view_model.dart';
import 'package:news_app/tabs/tabs_widget.dart';
import 'package:news_app/theme/app_color.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  Category category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSource(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CategoryDetailsViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.errorMessage != null) {
            return Column(
              children: [
                Text(viewModel.errorMessage!),
                ElevatedButton(
                    onPressed: () {
                      viewModel.getSource(widget.category.id);
                      setState(() {});
                    },
                    child: const Text('Try Again')),
              ],
            );
          } else if (viewModel.sourcesList == null) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColor.primaryColor,
            ));
          } else {
            return TabsWidget(
              sourcesList: viewModel.sourcesList!,
            );
          }
        },
      ),

      //FutureBuilder<SourceResponse?>(
      //     future: ApiManager.getSources(widget.category.id),
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return const Center(
      //             child: CircularProgressIndicator(
      //           color: AppColor.primaryColor,
      //         ));
      //       } else if (snapshot.hasError) {
      //         return Column(
      //           children: [
      //             const Text('Something went error'),
      //             ElevatedButton(
      //                 onPressed: () {
      //                   ApiManager.getSources(widget.category.id);
      //                   setState(() {});
      //                 },
      //                 child: const Text('Try Again')),
      //           ],
      //         );
      //       }
      //
      //       /// server (response) => (success) , (error)
      //       if (snapshot.data!.status != 'ok') {
      //         return Column(
      //           children: [
      //             Text(snapshot.data!.message!),
      //             ElevatedButton(
      //                 onPressed: () {
      //                   ApiManager.getSources(widget.category.id);
      //                 },
      //                 child: const Text('Try Again')),
      //           ],
      //         );
      //       }
      //       // success
      //       var sourceList = snapshot.data!.sources!;
      //       return TabsWidget(
      //         sourcesList: sourceList,
      //       );
      //     }),
    );
  }
}
