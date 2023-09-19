import 'package:equatable/equatable.dart';
import 'package:flutter_todo_app/blocs/bloc_exports.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends HydratedBloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchInitial(switchValue: false)) {
    on<SwitchOnEvent>((event, emit) {
      emit(const SwitchInitial(switchValue: true));
    });
    on<SwitchOffEvent>((event, emit) {
      emit(const SwitchInitial(switchValue: false));
    });
  }
  
  @override
  SwitchState? fromJson(Map<String, dynamic> json) {
    return SwitchState.fromMap(json);
  }
  
  @override
  Map<String, dynamic>? toJson(SwitchState state) {
    return state.toMap();
  }
}
