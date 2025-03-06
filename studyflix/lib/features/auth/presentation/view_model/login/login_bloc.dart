// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:studyflix/features/auth/domain/use_case/login_usecase.dart';
// import 'package:studyflix/features/auth/presentation/view_model/signup/register_bloc.dart';
// import 'package:studyflix/features/home/presentation/view/home_view.dart';

// part 'login_event.dart';
// part 'login_state.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   final RegisterBloc _registerBloc;
//   final LoginUseCase _loginUseCase;

//   LoginBloc({
//     required RegisterBloc registerBloc,
//     required LoginUseCase loginUseCase,
//   })  : _registerBloc = registerBloc,
//         _loginUseCase = loginUseCase,
//         super(LoginState.initial()) {
//     // Navigate to Register Screen
//     on<NavigateRegisterScreenEvent>(
//       (event, emit) {
//         Navigator.push(
//           event.context,
//           MaterialPageRoute(
//             builder: (context) => BlocProvider.value(
//               value: _registerBloc,
//               child: event.destination,
//             ),
//           ),
//         );
//       },
//     );

//     // Navigate to Home Screen
//     on<NavigateHomeScreenEvent>(
//       (event, emit) {
//         Navigator.pushReplacement(
//           event.context,
//           MaterialPageRoute(
//             builder: (context) => const HomeView(),
//           ),
//         );
//       },
//     );

//     // Handle Login
//     on<LoginUserEvent>(
//       (event, emit) async {
//         emit(state.copyWith(isLoading: true));
//         final result = await _loginUseCase(
//           LoginParams(
//             email: event.email,
//             password: event.password,
//           ),
//         );

//         result.fold(
//           (failure) {
//             emit(state.copyWith(isLoading: false, isSuccess: false));
//             ScaffoldMessenger.of(event.context).showSnackBar(
//               SnackBar(
//                 content: Text(failure.message), // Show specific error message
//                 backgroundColor: Colors.red,
//               ),
//             );
//           },
//           (token) {
//             emit(state.copyWith(isLoading: false, isSuccess: true));
//             add(
//               NavigateHomeScreenEvent(
//                 context: event.context,
//                 destination: const HomeView(),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studyflix/features/auth/domain/use_case/login_usecase.dart';
import 'package:studyflix/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:studyflix/features/home/presentation/view/home_view.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final RegisterBloc _registerBloc;
  final LoginUseCase _loginUseCase;

  LoginBloc({
    required RegisterBloc registerBloc,
    required LoginUseCase loginUseCase,
  })  : _registerBloc = registerBloc,
        _loginUseCase = loginUseCase,
        super(LoginState.initial()) {
    // Navigate to Register Screen
    on<NavigateRegisterScreenEvent>(
      (event, emit) {
        Navigator.push(
          event.context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: _registerBloc,
              child: event.destination,
            ),
          ),
        );
      },
    );

    // Handle Login
    on<LoginUserEvent>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true));
        final result = await _loginUseCase(
          LoginParams(
            email: event.email,
            password: event.password,
          ),
        );

        result.fold(
          (failure) {
            emit(state.copyWith(isLoading: false));
            ScaffoldMessenger.of(event.context).showSnackBar(
              SnackBar(
                content: Text(failure.message), // Show specific error message
                backgroundColor: Colors.red,
              ),
            );
          },
          (token) {
            // No need to dispatch NavigateHomeScreenEvent, directly navigate
            emit(state.copyWith(isLoading: false));
            Navigator.pushReplacement(
              event.context,
              MaterialPageRoute(
                builder: (context) => const HomeView(),
              ),
            );
          },
        );
      },
    );
  }
}
