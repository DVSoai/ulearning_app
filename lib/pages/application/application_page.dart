import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/pages/application/bloc/app_blocs.dart';
import 'package:ulearning_app/pages/application/bloc/app_events.dart';
import 'package:ulearning_app/pages/application/bloc/app_states.dart';
import 'package:ulearning_app/pages/application/widgets/application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlocs, AppState>(builder: (context, state){
      return Container(
          color: Colors.white,
          child: SafeArea(
              child: Scaffold(
                body: buildPage(state.index),
                bottomNavigationBar: Container(
                  width: 375.w,
                  height: 64.h,
                  decoration: BoxDecoration(
                    color: AppColors.primaryElement,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 1,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: BottomNavigationBar(
                    currentIndex: state.index,
                    onTap: (index) {
                     context.read<AppBlocs>().add(TriggerAppEvent(index));
                    },
                    elevation: 0,
                    showSelectedLabels: false,
                    type: BottomNavigationBarType.fixed,
                    showUnselectedLabels: false,
                    selectedItemColor: AppColors.primaryElement,
                    unselectedItemColor: AppColors.primaryFourElementText,
                    items:bottomTabs,
                  ),
                ),
              )));
    });
  }
}
