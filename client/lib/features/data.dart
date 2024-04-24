import 'package:education_app/models/card.dart';
import 'package:flutter/material.dart';

import '../models/course.dart';

class CourseData {
  static final List<Course> coursesList = [
    Course(
        title: "Введение в программирование. Python.",
        studentCount: 150,
        cardCount: 20,
        iconUrl: "https://example.com/icon1.png",
        description: "Learn the basics of programming."),
    Course(
        title: "Advanced Database Systems",
        studentCount: 120,
        cardCount: 25,
        iconUrl: "https://example.com/icon2.png",
        description: "Dive deeper into SQL and NoSQL databases."),
    Course(
        title: "Web Development",
        studentCount: 200,
        cardCount: 30,
        iconUrl: "https://example.com/icon3.png",
        description:
            "Learn to build dynamic websites using HTML, CSS, and JavaScript."),
  ];

  static final List<BlockCard> cardsList = [
    BlockCard(
        id: 1,
        text: "Книга",
        icon: "icons/book.png",
        translation: "Book",
        blockId: 1,
        updatedAt: DateTime.now(),
        createdAt: DateTime.now()),
    BlockCard(
        id: 2,
        text: "Солнце",
        icon: "icons/sun.png",
        translation: "Sun",
        blockId: 2,
        updatedAt: DateTime.now(),
        createdAt: DateTime.now()),
    BlockCard(
        id: 3,
        text: "Машина",
        icon: "icons/car.png",
        translation: "Car",
        blockId: 3,
        updatedAt: DateTime.now(),
        createdAt: DateTime.now()),
    BlockCard(
        id: 4,
        text: "Яблоко",
        icon: "icons/apple.png",
        translation: "Apple",
        blockId: 4,
        updatedAt: DateTime.now(),
        createdAt: DateTime.now()),
    BlockCard(
        id: 5,
        text: "Дерево",
        icon: "icons/tree.png",
        translation: "Tree",
        blockId: 5,
        updatedAt: DateTime.now(),
        createdAt: DateTime.now()),
    BlockCard(
        id: 6,
        text: "Компьютер",
        icon: "icons/computer.png",
        translation: "Computer",
        blockId: 6,
        updatedAt: DateTime.now(),
        createdAt: DateTime.now()),
    BlockCard(
        id: 7,
        text: "Кофе",
        icon: "icons/coffee.png",
        translation: "Coffee",
        blockId: 7,
        updatedAt: DateTime.now(),
        createdAt: DateTime.now()),
    BlockCard(
        id: 8,
        text: "Часы",
        icon: "icons/clock.png",
        translation: "Clock",
        blockId: 8,
        updatedAt: DateTime.now(),
        createdAt: DateTime.now()),
    BlockCard(
        id: 9,
        text: "Стул",
        icon: "icons/chair.png",
        translation: "Chair",
        blockId: 9,
        updatedAt: DateTime.now(),
        createdAt: DateTime.now()),
    BlockCard(
        id: 10,
        text: "Телефон",
        icon: "icons/phone.png",
        translation: "Phone",
        blockId: 10,
        updatedAt: DateTime.now(),
        createdAt: DateTime.now()),
  ];
}
