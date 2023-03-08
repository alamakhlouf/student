part of 'input_bloc.dart';

@immutable
abstract class EditProfileEvent {}

class EnableInputsEvent extends EditProfileEvent {}

class DisableInputsEvent extends EditProfileEvent {}

class LoadingData extends EditProfileEvent {}

class DataLoaded extends EditProfileEvent {}

class SavingData extends EditProfileEvent {}
