import 'package:flutter/material.dart';

class CourseItemIsPassig extends StatelessWidget {
  final String title;
  final int studentCount;
  final int cardCount;
  final String type;

  CourseItemIsPassig({
    required this.title,
    required this.studentCount,
    required this.cardCount,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      child: Container(
        width: double.infinity,
        height: 72.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: CircleAvatar(
                maxRadius: 24,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    '$studentCount students',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text('1 / $cardCount'),
            ),
          ],
        ),
      ),
    );
  }
}
