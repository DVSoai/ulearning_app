
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_events.dart';
import 'home_states.dart';

class HomePageBlocs extends Bloc<HomePageEvents, HomePageStates> {
  HomePageBlocs() : super(const HomePageStates()){
    on<HomePageDots>(_onHomePageDots);
    on<SelectCourseType>(_onSelectCourseType);
  }

  _onHomePageDots(HomePageDots event, Emitter<HomePageStates> emit) {
    emit(state.copyWith(index: event.index));
  }
  _onSelectCourseType(SelectCourseType event, Emitter<HomePageStates> emit) {
    emit(state.copyWith(selectedCourseType: event.courseType));
  }

}