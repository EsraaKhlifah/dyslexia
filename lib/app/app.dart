import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/bloc/cubit/global_cubit.dart';
import '../core/bloc/cubit/global_state.dart';
import '../core/routes/app_routes.dart';
import '../core/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context,state){
        return BlocBuilder<GlobalCubit,GlobalState>(
          builder: (context,build){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Dyslexia App',
              theme: getAppTheme(),
              initialRoute: Routes.intitlRoute,
              onGenerateRoute: AppRoutes.generateRoute,
            );
          }
        );
      },
    );
  }
}
