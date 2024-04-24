import 'package:flutter/material.dart';
import 'package:education_app/features/data.dart';
import '../../../models/card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import '../../data.dart';

class CardPage extends StatefulWidget {
  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage>
    with SingleTickerProviderStateMixin {
  late MatchEngine matchEngine;
  bool _showButton = false;
  final course = CourseData.cardsList;

  @override
  void initState() {
    super.initState();

    List<SwipeItem> swipeItems = course.map((item) {
      return SwipeItem(
        content: item,
        likeAction: () {
          print("Выучено: ${item.text}");
        },
        nopeAction: () {
          print("Отложить: ${item.text}");
        },
      );
    }).toList();

    matchEngine = MatchEngine(swipeItems: swipeItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 70, 70),
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text("Course name", style: TextStyle(color: Colors.white)),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 2, 70, 70),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 36, top: 0, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Выучено 0 из 20',
                style: TextStyle(fontSize: 24, color: Colors.white)),
            SizedBox(height: 10),
            Expanded(
              child: SwipeCards(
                matchEngine: matchEngine,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: _cardInfo(context, course[index]),
                    ),
                  );
                },
                onStackFinished: () {
                  print('Stack Finished');
                  setState(() {
                    _showButton = true; // Запуск анимации при завершении колоды
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Animated Button'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: _buildActionButton(
                        'Отложить и повторить', 'red', context, "def")),
                SizedBox(width: 8),
                Expanded(
                    child: _buildActionButton(
                        'Запомнить', 'green', context, "def")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomContainer({required String title}) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Color.fromARGB(255, 122, 122, 122),
          ),
          height: 100,
          width: 150,
        ),
      ],
    );
  }

  Widget _buildActionButton(
      String title, String bgColor, BuildContext context, String textColor) {
    Color styleBgColor = Color(0xFF007171);
    Color styleTextColor = Colors.black;
    if (textColor == "white") {
      styleTextColor = Colors.white;
    } else {
      styleTextColor = Colors.black;
    }

    if (bgColor == 'red') {
      styleBgColor = const Color.fromARGB(255, 255, 255, 255);
    } else if (bgColor == 'green') {
      styleBgColor = const Color.fromARGB(255, 255, 255, 255);
    }
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 10),
        minimumSize: Size(double.infinity, 68),
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

  Widget _cardInfo(BuildContext context, BlockCard card) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildCustomContainer(title: 'Картинка'),
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255))),
              child: Text(
                card.text,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.normal, fontSize: 18),
              ),
            )),
          ],
        ),

        SizedBox(height: 20),
        // Кнопки "Написать ответ", "Увидеть ответ"
        Row(
          children: [
            Expanded(
                child: _buildActionButton(
                    'Написать ответ', 'white', context, "white")),
            SizedBox(width: 8),
            Expanded(
                child: _buildActionButton(
                    'Увидеть ответ', 'white', context, "white")),
          ],
        ),
      ],
    );
  }
}
