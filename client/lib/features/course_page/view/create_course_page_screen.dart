import 'package:education_app/models/block.dart';
import 'package:education_app/service/api_service.dart';
import 'package:flutter/material.dart';
import '../../../models/course.dart';
import '../../../models/card.dart';
import '../../data.dart';

class CreateCoursePage extends StatefulWidget {
  @override
  State<CreateCoursePage> createState() => _CreateCoursePageState();
}

class _CreateCoursePageState extends State<CreateCoursePage> {
  final course = CourseData.coursesList;
  var blockNameInputController = "";
  var blockDescriptionInputController = "";
  var cardTextInputController = "";
  var cardAnswerInputController = "";
  var cardCountBlock = 0;
  final ApiService apiService = ApiService();
  List<BlockCard> createdCards = [];

  void showCardForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          child: _createCardForm(context),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.background,
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
                    children: [
                      Text(
                        "${cardCountBlock}",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.normal),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(
                          size: 32,
                          Icons.collections,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.only(right: 24.0, left: 24.0, top: 24.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildField(
                        context, 'Название', "Название курса", "nameField"),
                    _buildField(context, 'Описание',
                        "Введите информацию о блоке", "descField"),
                    // _buildActionButton("Готово", "white", context, "white", "createBlock"),
                    _createCards(context),
                    Expanded(
                      // Добавляем Expanded, чтобы ListView мог правильно расширяться
                      child: ListView.builder(
                        itemCount: createdCards.length,
                        itemBuilder: (context, index) {
                          return itemCard(createdCards[index]
                              .text); // Передаем каждую карточку в виджет itemCard
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _buildActionButton(
                  "Удалить блок", "red", context, "white", "del"),
            ),
            SizedBox(width: 8),
            Expanded(
              child: _buildActionButton(
                  "Сохранить блок", "green", context, "white", "save"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createCardForm(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: 240,
          padding: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildField(
                  context, "Вопрос, слово, утверждение:", "Текст", "textCard"),
              _buildField(context, "Ответ:", "Ответ", "answerCard"),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _createCard();
                      print("save");
                      print(createdCards.length);
                      print(createdCards.last.text);
                      for (var element in createdCards) {
                        print(element.text);
                        print(createdCards.length);
                      }
                      setState(() {
                        cardCountBlock += 1;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text("Сохранить"),
                  ),
                ],
              ),
            ],
          ),
        )),
      ],
    );
  }

  Widget _buildField(
      BuildContext context, String title, String hintText, String role) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textDirection: TextDirection.ltr,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18),
        ),
        TextField(
          onChanged: (text) {
            if (role == 'nameField') {
              blockNameInputController = text;
            } else if (role == 'descField') {
              blockDescriptionInputController = text;
            } else if (role == 'answerCard') {
              cardAnswerInputController = text;
            } else if (role == 'textCard') {
              cardTextInputController = text;
            }
          },
          style: TextStyle(fontSize: 16),
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Color.fromARGB(255, 75, 91, 99)),
              border: InputBorder.none),
        ),
      ],
    );
  }

  Widget _createCards(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 12.0),
          child: Text(
            'Карточки',
            textDirection: TextDirection.ltr,
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18),
          ),
        ),
        InkWell(
          onTap: () {
            showCardForm(context);
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
    );
  }

  Padding itemCard(String titleCard) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Container(
        height: 64,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 12, 134, 134),
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    titleCard,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
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
        var lastCourse = CourseData.coursesList.last;
        if (buttinAction == "save") {
          if (blockNameInputController == "" ||
              blockDescriptionInputController == "") {
            // TO DO: дописать всплывающее окно о пустых полях
          } else {
            if (cardCountBlock > 0) {
              CourseData.coursesList.add(Course(
                  id: lastCourse.id + 1,
                  title: blockNameInputController,
                  studentCount: 0,
                  cardCount: createdCards.length,
                  iconUrl: "none",
                  description: blockDescriptionInputController));

              Course newCourse = CourseData.coursesList.last;
              print(newCourse);
              _createCourseAndCards();
              // Navigator.of(context).pushNamed("/");
            } else {
              print("Вы не создали карточку");
            }
          }
        } else if (buttinAction == "del") {
          blockNameInputController = "";
          blockDescriptionInputController = "";
          cardTextInputController = "";
          cardAnswerInputController = "";
          cardCountBlock = 0;
          createdCards = [];
          Navigator.of(context).pushNamed('/');
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

  Future<Block> _createBlock() async {
    try {
      var response = await apiService.createBlock({
        'name': "io",
        'description': "blockDescriptionInputController",
        'icon': "none",
        'userId': 1, // Укажите правильные значения
        'color': "white", // Укажите правильные значения
        'categoryId': 1, // Укажите правильные значения
      });

      Block newBlock = Block.fromJson({
        'id': response['data']['id'],
        'title': blockNameInputController,
        'studentCount':
            0, // Значение по умолчанию или из response если доступно
        'cardCount': cardCountBlock, // Укажите правильные значения
        'iconUrl': response['data']['icon'],
        'description': response['data']['description'],
      });
      return newBlock;
    } catch (e) {
      print("_____________12345_______________");
      throw Exception('Failed to create block: $e');
    }
  }

  Future<void> _createCard() async {
    BlockCard newCard = BlockCard(
        id: 10,
        text: cardTextInputController,
        icon: "icon",
        translation: cardAnswerInputController,
        blockId: 20,
        updatedAt: DateTime.now(),
        createdAt: DateTime.now());
    createdCards.add(newCard);
  }

  Future<void> _createCourseAndCards() async {
    Navigator.of(context).pushNamed("/");
    // print("________________________________________________");
    // // Block course = await _createBlock();
    // await _createBlock();
    // print("________________________________________________");
    // print(course);
    // await _createCard();
  }
}
