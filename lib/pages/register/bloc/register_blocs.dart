
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/register/bloc/register_events.dart';
import 'package:ulearning_app/pages/register/bloc/register_states.dart';

class RegisterBlocs extends Bloc<RegisterEvent, RegisterStates>{
  RegisterBlocs() : super(const RegisterStates()){
    on<UsernameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<ConfirmPasswordEvent>(_confirmPasswordEvent);
    on<ShowPasswordEvent>(_showPasswordEvent);
    on<ShowConfirmPasswordEvent>(_showConfirmPasswordEvent);
  }

  void _userNameEvent(UsernameEvent event, Emitter<RegisterStates> emit){
    debugPrint('UserName: ${event.userName}');
    emit(state.copyWith(userName: event.userName));
  }
  void _emailEvent(EmailEvent event, Emitter<RegisterStates> emit){
    debugPrint('Email: ${event.email}');
    emit(state.copyWith(email: event.email));
  }
  void _passwordEvent(PasswordEvent event, Emitter<RegisterStates> emit){
    debugPrint('Password: ${event.password}');
    emit(state.copyWith(password: event.password));
  }
  void _confirmPasswordEvent(ConfirmPasswordEvent event, Emitter<RegisterStates> emit){
    debugPrint('ConfirmPassword: ${event.confirmPassword}');
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }
  void _showPasswordEvent(ShowPasswordEvent event, Emitter<RegisterStates> emit){
    emit(state.copyWith(showPassword: !state.showPassword));
  }
  void _showConfirmPasswordEvent(ShowConfirmPasswordEvent event, Emitter<RegisterStates> emit){
    emit(state.copyWith(showConfirmPassword: !state.showConfirmPassword));
  }
}