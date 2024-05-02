import 'package:flutter/material.dart';

class LessonItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      child: SizedBox(
        width: double.infinity,
        height: 60.0,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Занятие #1",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'ПТ, C 15:00 до 16:00',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text('16.05.2024'),
            ),
          ],
        ),
      ),
    );
  }
}
