import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_application/modules/NewsApp/news_layout/News_home_layout.dart';
import 'package:news_application/shared/network/local/cash_helper.dart';
import 'package:news_application/shared/network/remote/dio_helper.dart';
import 'package:news_application/shared/news_cubit/news_cubit.dart';
import 'package:news_application/shared/news_cubit/news_state.dart';
import 'shared/components/bloc_observer.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  Bloc.observer = MyBlocObserver();
  DioHelper.init();
 await CashHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      BlocProvider (create: (context) =>
      NewsCubit(NewsInitialState())..getBusiness()..getSports()..getScience(), ) ,
      ],
      child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: NewsHomeLayout()
          )
    );

  }

}
