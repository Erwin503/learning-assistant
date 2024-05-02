import 'package:flutter/material.dart';
import 'dart:math';

Random random = Random();
Color generateSpecialColor() {
  int randomChannel = random.nextInt(5);
  int variableValue = random.nextInt(255);

  int r = 165, g = 165, b = 165;

  switch (randomChannel) {
    case 0:
      {
        r = variableValue;
        g = 255;
        break;
      }
    case 1:
      {
        r = 255;
        g = variableValue;
        break;
      }
    case 2:
      {
        b = variableValue;
        r = 255;
        break;
      }
    case 3:
      {
        b = 255;
        r = variableValue;
        break;
      }
    case 4:
      {
        b = variableValue;
        g = 255;
        break;
      }
    case 5:
      {
        b = 255;
        g = variableValue;
        break;
      }
  }

  return Color.fromRGBO(r, g, b, 0.8); // Создаем цвет с прозрачностью 1
}

class GroupItem extends StatelessWidget {
  final String typeGroupItem;
  final int id;
  final int studentCount;
  final String name;
  final int ownerId;

  GroupItem({
    required this.typeGroupItem,
    required this.id,
    required this.name,
    required this.ownerId,
    required this.studentCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      child: Container(
        width: double.infinity,
        height: 72.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: CircleAvatar(
                  radius: 24,
                  backgroundColor: generateSpecialColor(),
                  child: Icon(Icons.people,
                      size: 30, color: Color.fromARGB(255, 41, 41, 41))),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: (studentCount % 10) == 1
                        ? Text(
                            '$studentCount студент',
                            style: Theme.of(context).textTheme.displayMedium,
                          )
                        : (studentCount % 10) >= 2 && (studentCount % 10) <= 4
                            ? Text(
                                '$studentCount студента',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              )
                            : Text(
                                '$studentCount студентов',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                  )
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Открыть',
                  style: TextStyle(color: Color.fromARGB(255, 13, 110, 89)),
                )),
          ],
        ),
      ),
    );
  }
}
