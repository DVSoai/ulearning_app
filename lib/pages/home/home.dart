import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/pages/home/widgets/home_widgets.dart';

import 'bloc/home_blocs.dart';
import 'bloc/home_states.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBarHome(),
      body: BlocBuilder<HomePageBlocs, HomePageStates>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: homePageText('Hello',
                      color: AppColors.primaryThreeElementText),
                ),
                SliverToBoxAdapter(
                  child: homePageText("Marshal Dev", top: 5),
                ),
                SliverPadding(padding: EdgeInsets.only(top: 20.h)),
                SliverToBoxAdapter(
                  child: searchView(),
                ),
                SliverToBoxAdapter(
                  child: sliderView(context, state),
                ),
                SliverToBoxAdapter(
                  child: menuView(context,state),
                ),
                SliverPadding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 0.w),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 1.6,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: (){

                          },
                          child:courseGrid(state)
                        );
                      },
                      childCount: 4,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
