import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../Data/ChangePasswordRepo.dart';

part 'password_event.dart';

part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  PasswordBloc() : super(PasswordState(changed: false, response: "")) {
    on<ChangePassword>((event, emit) async {
      String response = await changePasswordRepo.changePassword("KkaQAl8KEKXQkpacZFWp");
      if (response == "Your password has been updated successfully" ) {
        emit(PasswordState(
            changed: true,
            response: response));
      }  else {
        emit(PasswordState(
            changed: false,
            response: response));
      }
    });
  }



}
