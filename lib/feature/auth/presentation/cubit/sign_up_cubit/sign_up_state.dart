abstract class SignUpState{}

final class SignUpInitial extends SignUpState{}

class SignUpLoadingState extends SignUpState{}
class SignUpSuccessState extends SignUpState{}
class SignUpErrorState extends SignUpState{
  String errorMS;
  SignUpErrorState({required this.errorMS});

}

class ChangeSignUpPasswordSuffixIcon extends SignUpState{}