import 'package:dyslexia_app/core/database/api/end_points.dart';
import 'package:dyslexia_app/core/database/cache/cache_helper.dart';
import 'package:dyslexia_app/core/routes/app_routes.dart';
import 'package:dyslexia_app/core/service/service_locator.dart';
import 'package:dyslexia_app/core/utils/app_assets.dart';
import 'package:dyslexia_app/core/utils/app_colors.dart';
import 'package:dyslexia_app/core/utils/commons.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    navigateAfterThreeSeconds();
    super.initState();
  }

  void navigateAfterThreeSeconds() {
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      await sl<CacheHelper>().getData(
        key: ApiKeys.id,
      ) == null
          ? navigate(context: context, route: Routes.onBoarding)
      // hom on down
          : navigate(context: context, route: Routes.home);
    });

    debugPrint(sl<CacheHelper>().getData(
      key: ApiKeys.id,
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration:  BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  AppColors.primary.withOpacity(0.4),
                  AppColors.primary.withOpacity(0.4),
                  AppColors.primary,
                  AppColors.primary,
                  AppColors.primary,
                ])),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            Image.asset(AppAssets.appLogo),



          ],


        ),
      ),
    );
  }
}
