import 'package:dyslexia_app/feature/auth/presentation/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:dyslexia_app/feature/auth/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'core/bloc/cubit/global_cubit.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/service/service_locator.dart';
import 'feature/auth/presentation/cubit/login_cubit/login_cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await sl<CacheHelper>().init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GlobalCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<LoginCubit>(),
        ),

        BlocProvider(
          create: (context) => sl<SignUpCubit>(),
        ),

        BlocProvider(
          create: (context) => sl<ForgetPasswordCubit>(),
        ),
        // BlocProvider(
        //   create: (context) => sl<ForgetPasswordCubit>(),
        // ),
        // BlocProvider(
        //   create: (context) => sl<HomeCubit>(),
        // ),
        // BlocProvider(
        //   create: (context) => sl<MenuCubit>()..getAllMeals(),
        // ),
      ],
      child: const MyApp(),
    ),
  );
}
