import 'dart:ui';

import 'package:news_app/theme/app_color.dart';

class Category {
  String id;
  String imagePath;
  String title;
  Color color;

  Category(
      {required this.id,
      required this.imagePath,
      required this.color,
      required this.title});

  /*
  ,  entertainment general    technology
   */

  static List<Category> categoryList() {
    return [
      Category(
          id: 'general',
          imagePath: 'assets/images/Politics.png',
          color: AppColor.darkBlueColor,
          title: 'General'),
      Category(
          id: 'sports',
          imagePath: 'assets/images/ball.png',
          color: AppColor.redColor,
          title: 'Sports'),
      Category(
          id: 'health',
          imagePath: 'assets/images/health.png',
          color: AppColor.pinkColor,
          title: 'Health'),
      Category(
          id: 'business',
          imagePath: 'assets/images/bussines.png',
          color: AppColor.brownColor,
          title: 'Business'),
      Category(
          id: 'science',
          imagePath: 'assets/images/science.png',
          color: AppColor.yellowColor,
          title: 'Science'),
      Category(
          id: 'entertainment',
          imagePath: 'assets/images/environment.png',
          color: AppColor.blueColor,
          title: 'Entertainment'),
    ];
  }
}
