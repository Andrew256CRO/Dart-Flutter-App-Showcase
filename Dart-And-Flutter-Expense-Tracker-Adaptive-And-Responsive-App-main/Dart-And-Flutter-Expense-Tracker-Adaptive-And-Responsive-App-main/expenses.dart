// main file for creating the main user interface

import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/widgets.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter Course',
        amount: 20.25,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Cinema',
        amount: 18,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openAddExpenseOverlay() {
    // showModalBottomSheet will dynamically add a new UI element, such a modal overlay when it's being executed
    /*showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return const Text(
            'Modal Bottom Sheet text',
          );
        });*/

    /*showModalBottomSheet(
        context: context,
        builder: (ctx) => const Text('Modal Bottom Sheet text'));*/

    showModalBottomSheet(
      // a safe area makes sure that we stay away from device features like a camera that might affect our UI
      useSafeArea: true,
      //"isScrollControlled" when this is true, the model overlay will take all of the avaible space aka won't overlap on buttons
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    //clears any snackbars
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        //how long the message will be on the screen
        duration: const Duration(seconds: 3),
        //showing the message on the screen
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              // 'insert' also adds an item to a list, but we can specify the index
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  // the build method executes again if I rotate the device(Flutter does this for me)
  // so build doesn't execute only when calling setState;
  @override
  Widget build(BuildContext context) {
    // to find how much width for example is avaible, I will use the MediaQuerry
    final width = MediaQuery.of(context).size.width;
    //print(MediaQuery.of(context).size.height);
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some.'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(
                  child: mainContent,
                )
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: _registeredExpenses),
                ),
                Expanded(
                  child: mainContent,
                )
              ],
            ),
    );
  }
}
