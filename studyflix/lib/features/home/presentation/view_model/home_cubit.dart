import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studyflix/app/di/di.dart';
import 'package:studyflix/app/shared_prefs/token_shared_prefs.dart';
import 'package:studyflix/app/shared_prefs/user_shared_prefs.dart';
import 'package:studyflix/features/auth/presentation/view/login_view.dart';
import 'package:studyflix/features/auth/presentation/view_model/login/login_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final TokenSharedPrefs tokenSharedPrefs;
  final UserSharedPrefs userSharedPrefs;

  HomeCubit({required this.tokenSharedPrefs, required this.userSharedPrefs})
      : super(HomeState.initial());

  void onTabTapped(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  // Handle logout
  void logout(BuildContext context) async {
    await tokenSharedPrefs.clearToken(); // Clear stored token
    await userSharedPrefs.clear(); // Clear user data

    // Wait for 2 seconds before navigating to login
    Future.delayed(const Duration(seconds: 2), () {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: getIt<LoginBloc>(),
              child: LoginView(),
            ),
          ),
        );
      }
    });
  }
}
