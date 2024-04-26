import 'package:flutter/material.dart';
import 'package:education_app/features/data.dart';
import 'package:flutter/widgets.dart';
import '../../../models/card.dart';

String newQuestionCard = "";
String newAnswerCard = "";

class CreateCardPage extends StatefulWidget {
  @override
  State<CreateCardPage> createState() => _CreateCardPageState();
  final int courseId;

  CreateCardPage({required this.courseId});
}

class _CreateCardPageState extends State<CreateCardPage>
    with SingleTickerProviderStateMixin {
  final course = CourseData.cardsList;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 3, 100, 100),
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text("New cards", style: TextStyle(color: Colors.white)),
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
                Text('Всего карт 20',
                    style: TextStyle(fontSize: 24, color: Colors.white)),
                SizedBox(height: 10),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: _cardInfo(context, course[0]),
                    ),
                  ),
                ),
                _buildActionButton("Сохранить", "green", context, "white", 10)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomContainer() {
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

  Widget _cardInfo(BuildContext context, BlockCard card) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildCustomContainer(),
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _headersInputFields("Вопрос, слово, утвеждение:"),
                  TextField(
                    onChanged: (text) {
                      newQuestionCard = text;
                    },
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                        hintText: "Текст",
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 75, 91, 99)),
                        border: InputBorder.none),
                  ),
                  _headersInputFields("Ответ:"),
                  TextField(
                    onChanged: (text) {
                      newQuestionCard = text;
                    },
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                        hintText: "Ответ",
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 75, 91, 99)),
                        border: InputBorder.none),
                  ),
                ],
              ),
            )),
          ],
        ),
      ],
    );
  }

  Widget _headersInputFields(String headerField) {
    return Text(
      headerField,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18),
    );
  }

  Widget _buildActionButton(String title, String bgColor, BuildContext context,
      String textColor, int courseId) {
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
        for (var card in CourseData.cardsList) {
          print("Name: ${card.text}");
        }
        print("Добавляем новый элемент");
        CourseData.cardsList.add(BlockCard(
            id: 11,
            text: newQuestionCard,
            icon: "none",
            translation: newAnswerCard,
            blockId: 10,
            updatedAt: DateTime.now(),
            createdAt: DateTime.now()));
        for (var card in CourseData.cardsList) {
          print("Name: ${card.text}");
        }
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
}
