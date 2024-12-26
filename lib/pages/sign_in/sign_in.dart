import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_events.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_state.dart';
// import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widget.dart';
import '../../common/widgets/common_widgets.dart';
import 'bloc/sign_in_controller.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // bool showPassword = false;
  //
  // void toggleShowPassword() {
  //   setState(() {
  //     showPassword = !showPassword;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBlocs, SignInState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(context,"Log In"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPartyLogin(context),
                  SizedBox(height: 10.h),
                  Center(
                      child: reusableText("Or user your email account login")),
                  Container(
                    margin: EdgeInsets.only(top: 30.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("Email"),
                        SizedBox(height: 5.h),
                        reusableTextField("Enter your email", "Email", "user",
                             (value){
                          context.read<SignInBlocs>().add(EmailEvent(value));
                            }),
                        reusableText("Password"),
                        SizedBox(height: 5.h),
                        reusableTextField("Enter your password", "Password",
                            "lock",(value){
                              context.read<SignInBlocs>().add(PasswordEvent(value));
                            }, isPassword: true,
                            showPassword: state.showPassword,
                            toggleShowPassword: (){
                              context.read<SignInBlocs>().add(const ShowPasswordEvent());
                            }),
                        SizedBox(height: 10.h),
                        forgotPassword(),
                        buildLogInAndRegButton("Log In",(){
                         SignInController(context: context).handleSignIn("email");
                        }),
                        SizedBox(height: 10.h),
                        buildLogInAndRegButton("Sign Up", primary: false,(){
                          Navigator.of(context).pushNamed("/register");
                        }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
