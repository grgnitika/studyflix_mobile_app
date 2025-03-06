import 'package:flutter/material.dart';

import '../../domain/entity/course_entity.dart';

class CourseCardView extends StatelessWidget {
  final List<CourseEntity> courses;
  final Function(String) onTap;

  const CourseCardView({
    super.key,
    required this.courses,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.65,
        ),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];

          return GestureDetector(
            onTap: () => onTap(course.id ?? ''),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Course Image
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(12)),
                    child: course.image != null
                        ? Image.network(
                            course.image,
                            height: 140,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : const SizedBox(
                            height: 140,
                            width: double.infinity,
                            child: Icon(Icons.image, size: 50),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Course Title
                        Text(
                          course.title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),

                        // Course Category
                        Text(
                          course.category ?? "Uncategorized",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
