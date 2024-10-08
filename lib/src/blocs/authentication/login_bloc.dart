import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../data/repoitory/repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository repository;

  LoginBloc(this.repository) : super(LoginInitial()) {
    on<RequestGoogleLogin>((event, emit) async {
    //   function for google login
      try{
        emit(LoginLoading());
        final user = await repository.signInWithGoogle();
        debugPrint('user: ${user?.displayName}');
        debugPrint('email: ${user?.email}');
        emit(LoginSuccess());
      } catch (e) {
        debugPrint(e.toString());
        emit(LoginFailed(e.toString()));
      }
    });

    on<RequestFacebookLogin>((event, emit) {
      emit(LoginLoading());
    });

    on<RequestTwitterLogin>((event, emit) async {
      emit(LoginLoading());
      try{
        final user = await repository.signInWithTwitter();
        debugPrint('user: ${user?.displayName}');
        if(user != null){

        }
      } catch(e) {
        debugPrint(e.toString());
      }
    });
  }
}
