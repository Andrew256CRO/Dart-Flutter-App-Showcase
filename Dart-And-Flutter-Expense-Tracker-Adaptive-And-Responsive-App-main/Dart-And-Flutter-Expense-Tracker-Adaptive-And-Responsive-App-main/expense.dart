// here, I simply describe which data structure an expense in this app should have.

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

// creating a formatter object with which I can format dates
//y = year, M = month, d =day;
final formatter = DateFormat.yMd();

const uuid =
    Uuid(); // create an object of this class and store it in a variable called uuid

// enums
enum Category {
  food,
  travel,
  leisure,
  work,
}

// a map where the keys will be category enum values. The values will be the actual icons that should be displayed. ":" sets the value in a map
const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.travel_explore,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense(
      {required this.amount,
      required this.title,
      required this.date,
      required this.category})
      : id = uuid.v4();
  // ": ..." reprezinta o lista de initializare. Listele de initialziare pot fi folosite pentru a initializa proprietati a unei clase
  // (precum "id") cu valori care NU sunt primite ca argumente la constructor
  // Metoda v4() genereaza un String unic de id.

  late final String title;
  late final double amount;
  late final String id;
  late final DateTime date;
  //late final String category; // not good, prone to typos
  final Category category; // category e de tipul unui enum Category

  // a getter that returns a String value
  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({required this.category, required this.expenses});

  // adding additional constructor functions
  // 'where' is simply a method which allows me to filter a list
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    //checking through every item in the list
    for (final expense in expenses) {
      sum = sum + expense.amount;
    }

    return sum;
  }
}
