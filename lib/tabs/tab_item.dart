import 'package:flutter/material.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/theme/app_color.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  Sources sources;
  TabItem({required this.sources, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: isSelected ? AppColor.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColor.primaryColor,
          width: 2,
        )
      ),
      child: Text(sources.name?? "",
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: isSelected ? AppColor.whiteColor : AppColor.primaryColor,
      ),
      ),
    );
  }
}
