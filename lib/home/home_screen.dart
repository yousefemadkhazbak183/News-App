import 'package:flutter/material.dart';
import 'package:news_app/home/category/category.dart';
import 'package:news_app/home/category/category_details.dart';
import 'package:news_app/home/category/category_fragment.dart';
import 'package:news_app/home/drower/home_drower.dart';
import 'package:news_app/settings/settings_tab.dart';
import 'package:news_app/theme/app_color.dart';

class HomeScreen extends StatefulWidget {
  static const String routeHome = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColor.whiteColor,
          child: Image.asset(
            'assets/images/main_background.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              selectedSideMenuItem == HomeDrower.settings
                  ? 'Settings'
                  : selectedCategory == null
                      ? 'News App'
                      : selectedCategory!.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          drawer: Drawer(
            child: HomeDrower(
              onSideMenuItem: onSideMenuItemClicked,
            ),
          ),
          body: selectedSideMenuItem == HomeDrower.settings
              ? SettingsTab()
              : selectedCategory == null
                  ? CategoryFragment(
                      onCategoryItemClicked: onCategoryItemClicked,
                    )
                  : CategoryDetails(
                      category: selectedCategory!,
                    ),
        ),
      ],
    );
  }

  Category? selectedCategory;

  void onCategoryItemClicked(Category newCategory) {
    selectedCategory = newCategory;
    setState(() {});
  }

  int selectedSideMenuItem = HomeDrower.categories;

  void onSideMenuItemClicked(int newSideMenuItem) {
    selectedSideMenuItem = newSideMenuItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
