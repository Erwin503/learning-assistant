import 'package:education_app/models/course_arguments.dart';
import 'package:education_app/widgets/course_item_is_passing.dart';
import 'package:flutter/material.dart';

class CoursesListScreen extends StatelessWidget {
  final CourseArguments args;

  CoursesListScreen(this.args);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.status == "started"
              ? 'Активные блоки'
              : args.status == "community"
                  ? 'Блоки от сообщества'
                  : "Категория",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16.0),
            child: Column(
              children: [
                CourseItemIsPassig(
                  title: "title",
                  studentCount: 100,
                  cardCount: 100,
                  type: "isPassing",
                ),
              ],
            ),
          )),
    );
  }
}
