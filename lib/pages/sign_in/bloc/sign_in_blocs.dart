
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_events.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_state.dart';

class SignInBlocs extends Bloc<SignInEvents, SignInState>{
  SignInBlocs() : super(const SignInState()){
    on<EmailEvent>(_onEmailEvent);
    on<PasswordEvent>(_onPasswordEvent);
    on<ShowPasswordEvent>(_onShowPasswordEvent);
  }
  void _onEmailEvent(EmailEvent event, Emitter<SignInState> emit) {

    emit(state.copyWith(email: event.email));
  }
  void _onPasswordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(password: event.password));
  }
  void _onShowPasswordEvent(ShowPasswordEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

}