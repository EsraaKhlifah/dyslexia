
import 'package:dartz/dartz.dart';
import 'package:dyslexia_app/core/database/api/api_consumer.dart';
import 'package:dyslexia_app/core/database/api/end_points.dart';
import 'package:dyslexia_app/feature/question/data/models/question.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/service/service_locator.dart';

class QuestionRepository {

  //get meal
  Future<Either<String, QuestionList>> getQuestion() async {
    try {
      final response = await sl<ApiConsumer>().get(
        EndPoint.question,
      );
      return Right(QuestionList.fromJson(response));
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }
}
