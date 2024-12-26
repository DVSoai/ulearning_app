
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/application/bloc/app_blocs.dart';
import 'package:ulearning_app/pages/home/bloc/home_blocs.dart';
import 'package:ulearning_app/pages/home/home.dart';
import 'package:ulearning_app/pages/profile/profile_page.dart';
import 'package:ulearning_app/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:ulearning_app/pages/profile/settings/settings_page.dart';
import 'package:ulearning_app/pages/register/bloc/register_blocs.dart';
import 'package:ulearning_app/pages/register/register.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';

import '../../pages/application/application_page.dart';

class AppPages {
  static List<PageEntity> routes(){
    return [
      PageEntity(
          route: AppRoutes.initial,
          page: const WelcomePage(),
          bloc: BlocProvider(
            create: (_) => WelcomeBloc(),
          )),
      PageEntity(
        route: AppRoutes.singIn,
        page: const SignInPage(),
        bloc: BlocProvider(
            create: (_) => SignInBlocs()),
      ),
      PageEntity(
        route: AppRoutes.register,
        page: const RegisterPage(),
        bloc: BlocProvider(
            create: (_) => RegisterBlocs()),
      ),
      PageEntity(
        route: AppRoutes.application,
        page: const ApplicationPage(),
        bloc: BlocProvider(
          create: (_) => AppBlocs(),
      )
      ),
      PageEntity(
          route: AppRoutes.home,
          page: const HomePage(),
          bloc: BlocProvider(
            create: (_) => HomePageBlocs(),
          )
      ),
      PageEntity(
          route: AppRoutes.profile,
          page: const ProfilePage(),
          bloc: BlocProvider(
            create: (_) => HomePageBlocs(),
          )
      ),
      PageEntity(
          route: AppRoutes.settings,
          page: const SettingsPage(),
          bloc: BlocProvider(
            create: (_) => SettingsBlocs(),
          )
      ),
    ];
  }

  //return all the bloc providers
  static List<dynamic> allBlocProvider (BuildContext context){
    List<dynamic> blocProviders = <dynamic>[];
    for( var bloc in routes()){
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }
  static MaterialPageRoute generateRouteSettings(RouteSettings settings){
    if(settings.name !=null){
      var result = routes().where((element) => element.route == settings.name);
      if(result.isNotEmpty){
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if(result.first.route == AppRoutes.initial && deviceFirstOpen){
          bool isLogin = Global.storageService.getIsLogin();
          if(isLogin){
            return MaterialPageRoute(builder: (_) => const ApplicationPage(), settings: settings);
          }
          return MaterialPageRoute(builder: (_) => const SignInPage(), settings: settings);
        }
        return MaterialPageRoute(builder: (_) => result.first.page, settings: settings);
      }
    }
    debugPrint("invalid route name ${settings.name}");
    return MaterialPageRoute(builder: (_) => const SignInPage(), settings: settings);
  }
}

//unify BlocProvider and routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page,  this.bloc});
}
