import 'package:flutter/material.dart';
import 'package:studyflix/features/course/domain/entity/course_entity.dart';
import 'package:studyflix/features/video/presentation/view/video_player.dart';

class VideoPage extends StatelessWidget {
  final CourseEntity course;

  const VideoPage({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
      ),
      body: ListView.builder(
        itemCount: course.curriculum.length,
        itemBuilder: (context, index) {
          final lecture = course.curriculum[index];
          return ListTile(
            title: Text(lecture.title),
            onTap: () {
              // Navigate to the video player page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      VideoPlayerPage(videoUrl: lecture.videoUrl),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
