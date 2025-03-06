// import 'dart:io';

// import 'package:bloc_test/bloc_test.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:studyflix/core/error/failure.dart';
// import 'package:studyflix/features/auth/domain/use_case/register_user_usecase.dart';
// import 'package:studyflix/features/auth/domain/use_case/upload_image_usecase.dart';
// import 'package:studyflix/features/auth/presentation/view_model/signup/register_bloc.dart';

// // Mock UseCases
// class MockRegisterUseCase extends Mock implements RegisterUseCase {}

// class MockUploadImageUseCase extends Mock implements UploadImageUsecase {}

// // Mock File
// class MockFile extends Mock implements File {}

// // Mock BuildContext
// class MockBuildContext extends Mock implements BuildContext {
//   ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
// }

// void main() {
//   late RegisterBloc registerBloc;
//   late MockRegisterUseCase mockRegisterUseCase;
//   late MockUploadImageUseCase mockUploadImageUseCase;

//   setUpAll(() {
//     // Register fallback values for custom classes
//     registerFallbackValue(const RegisterUserParams(
//       username: 'fallback',
//       password: 'fallback',
//       email: 'fallback@example.com',
//       image: 'fallback_image', 
//       role: 'user',
//     ));

//     registerFallbackValue(UploadImageParams(
//       file: MockFile(),
//     ));
//   });

//   setUp(() {
//     mockRegisterUseCase = MockRegisterUseCase();
//     mockUploadImageUseCase = MockUploadImageUseCase();
//     registerBloc = RegisterBloc(
//       registerUseCase: mockRegisterUseCase,
//       uploadImageUsecase: mockUploadImageUseCase,
//     );
//   });

//   tearDown(() {
//     registerBloc.close();
//   });

//   test('initial state should be RegisterState.initial()', () {
//     expect(registerBloc.state, RegisterState.initial());
//   });

//   blocTest<RegisterBloc, RegisterState>(
//     'emits [loading, success] when RegisterUser event is added and registration is successful',
//     build: () {
//       when(() => mockRegisterUseCase.call(any())).thenAnswer(
//         (_) async => const Right(null),
//       );
//       return registerBloc;
//     },
//     act: (bloc) => bloc.add(RegisterUser(
//       username: 'test_user',
//       password: 'test_pass',
//       email: 'test@example.com',
//       context: MockBuildContext(),
//     )),
//     expect: () => [
//       const RegisterState(
//         isLoading: true,
//         isSuccess: false,
//         imageName: '',
//         errorMessage: null,
//       ),
//       const RegisterState(
//         isLoading: false,
//         isSuccess: true,
//         imageName: '',
//         errorMessage: null,
//       ),
//     ],
//     verify: (_) {
//       verify(() => mockRegisterUseCase.call(any())).called(1);
//     },
//   );

//   blocTest<RegisterBloc, RegisterState>(
//     'emits [loading, failure] when RegisterUser event is added and registration fails',
//     build: () {
//       when(() => mockRegisterUseCase.call(any())).thenAnswer(
//         (_) async => const Left(ApiFailure(message: 'Registration failed')),
//       );
//       return registerBloc;
//     },
//     act: (bloc) => bloc.add(RegisterUser(
//       username: 'test_user',
//       password: 'test_pass',
//       email: 'test@example.com',
//       context: MockBuildContext(),
//     )),
//     expect: () => [
//       const RegisterState(
//         isLoading: true,
//         isSuccess: false,
//         imageName: '',
//         errorMessage: null,
//       ),
//       const RegisterState(
//         isLoading: false,
//         isSuccess: false,
//         imageName: '',
//         errorMessage: 'Registration failed', // Expect error message
//       ),
//     ],
//     verify: (_) {
//       verify(() => mockRegisterUseCase.call(any())).called(1);
//     },
//   );

//   blocTest<RegisterBloc, RegisterState>(
//     'emits [loading, success] when UploadImage event is added and upload is successful',
//     build: () {
//       when(() => mockUploadImageUseCase.call(any())).thenAnswer(
//         (_) async => const Right('uploaded_image.jpg'),
//       );
//       return registerBloc;
//     },
//     act: (bloc) => bloc.add(UploadImage(file: MockFile())),
//     expect: () => [
//       const RegisterState(
//         isLoading: true,
//         isSuccess: false,
//         imageName: '',
//         errorMessage: null,
//       ),
//       const RegisterState(
//         isLoading: false,
//         isSuccess: true, // Expect success for image upload
//         imageName: 'uploaded_image.jpg',
//         errorMessage: null,
//       ),
//     ],
//     verify: (_) {
//       verify(() => mockUploadImageUseCase.call(any())).called(1);
//     },
//   );

//   blocTest<RegisterBloc, RegisterState>(
//     'emits [loading, failure] when UploadImage event is added and upload fails',
//     build: () {
//       when(() => mockUploadImageUseCase.call(any())).thenAnswer(
//         (_) async => const Left(ApiFailure(message: 'Image upload failed')),
//       );
//       return registerBloc;
//     },
//     act: (bloc) => bloc.add(UploadImage(file: MockFile())),
//     expect: () => [
//       const RegisterState(
//         isLoading: true,
//         isSuccess: false,
//         imageName: '',
//         errorMessage: null,
//       ),
//       const RegisterState(
//         isLoading: false,
//         isSuccess: false,
//         imageName: '',
//         errorMessage: 'Image upload failed', // Expect error message
//       ),
//     ],
//     verify: (_) {
//       verify(() => mockUploadImageUseCase.call(any())).called(1);
//     },
//   );
// }
