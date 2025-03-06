// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:studyflix/features/course/domain/repository/course_repository.dart';
// import 'package:studyflix/features/course/presentation/view_model/single_course_bloc.dart';

// class SingleCourseView extends StatelessWidget {
//   final String courseId;

//   const SingleCourseView({super.key, required this.courseId});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Course Details'),
//       ),
//       body: BlocProvider(
//         create: (context) =>
//             CourseBloc(courseRepository: context.read<ICourseRepository>())
//               ..add(LoadCourseEvent(courseId: courseId)),
//         child: BlocBuilder<CourseBloc, CourseState>(
//           builder: (context, state) {
//             if (state is CourseLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is CourseLoaded) {
//               final course = state.course;
//               return SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Image.network(course.image),
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(course.title,
//                               style: const TextStyle(
//                                   fontSize: 24, fontWeight: FontWeight.bold)),
//                           const SizedBox(height: 8),
//                           Text(course.category,
//                               style: const TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.grey)),
//                           const SizedBox(height: 8),
//                           Text('Level: ${course.level}'),
//                           const SizedBox(height: 8),
//                           Text('Primary Language: ${course.primaryLanguage}'),
//                           const SizedBox(height: 16),
//                           Text(course.description,
//                               style: const TextStyle(fontSize: 14)),
//                           const SizedBox(height: 16),
//                           ElevatedButton(
//                             onPressed: () {
//                               // Navigate to the video page
//                               Navigator.pushNamed(context, '/video',
//                                   arguments: course.curriculum.first.publicId);
//                             },
//                             child: const Text("Let's Get Started"),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             } else if (state is CourseError) {
//               return Center(child: Text(state.message));
//             } else {
//               return const SizedBox.shrink();
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studyflix/features/course/domain/repository/course_repository.dart';
import 'package:studyflix/features/course/presentation/view_model/single_course_bloc.dart';
import 'package:studyflix/features/video/presentation/view/video_page.dart';

class SingleCourseView extends StatelessWidget {
  final String courseId;

  const SingleCourseView({super.key, required this.courseId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Details'),
      ),
      body: BlocProvider(
        create: (context) => SingleCourseBloc(
            courseRepository: context.read<ICourseRepository>())
          ..add(LoadSingleCourse(courseId: courseId)),
        child: BlocBuilder<SingleCourseBloc, SingleCourseState>(
          builder: (context, state) {
            if (state is SingleCourseLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SingleCourseLoaded) {
              final course = state.course;
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Course Image
                    Image.network(
                      course.image,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 16),

                    // Course Title
                    Text(
                      course.title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 8),

                    // Course Category (Subheader)
                    Text(
                      course.category,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),

                    // Course Level
                    Text(
                      'Level: ${course.level}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 8),

                    // Primary Language
                    Text(
                      'Primary Language: ${course.primaryLanguage}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),

                    // Course Description
                    Text(
                      course.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 24),

                    // Let's Get Started Button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to the video page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VideoPage(course: course),
                            ),
                          );
                        },
                        child: const Text("Let's Get Started"),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is SingleCourseError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('Something went wrong!'));
            }
          },
        ),
      ),
    );
  }
}
