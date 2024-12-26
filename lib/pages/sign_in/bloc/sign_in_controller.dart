import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/values/constant.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_blocs.dart';

import '../../../common/exceptions/firebase_auth_exceptions.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        //BlocProvider.of<SignInBlocs>(context).state;
        final state = context.read<SignInBlocs>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {

        toastInfo(message: "You need to fill email address");
        return;
        } 
        if (password.isEmpty) {
       toastInfo(message: "You need to fill password");
       return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if(credential.user == null){
         toastInfo(message: "You don't exist");

         return;
          }
          if(!credential.user!.emailVerified){
            toastInfo(message: "You need to verify your email account");
            return;
          }
          var user = credential.user!;
         Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY, '123456789');
         Navigator.of(context).pushNamedAndRemoveUntil("/application", (route) => false);
       
                } on FirebaseAuthException catch (e) {
          toastInfo(message :TFirebaseAuthException(e.code).message);
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
