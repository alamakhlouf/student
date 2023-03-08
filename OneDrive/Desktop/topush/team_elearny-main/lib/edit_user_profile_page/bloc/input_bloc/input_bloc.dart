import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:team_elearny/edit_user_profile_page/data/UserModel.dart';
import '../../data/Edit_User_Profile_Repo.dart';

part 'input_event.dart';

part 'input_state.dart';

class InputBloc extends Bloc<EditProfileEvent, InputState> {
  late var image;

  InputBloc()
      : super(InputState(isEnabled: false, loadingData: true, image: "")) {
    on<EnableInputsEvent>((event, emit) => emit(
        InputState(isEnabled: true, loadingData: false, image: this.image)));
    on<DisableInputsEvent>((event, emit) => emit(
        InputState(isEnabled: false, loadingData: true, image: this.image)));
    on<LoadingData>((event, emit) async {
      try {
        await editUserProfileRepo.readData("KkaQAl8KEKXQkpacZFWp");

        image = await editUserProfileRepo.loadImage(userModel.profile_picture);
        emit(InputState(isEnabled: false, loadingData: false, image: image));
      } catch (e) {
        print("errro $e");
      }
    });
    on<DataLoaded>((event, emit) {
      emit(InputState(isEnabled: false, loadingData: true, image: this.image));
    });

    on<SavingData>((event, emit) async {
      bool emailCheck =
          await editUserProfileRepo.checkEmail("KkaQAl8KEKXQkpacZFWp");
      if (emailCheck) {
        await editUserProfileRepo.updateData("KkaQAl8KEKXQkpacZFWp");
        emit(InputState(
            isEnabled: false, loadingData: false, image: this.image));
      } else {
        emit(
            InputState(isEnabled: true, loadingData: false, image: this.image));
      }
    });
  }
}
