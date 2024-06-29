
import 'package:dyslexia_app/feature/question/data/models/question.dart';
import 'package:dyslexia_app/feature/question/data/repository/question_repository.dart';
import 'package:dyslexia_app/feature/question/presentation/cubits/question_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit(this.questionRepository) : super(QuestionInitial());
  final QuestionRepository questionRepository;

  bool chooseOne = false;
  bool chooseTwo = false;
  bool chooseThree = false;
   changeChooseOne(){
     chooseOne = !chooseOne;
     chooseTwo = false;
     chooseThree = false;
    emit(ChangeChoose());
  }

  changeChooseTwo(){
    chooseTwo = !chooseTwo;
    chooseOne = false;
    chooseThree = false;
    emit(ChangeChoose());
  }
  changeChooseThree(){
    chooseThree = !chooseThree;
    chooseOne = false;
    chooseTwo = false;
    emit(ChangeChoose());
  }

  List<Question> questions = [];

  dynamic answer ;
  dynamic answerAA ;

  int score = 0;
  void answerUser(String ans){
    answerAA = ans;
  }

  void Score(){
    if(answer == answerAA){
      score +=1;
    }
    print(score.toString());
  }

  void getAllQuestion() async {
    emit(GetAllQuestionQuestionLoading());

    final res = await questionRepository.getQuestion();
    res.fold(
          (l) => emit(GetAllQuestionQuestionSuccess()),
          (r) {
            questions = r.questions ;
        emit(GetAllQuestionQuestionSuccess());

      },
    );
  }
}

