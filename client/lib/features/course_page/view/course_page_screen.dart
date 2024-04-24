import 'package:flutter/material.dart';
import '../../data.dart';

class CoursePage extends StatelessWidget {
  final int courseId;
  final course = CourseData.coursesList;
  CoursePage({Key? key, required this.courseId}) : super(key: key);

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
        child: MaterialButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/card");
          },
          height: 50,
          color: Theme.of(context).colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              "ПОСТУПИТЬ",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
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
                    course[courseId].title,
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
                        "${course[courseId].studentCount} students",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "${course[courseId].cardCount} cards",
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
                child: Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        CourseInfo(description: course[courseId].description),
                        CourseReviews(),
                        SizedBox(height: 0),
                      ],
                    ),
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

class CourseInfo extends StatelessWidget {
  final String description;
  CourseInfo({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(right: 24.0, left: 24.0, top: 24.0, bottom: 0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Descriotion',
              textDirection: TextDirection.ltr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                description,
                textDirection: TextDirection.ltr,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseReviews extends StatefulWidget {
  @override
  State<CourseReviews> createState() => _CourseReviewsState();
}

class _CourseReviewsState extends State<CourseReviews> {
  final TextEditingController reviewController = TextEditingController();

  List<String> reviews = [
    "Join our exciting course where we will immerse ourselves in the world of coding and development. This course is designed  for those who want to master the basic concepts and programming terms necessary to become a qualified specialist in the IT industry."
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: 24.0, top: 24.0, right: 24.0, bottom: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                left: 0.0, top: 0.0, right: 0.0, bottom: 24.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Reviews',
                      textDirection: TextDirection.ltr,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Text(
                      '>',
                      textDirection: TextDirection.ltr,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ],
                ),
                FormField(
                  builder: (FormFieldState<String> state) {
                    return TextField(
                      controller: reviewController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Введите ваш отзыв',
                      ),
                    );
                  },
                ),
                MaterialButton(
                  onPressed: () {
                    String reviewText = reviewController.text;
                    handleButtonPress(reviewText);
                  },
                  height: 50,
                  color: Theme.of(context).colorScheme.background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      "Добавить отзыв",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 0.0, top: 0.0, right: 12.0, bottom: 0.0),
                child: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.background,
                    child: const Text('J J')),
              ),
              Expanded(
                child: Column(
                  textDirection: TextDirection.ltr,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John John',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        reviews[0],
                        textDirection: TextDirection.ltr,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0, top: 0.0, right: 12.0, bottom: 0.0),
                  child: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.background,
                      child: const Text('J J')),
                ),
                Expanded(
                  child: Column(
                    textDirection: TextDirection.ltr,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John John',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          reviews[0],
                          textDirection: TextDirection.ltr,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void handleButtonPress(String reviewText) {
    reviews.add(reviewText);
    print('New review: $reviewText');
  }
}
