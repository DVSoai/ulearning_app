import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';

import '../../common/exceptions/firebase_auth_exceptions.dart';
import 'bloc/register_blocs.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBlocs>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String confirmPassword = state.confirmPassword;
    if (userName.isEmpty) {
      toastInfo(message: "Username can't be empty");
    }
    if (email.isEmpty) {
      toastInfo(message: "Email can't be empty");
    }
    if (password.isEmpty) {
      toastInfo(message: "Password can't be empty");
    }
    if (confirmPassword.isEmpty) {
      toastInfo(message: "Confirm Password can't be empty");
    }
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
       await credential.user?.sendEmailVerification();
       await credential.user?.updateDisplayName(userName);
        toastInfo(message: "Please verify your email address");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      toastInfo(message: TFirebaseAuthException(e.code).message);
    }
  }
}
