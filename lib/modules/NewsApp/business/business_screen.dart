import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/shared/components/components.dart';

import '../../../shared/news_cubit/news_cubit.dart';
import '../../../shared/news_cubit/news_state.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
    listener: (context,state){},
    builder: (context,state){
      List businessList=NewsCubit.get(context).business;
      return articleBuilder(businessList,context,itemCount:10);
    },
    );
  }
}
