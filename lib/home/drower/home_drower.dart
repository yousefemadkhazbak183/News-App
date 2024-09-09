import 'package:flutter/material.dart';
import 'package:news_app/theme/app_color.dart';

class HomeDrower extends StatelessWidget {
  static const int categories = 1;
  static const int settings = 2;
  Function onSideMenuItem;

  HomeDrower({required this.onSideMenuItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.12),
          width: double.infinity,
          //height: MediaQuery.of(context).size.height * 0.12,
          color: AppColor.primaryColor,
          child: Text(
            'News App',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              onSideMenuItem(HomeDrower.categories);
            },
            child: Row(
              children: [
                Icon(
                  Icons.list,
                  size: 35,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Text(
                  'Categoris',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(7.0),
          child: InkWell(
            onTap: () {
              onSideMenuItem(HomeDrower.settings);
            },
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  size: 35,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Text(
                  'Settings',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
