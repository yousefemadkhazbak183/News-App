import 'package:flutter/material.dart';
import 'package:news_app/home/category/category.dart';
import 'package:news_app/home/category/category_item.dart';

class CategoryFragment extends StatelessWidget {
  var categorlist = Category.categoryList();
  Function onCategoryItemClicked;

  CategoryFragment({required this.onCategoryItemClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Pick your category\nof interest',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.13,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      onCategoryItemClicked(categorlist[index]);
                    },
                    child: CategoryItem(
                        category: categorlist[index], index: index));
              },
              itemCount: categorlist.length,
            ),
          )
        ],
      ),
    );
  }
}
