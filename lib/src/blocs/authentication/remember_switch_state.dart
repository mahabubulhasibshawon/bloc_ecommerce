part of 'remember_switch_cubit.dart';

@immutable
abstract class RememberSwitchState {
  var value;
}

final class RememberSwitchInitial extends RememberSwitchState {}

class SwitchChanged extends RememberSwitchCubit{
  final bool value;
  SwitchChanged(this.value);
}