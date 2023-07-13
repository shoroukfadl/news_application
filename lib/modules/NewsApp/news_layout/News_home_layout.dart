import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/components.dart';
import '../../../shared/news_cubit/news_cubit.dart';
import '../../../shared/news_cubit/news_state.dart';
import '../search/Search.dart';


class NewsHomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
     listener: (context,state){},
      builder: (context,state){
       var cubit=NewsCubit.get(context);
       return Scaffold(appBar:
       AppBar(title: Text(
           'NewsApp'
       ),
         actions: [IconButton(onPressed:()
         {
           navigateTo(context, SearchScreen());
         },
             icon: Icon(Icons.search)),
         ],
       ),
         body: cubit.screens[cubit.currentIndex],
         bottomNavigationBar: BottomNavigationBar(
           currentIndex: cubit.currentIndex,
           onTap: (index){
           cubit.changeNavBar(index);
           },
           items: cubit.bottomVBINewsList,
         ),
       );
      },
    );
  }
}
