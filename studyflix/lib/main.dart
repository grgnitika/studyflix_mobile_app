import 'package:flutter/material.dart';
import 'package:studyflix/app/app.dart';
import 'package:studyflix/app/di/di.dart';
import 'package:studyflix/core/network/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();

  // await HiveService().clearStudentBox();

  await initDependencies();

  runApp(
    const App(),
  );
}

// import 'package:flutter/material.dart';
// import 'package:studyflix/features/home/presentation/view/home_view.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'StudyFlix',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const HomeView(),
//     );
//   }
// }
