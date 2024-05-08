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
  int passedCard = 0;
  final course = CourseData.cardsList;
  late AnimationController _controller;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _flipAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);

    List<SwipeItem> swipeItems = course.map((item) {
      return SwipeItem(
        content: item,
        likeAction: () {
          setState(() {
            passedCard += 1;
          });
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 3, 100, 100),
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text("Course name", style: TextStyle(color: Colors.white)),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 3, 100, 100),
      body: Stack(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(bottom: 36, top: 0, left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Выучено ${passedCard} из 20',
                    style: TextStyle(fontSize: 24, color: Colors.white)),
                SizedBox(height: 10),
                Expanded(
                  child: SwipeCards(
                    matchEngine: matchEngine,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          if (_controller.isDismissed) {
                            _controller.forward();
                          } else {
                            _controller.reverse();
                          }
                        },
                        child: AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            final isFront = (_flipAnimation.value < 0.5);
                            return Transform(
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.001)
                                ..rotateY(3.14159 * _flipAnimation.value),
                              alignment: Alignment.center,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: isFront
                                      ? _cardInfo(context, course[index])
                                      : _cardAnswer(context, course[index]),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                    onStackFinished: () {
                      print('Stack Finished');
                      setState(() {
                        _showButton = true;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: _buildActionButton('Отложить и повторить', 'red',
                            context, "white", "repeat")),
                    SizedBox(width: 8),
                    Expanded(
                        child: _buildActionButton('Запомнить', 'green', context,
                            "white", "remember")),
                  ],
                ),
              ],
            ),
          ),
          if (_showButton)
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 3, 100, 100),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 6,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      height: 240,
                      margin: EdgeInsets.all(48),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Icon(
                                  Icons.check,
                                  size: 50, // размер иконки
                                  color: Color.fromARGB(
                                      255, 12, 134, 134), // цвет иконки
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Пройдено",
                            style: TextStyle(
                                color: Color.fromARGB(255, 12, 134, 134),
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Поздравляю! Вы завершили курс.",
                            style: TextStyle(
                                color: Color.fromARGB(255, 31, 31, 31),
                                fontSize: 16),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 24),
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed("/");
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                minimumSize: Size(double.infinity, 48),
                                backgroundColor:
                                    Color.fromARGB(255, 12, 134, 134),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              child: Text(
                                "На главную",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                    ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
        ],
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

  Widget _buildActionButton(String title, String bgColor, BuildContext context,
      String textColor, String actionCard) {
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
        if (actionCard == "repeat") {
          matchEngine.currentItem?.nope();
        } else if (actionCard == "remember") {
          matchEngine.currentItem?.like();
        } else {}
      },
      style: ElevatedButton.styleFrom(
        elevation: 3,
        shadowColor: styleBgColor,
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
        // _buildCustomContainer(title: 'Картинка'),
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
                    'Написать ответ', 'white', context, "white", "none")),
            SizedBox(width: 8),
            Expanded(
                child: _buildActionButton(
                    'Увидеть ответ', 'white', context, "white", "none")),
          ],
        ),
      ],
    );
  }

  Widget _cardAnswer(BuildContext context, BlockCard card) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // _buildCustomContainer(title: 'Картинка'),
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
      ],
    );
  }
}
