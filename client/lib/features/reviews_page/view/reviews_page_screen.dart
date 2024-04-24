import 'package:flutter/material.dart';

class ReviewsListPageScreen extends StatelessWidget {
  String courseTitle = 'Python';
  var reviews = [
    {"name": "John", "text": "Отличный продукт!"},
    {"name": "Alice", "text": "Отличное обслуживание."},
    {"name": "Bob", "text": "Очень рекомендую."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(
          'Reviews',
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          softWrap: true,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          padding: EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pushNamed('/course');
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 12, bottom: 0, left: 0, right: 0),
            child: Text('Курс $courseTitle',
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: reviews.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 0.0, top: 0.0, right: 12.0, bottom: 0.0),
                        child: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.background,
                            child: const Text('JJ')),
                      ),
                      Expanded(
                        child: Column(
                          textDirection: TextDirection.ltr,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              reviews[index]['name']!,
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              reviews[index]['text']!,
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                color: Color(0xFF414141),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
