import 'package:dyslexia_app/core/routes/app_routes.dart';
import 'package:dyslexia_app/core/utils/app_colors.dart';
import 'package:dyslexia_app/core/utils/commons.dart';
import 'package:dyslexia_app/core/widget/back_widget.dart';
import 'package:dyslexia_app/feature/question/presentation/cubits/question_cubit.dart';
import 'package:dyslexia_app/feature/question/presentation/cubits/question_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowResultScreen extends StatelessWidget {
  const ShowResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<QuestionCubit,QuestionState>(
        builder: (context,state) {
          final cubit = BlocProvider.of<QuestionCubit>(context);
          return Scaffold(
            backgroundColor: AppColors.primary,
            body: Column(
              children: [
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                      child: BackWidget(
                        onTap: (){
                          cubit.score = 0;
                          navigateReplacement(context: context, route: Routes.home);
                        },
                      ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Other Behavioral \n/Cognitive Tests Result',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme.displayMedium!
                      .copyWith(
                    fontSize: 30,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 600.h,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                    ),
                  ),
                  child: cubit.score >= 7 ? Text(
                    'Normal',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme.displayMedium!
                        .copyWith(
                      fontSize: 35,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    )) : Text(
                    'ab Normal',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme.displayMedium!
                        .copyWith(
                      fontSize: 35,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ) ,
                ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
