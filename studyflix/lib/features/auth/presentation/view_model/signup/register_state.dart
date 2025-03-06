part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final String? imageName;

  const RegisterState({
    required this.isLoading,
    required this.isSuccess,
    this.imageName,
  });

  const RegisterState.initial()
      : isLoading = false,
        isSuccess = false,
        imageName = null;

  RegisterState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? imageName,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      imageName: imageName ?? this.imageName,
    );
  }

  @override
  List<Object?> get props => [isLoading, isSuccess, imageName];
}

// part of 'register_bloc.dart';

// class RegisterState {
//   final bool isLoading;
//   final bool isSuccess;
//   final bool isImageLoading;
//   final bool isImageSuccess;
//   final String? imageName;
//   final String? errorMessage;

//   RegisterState({
//     required this.isLoading,
//     required this.isSuccess,
//     required this.isImageLoading,
//     required this.isImageSuccess,
//     this.imageName,
//     this.errorMessage,
//   });

//   RegisterState.initial()
//       : isLoading = false,
//         isSuccess = false,
//         isImageLoading = false,
//         isImageSuccess = false,
//         imageName = null,
//         errorMessage = null;

//   RegisterState copyWith({
//     bool? isLoading,
//     bool? isSuccess,
//     bool? isImageLoading,
//     bool? isImageSuccess,
//     String? imageName,
//     String? errorMessage,
//   }) {
//     return RegisterState(
//       isLoading: isLoading ?? this.isLoading,
//       isSuccess: isSuccess ?? this.isSuccess,
//       isImageLoading: isImageLoading ?? this.isImageLoading,
//       isImageSuccess: isImageSuccess ?? this.isImageSuccess,
//       imageName: imageName ?? this.imageName,
//       errorMessage: errorMessage,
//     );
//   }
// }
