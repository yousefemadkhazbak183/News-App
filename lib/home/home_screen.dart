import 'package:flutter/material.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/api_manager.dart';
import 'package:news_app/tabs/tabs_widget.dart';
import 'package:news_app/theme/app_color.dart';
import 'package:news_app/theme/my_theme_data.dart';

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
            title: Text('News App',
              style: Theme.of(context).textTheme.titleLarge,),
          ),
          body: FutureBuilder<SourceResponse?>(
              future: ApiManager.getSources(),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(
                    color: AppColor.primaryColor,
                  )
                  );
                }else if(snapshot.hasError){
                  return  Column(
                    children: [
                      Text('Something went error'),
                      ElevatedButton(onPressed: (){
                        ApiManager.getSources();
                        setState(() {

                        });
                      }, child: Text('Try Again')
                      ),
                    ],
                  );
                }
                /// server (response) => (success) , (error)
                if(snapshot.data!.status != 'ok'){
                  return  Column(
                    children: [
                      Text(snapshot.data!.message!),
                      ElevatedButton(onPressed: (){}, child: Text('Try Again')
                      ),
                    ],
                  );
                }
                // success
                var sourceList = snapshot.data!.sources!;
                return TabsWidget(sourcesList: sourceList,);
              }
          ),
        ),
      ],
    );
  }
}
