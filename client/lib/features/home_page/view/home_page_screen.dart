import 'package:education_app/generated/l10n.dart';
import 'package:education_app/models/course_arguments.dart';
import 'package:education_app/widgets/course_item.dart';
import 'package:flutter/material.dart';
import '../../../models/course.dart';
import '../../../service/api_service.dart';
import 'dart:math';
import '../../data.dart';

Random random = Random();

Color generateSpecialColor() {
  int randomChannel = random.nextInt(5);
  int variableValue = random.nextInt(256);

  int r = 165, g = 165, b = 165; // Значения по умолчанию для RGB

  // Устанавливаем значения в зависимости от выбранного канала
  switch (randomChannel) {
    case 0:
      r = variableValue;
      g = 255;
      break;
    case 1:
      r = 255;
      g = variableValue;
      break;
    case 2:
      b = variableValue;
      r = 255;
      break;
    case 3:
      b = 255;
      r = variableValue;
      break;
    case 4:
      b = variableValue;
      g = 255;
      break;
    case 5:
      b = 255;
      g = variableValue;
      break;
  }

  return Color.fromRGBO(r, g, b, 0.8); // Создаем цвет с прозрачностью 1
}

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final isUserCourse = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // Задает высоту AppBar
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24.0),
            bottomRight: Radius.circular(24.0),
          ),
          child: Container(
            color: Color(0xFF007171),
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 0, bottom: 0, left: 24, right: 12),
                        child: CircleAvatar(
                            maxRadius: 32,
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            child: const Text('JJ')),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Ganiev Ibraim',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'ibraim@gmail.com',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/settings');
                    },
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          padding: const EdgeInsets.only(
                              top: 28, bottom: 0, left: 0, right: 24),
                          child: Icon(
                            Icons.settings,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  child: Text(S.of(context).activeBlock,
                      style: Theme.of(context).textTheme.displayLarge),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      '/courses-list',
                      arguments: CourseArguments('001', 'started'),
                    );
                  },
                  child: Align(
                    child: Text('>',
                        style: Theme.of(context).textTheme.displayLarge),
                  ),
                ),
              ],
            ),
            isUserCourse
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 116,
                          child: Center(
                            child: Text(
                              "У вас еще нет собственных курсов",
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: SizedBox(
                      height: 116,
                      child: FutureBuilder<List<Course>>(
                          future: Future.value(ApiService().fetchCourses()),
                          // future: Future.value(CourseData.coursesList),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                  child: const CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (snapshot.hasData) {
                              print(snapshot.data);

                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  final course = snapshot.data![index];
                                  return InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        '/course',
                                        arguments: index,
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: generateSpecialColor(),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12.0),
                                          )),
                                      width: 160.0,
                                      margin: EdgeInsets.only(right: 16.0),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12.0, left: 12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              course.title,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            ),
                                            Spacer(),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 12.0, right: 12.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    '1 / ${course.cardCount}',
                                                    overflow: TextOverflow.fade,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleLarge,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              return Text('No data available');
                            }
                          }),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    child: Text(S.of(context).communityBlock,
                        style: Theme.of(context).textTheme.displayLarge),
                  ),
                  Align(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          "/courses-list",
                          arguments: CourseArguments('001', 'community'),
                        );
                      },
                      child: Text('>',
                          style: Theme.of(context).textTheme.displayLarge),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Course>>(
                future: Future.value(CourseData.coursesList),
                // future: ApiService().fetchCourses(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: const CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    print(snapshot.data);

                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final course = snapshot.data![index];
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              '/course',
                              arguments: index,
                            );
                          },
                          child: CourseItem(
                            title: course.title,
                            studentCount: course.studentCount,
                            cardCount: course.cardCount,
                            type: "isNew",
                          ),
                        );
                      },
                    );
                  } else {
                    return Text('No data available');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
