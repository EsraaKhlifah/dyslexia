import 'package:dartz/dartz.dart';
import 'package:dyslexia_app/core/database/api/api_consumer.dart';
import 'package:dyslexia_app/core/database/api/end_points.dart';
import 'package:dyslexia_app/core/error/exceptions.dart';
import 'package:dyslexia_app/feature/auth/data/models/login_model.dart';

import '../../../../core/service/service_locator.dart';

class AuthRepository {

  // login ..
  Future<Either<String,LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(EndPoint.signIn, data: {
        ApiKeys.email: email,
        ApiKeys.password: password,
      });

      return Right(LoginModel.fromJson(response));
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }

  // login ..
  Future<Either<String,LoginModel>> signUp({
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(EndPoint.signUp, data: {
        ApiKeys.email: email,
        ApiKeys.password: password,
        ApiKeys.name: name,
        ApiKeys.phoneNumber: phoneNumber,
      });

      return Right(LoginModel.fromJson(response));
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }


  // send code ..
  Future<Either<String,String>> sendCode({
    required String email,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(EndPoint.sendCode, data: {
        ApiKeys.email: email,
      });

      return Right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }



  // reset password..
  Future<Either<String,String>> resetPassword({
    required String email,
    required String password,
    required String confirmPassword,
    required String code,
  }) async {
    try {
      final response = await sl<ApiConsumer>().patch(EndPoint.changeForgottenPassword, data: {
        ApiKeys.email: email,
        ApiKeys.password: password,
        ApiKeys.confirmPassword: confirmPassword,
        ApiKeys.code: code,
      });

      return Right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }





}
