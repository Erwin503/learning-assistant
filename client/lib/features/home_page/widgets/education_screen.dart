import 'package:education_app/features/home_page/widgets/group_item.dart';
import 'package:education_app/models/group.dart';
import 'package:flutter/material.dart';
import '../../../models/course.dart';
import '../../data.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({
    super.key,
  });
  final isUserCourse = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Поиск...',
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
              ),
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text("Вы  создатель группы",
          //         style: Theme.of(context).textTheme.displayLarge)
          //   ],
          // ),
          // isUserCourse
          //     ? Padding(
          //         padding: const EdgeInsets.symmetric(vertical: 16.0),
          //         child: Column(
          //           children: [
          //             SizedBox(
          //               height: 116,
          //               child: Center(
          //                 child: Text(
          //                   "Вы не состоите в группе",
          //                   style: Theme.of(context).textTheme.displayMedium,
          //                 ),
          //               ),
          //             )
          //           ],
          //         ),
          //       )
          //     : Expanded(
          //         child: FutureBuilder<List<Course>>(
          //           future: Future.value(CourseData.coursesList),
          //           // future: ApiService().fetchCourses(),
          //           builder: (context, snapshot) {
          //             if (snapshot.connectionState == ConnectionState.waiting) {
          //               return Center(child: const CircularProgressIndicator());
          //             } else if (snapshot.hasError) {
          //               return Text('Error: ${snapshot.error}');
          //             } else if (snapshot.hasData) {
          //               print(snapshot.data);

          //               return ListView.builder(
          //                 itemCount: snapshot.data!.length,
          //                 itemBuilder: (context, index) {
          //                   return InkWell(
          //                     onTap: () {
          //                       Navigator.of(context).pushNamed('/group');
          //                     },
          //                     child: GroupItem(typeGroupItem: 'newGroup'),
          //                   );
          //                 },
          //               );
          //             } else {
          //               return Text('No data available');
          //             }
          //           },
          //         ),
          //       ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Группы", style: Theme.of(context).textTheme.displayLarge)
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
                            "Вы не состоите в группе",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : Expanded(
                  child: FutureBuilder<List<Group>>(
                    future: Future.value(CourseData.groupsList),
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
                            final group = snapshot.data![index];
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed('/group');
                              },
                              child: GroupItem(
                                typeGroupItem: 'newGroup',
                                id: group.id,
                                name: group.name,
                                ownerId: group.ownerId,
                                studentCount: group.studentCount,
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
    );
  }
}
