import 'package:dyslexia_app/core/database/api/end_points.dart';
import 'package:dyslexia_app/core/database/cache/cache_helper.dart';
import 'package:dyslexia_app/core/routes/app_routes.dart';
import 'package:dyslexia_app/core/service/service_locator.dart';
import 'package:dyslexia_app/core/utils/commons.dart';
import 'package:dyslexia_app/core/widget/custom_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Center(
              child: Text(
                'Home Screen'
              ),


            ),

            CustomButton(
              onPressed: (){

                sl<CacheHelper>().removeData(
                  key: ApiKeys.id,
                );
                navigateReplacement(context: context, route: Routes.login);
              },
              text: 'logout',
            ),
          ],
        ),
      ),
    );
  }
}
