import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/register/bloc/register_blocs.dart';
import 'package:ulearning_app/pages/register/bloc/register_events.dart';
import 'package:ulearning_app/pages/register/bloc/register_states.dart';
import 'package:ulearning_app/pages/register/register_controller.dart';

import '../../common/widgets/common_widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBlocs,RegisterStates>(builder: (context, state){
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(context, "Register"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Center(

                      child: reusableText(
                          "Enter your details below & free sign up")),
                  Container(
                    margin: EdgeInsets.only(top: 30.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        reusableText("User name"),
                        SizedBox(height: 5.h),
                        reusableTextField(
                            "Enter your user name", "UserName", "user", (value) {
                          context.read<RegisterBlocs>().add(UsernameEvent(value));
                        }),
                        reusableText("Email"),
                        SizedBox(height: 5.h),
                        reusableTextField("Enter your email", "Email", "user",
                                (value) {
                              context.read<RegisterBlocs>().add(EmailEvent(value));
                            }),
                        reusableText("Password"),
                        SizedBox(height: 5.h),
                        reusableTextField(
                            "Enter your password", "Password", "lock",
                            isPassword: true,
                            showPassword: state.showPassword,
                            toggleShowPassword: (){
                              context.read<RegisterBlocs>().add(const ShowPasswordEvent());
                            }, (value) {
                          context.read<RegisterBlocs>().add(PasswordEvent(value));
                        }),
                        reusableText("Confirm Password"),
                        SizedBox(height: 5.h),
                        reusableTextField(
                            "Enter your Confirm Password",
                            "confirmPassword",
                            "lock",
                            isPassword: true,
                            showPassword: state.showConfirmPassword,
                            toggleShowPassword: (){
                              context.read<RegisterBlocs>().add(const ShowConfirmPasswordEvent());
                            },
                                (value) {
                              context.read<RegisterBlocs>().add(ConfirmPasswordEvent(value));
                            }),
                        buildLogInAndRegButton("Sign Up", () {
                          RegisterController(context: context).handleEmailRegister();
                        }),
                        SizedBox(height: 20.h),
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
