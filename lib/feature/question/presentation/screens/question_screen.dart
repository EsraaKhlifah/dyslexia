import 'package:dyslexia_app/core/routes/app_routes.dart';
import 'package:dyslexia_app/core/utils/app_colors.dart';
import 'package:dyslexia_app/core/utils/commons.dart';
import 'package:dyslexia_app/core/widget/custom_button.dart';
import 'package:dyslexia_app/core/widget/question_button.dart';
import 'package:dyslexia_app/feature/question/presentation/cubits/question_cubit.dart';
import 'package:dyslexia_app/feature/question/presentation/cubits/question_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionScreen extends StatelessWidget {
   QuestionScreen({super.key});

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<QuestionCubit,QuestionState>(
        listener: (context,state){
          if (state is GetAllQuestionQuestionSuccess) {
            showToast(
              message: ' Successfully',
              state: ToastState.success,
            );
            // navigateReplacement(
            //   context: context,
            //   route: Routes.home,
            // );
          }
          if (state is GetAllQuestionQuestionError) {
            showToast(
              message: 'Error ',
              state: ToastState.error,
            );
          }
        },
        builder: (context,state) {
          final cubit = BlocProvider.of<QuestionCubit>(context);
          return Scaffold(
            body: state is GetAllQuestionQuestionLoading
            ? const Center(child: CircularProgressIndicator()) :Padding(
              padding: const EdgeInsets.all(12.0),
              child: PageView.builder(
                controller: controller,
                itemCount: cubit.questions.length,
                itemBuilder: (BuildContext context, int index) {
                  cubit.answer = cubit.questions[index].answer ;
                  print(cubit.answer.toString());
                  return Column(
                    children: [
                      cubit.questions[index].image != '' ?
                      Container(
                        width: double.infinity,
                        height: 330.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Image.network(
                          cubit.questions[index].image,
                          width: 330.w,
                        ),
                      ) :  SizedBox(
                        height: 180.h,
                      ),

                      Text(
                        cubit.questions[index].question,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme.displayMedium!
                            .copyWith(color: AppColors.black,
                            fontSize: 25.sp
                          //fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(
                        height: 45.h,
                      ),

                      QuestionButton(
                        check: cubit.chooseOne,
                        background: const Color(0xff30B0C7),
                        onPressed: (){
                          cubit.changeChooseOne();
                          cubit.answerUser(cubit.questions[index].choices[0]);
                        },
                        text: cubit.questions[index].choices[0],
                      ),

                      SizedBox(
                        height: 15.h,
                      ),

                      QuestionButton(
                        check: cubit.chooseTwo,
                        background: const Color(0xffE35454),
                        onPressed: (){

                          cubit.changeChooseTwo();
                          cubit.answerUser(cubit.questions[index].choices[1]);

                        },
                        text: cubit.questions[index].choices[1],
                      ),

                      SizedBox(
                        height: 15.h,
                      ),

                      cubit.questions[index].choices.length > 2 ?
                      QuestionButton(
                        check: cubit.chooseThree,
                        background: const Color(0xffFF9500),
                        onPressed: (){
                          cubit.changeChooseThree();
                          cubit.answerUser(cubit.questions[index].choices[2]);

                        },
                        text: cubit.questions[index].choices[2],
                      ) : const SizedBox(),

                      SizedBox(
                        height: 60.h,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          // index != 0 ?
                          // CustomButton(
                          //   width: 120.w,
                          //   onPressed: () {
                          //     controller.jumpToPage(index-1);
                          //   },
                          //   text: 'Back',
                          // ) : const SizedBox(),


                          const SizedBox(),
                          CustomButton(
                            width: 120.w,
                            onPressed: () {

                              if(index+1 >= cubit.questions.length.toInt()){
                                navigateReplacement(
                                  context: context,
                                  route: Routes.showResultScreen,
                                );

                              }else{

                                cubit.chooseOne = false;
                                cubit.chooseTwo = false;
                                cubit.chooseThree = false;
                                cubit.Score();
                                controller.nextPage(
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                );
                              }

                            },
                            text: 'Next',
                          ),


                        ],
                      ),


                    ],
                  );
                },
              ),
            ),
          );
        }
      ),
    );
  }
}
