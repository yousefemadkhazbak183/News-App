import 'package:flutter/material.dart';
import 'package:news_app/home/news/new_widget.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/tabs/tab_item.dart';

class TabsWidget extends StatefulWidget {
  List<Sources> sourcesList;

  TabsWidget({
    required this.sourcesList
});

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
              tabAlignment: TabAlignment.start,
              isScrollable: true ,
                onTap: (index){
                selectedIndex = index;
                setState(() {

                });
                },
                indicatorColor: Colors.transparent,
                tabs: widget.sourcesList.map((sources)=> TabItem(sources: sources,
                    isSelected: selectedIndex == widget.sourcesList.indexOf(sources))).toList()
            ),
            Expanded(
                child: NewWidget(sourceId: widget.sourcesList[selectedIndex])),
          ],
        )
    );
  }
}
