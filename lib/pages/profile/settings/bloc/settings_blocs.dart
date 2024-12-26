
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/profile/settings/bloc/settings_events.dart';
import 'package:ulearning_app/pages/profile/settings/bloc/settings_states.dart';

class SettingsBlocs extends Bloc<SettingsEvent, SettingsStates>{
  SettingsBlocs() : super(const SettingsStates()){
    on<TriggerSettings>(_onTriggerSettings);
  }
  void _onTriggerSettings(TriggerSettings event, Emitter<SettingsStates> emit) {
    emit(const SettingsStates());
  }

}