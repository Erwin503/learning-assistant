import 'dart:math';
import 'package:education_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getStudentCount(int count, BuildContext context) {
  Locale locale = Localizations.localeOf(context);
  if (locale.languageCode == 'ru') {
    if (count % 10 == 1 && count % 100 != 11) {
      return '$count ${S.of(context).student}';
    } else if (count % 10 >= 2 &&
        count % 10 <= 4 &&
        (count % 100 < 10 || count % 100 >= 20)) {
      return '$count ${S.of(context).students2}';
    } else {
      return '$count ${S.of(context).students}';
    }
  } else {
    return '$count ${Intl.plural(
      count,
      one: S.of(context).student,
      other: S.of(context).students,
    )}';
  }
}

String getCardsCount(int count, BuildContext context) {
  Locale locale = Localizations.localeOf(context);
  if (locale.languageCode == 'ru') {
    if (count % 10 == 1 && count % 100 != 11) {
      return '$count ${S.of(context).card}';
    } else if (count % 10 >= 2 &&
        count % 10 <= 4 &&
        (count % 100 < 10 || count % 100 >= 20)) {
      return '$count ${S.of(context).cards2}';
    } else {
      return '$count ${S.of(context).cards}';
    }
  } else {
    return '$count ${Intl.plural(
      count,
      one: S.of(context).card,
      other: S.of(context).cards,
    )}';
  }
}

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

class CourseItem extends StatelessWidget {
  final String title;
  final int studentCount;
  final int cardCount;
  final String type;

  CourseItem({
    required this.title,
    required this.studentCount,
    required this.cardCount,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 12.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: CircleAvatar(
                maxRadius: 24,
                backgroundColor: generateSpecialColor(),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  // Text(
                  //   getStudentCount(studentCount, context),
                  //   style: Theme.of(context).textTheme.displayMedium,
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(getCardsCount(cardCount, context)),
            ),
          ],
        ),
      ),
    );
  }
}
