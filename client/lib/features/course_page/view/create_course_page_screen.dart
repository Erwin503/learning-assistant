import 'package:flutter/material.dart';
import '../../../models/course.dart';
import '../../data.dart';

var newNameBlock = "none";
var newDescriptionBlock = "none";
var cardCountBlock = 0;

class CreateCoursePage extends StatelessWidget {
  final course = CourseData.coursesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          padding: EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pushNamed('/');
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _buildActionButton(
                  "Удалить блок", "red", context, "white", "none"),
            ),
            SizedBox(width: 8),
            Expanded(
              child: _buildActionButton(
                  "Сохранить блок", "green", context, "white", "save"),
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.background),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 0, right: 24, left: 24, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Создание блока",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: Colors.white, fontSize: 36),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "0 cards",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      CourseInfo(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String title, String bgColor, BuildContext context,
      String textColor, String buttinAction) {
    Color styleBgColor = Color(0xFF007171);
    Color styleTextColor = Colors.black;

    if (textColor == "white") {
      styleTextColor = Colors.white;
    } else {
      styleTextColor = Colors.black;
    }

    if (bgColor == 'red') {
      styleBgColor = const Color.fromARGB(255, 244, 76, 54);
    } else if (bgColor == 'green') {
      styleBgColor = const Color.fromARGB(255, 76, 175, 125);
    }
    return ElevatedButton(
      onPressed: () {
        if (buttinAction == "save") {
          if (newNameBlock == "" || newDescriptionBlock == "") {
            // TO DO: дописать всплывающее окно о пустых полях
          } else {
            var newCourse = CourseData.coursesList.last;
            newCourse.title = newNameBlock;
            newCourse.description = newDescriptionBlock;
            newCourse.cardCount = cardCountBlock;
            Navigator.of(context).pushNamed("/");
            print('cardCount = ${newCourse.cardCount}');
            print('title = ${newCourse.title}');
            print('description = ${newCourse.description}');
            print('id = ${newCourse.id}');
            newDescriptionBlock = "";
            newNameBlock = "";
          }
        }
      },
      style: ElevatedButton.styleFrom(
        elevation: 3,
        shadowColor: styleBgColor,
        minimumSize: Size(double.infinity, 68),
        padding: EdgeInsets.symmetric(horizontal: 10),
        backgroundColor: styleBgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: styleTextColor,
            ),
      ),
    );
  }
}

class CourseInfo extends StatefulWidget {
  CourseInfo({super.key});

  @override
  State<CourseInfo> createState() => _CourseInfoState();
}

class _CourseInfoState extends State<CourseInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 24.0, left: 24.0, top: 24.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Название',
              textDirection: TextDirection.ltr,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 18),
            ),
            TextField(
              onChanged: (text) {
                newNameBlock = text;
              },
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                  hintText: "Название курса",
                  hintStyle: TextStyle(color: Color.fromARGB(255, 75, 91, 99)),
                  border: InputBorder.none),
            ),
            Text(
              'Описание',
              textDirection: TextDirection.ltr,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 18),
            ),
            TextField(
              onChanged: (text) {
                newDescriptionBlock = text;
              },
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                  hintText: "Введите информацию о блоке",
                  hintStyle: TextStyle(color: Color.fromARGB(255, 75, 91, 99)),
                  border: InputBorder.none),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                'Карточки',
                textDirection: TextDirection.ltr,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 18),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/create-card',
                  arguments: 10,
                );
              },
              child: Container(
                height: 64,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 4,
                      color: Color.fromARGB(136, 12, 134, 134),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Center(
                  child: Icon(
                    size: 36,
                    Icons.add_circle_outline,
                    color: Color.fromARGB(136, 12, 134, 134),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
