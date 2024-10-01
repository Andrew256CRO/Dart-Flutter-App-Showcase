// will extend the StatelessWidget because I won't manage any internal data
// I will just output the list of expenses that is defined in the expenses.dart file, in the _ExpensesState class

import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;

  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    // ListView is good to use instead of Column() when I don't know the length of the list.
    // ListView is scrollable by default
    // Metoda builder() face astfel incat sa creeze aceste iteme din lista doar cand sunt vizibile sau urmeaza sa fie vizibile
    return ListView.builder(
      itemCount: expenses.length,
      // Dismissible makes it that so swiping from right to left will delete an item
      // Created for lists
      itemBuilder: (ctx, index) => Dismissible(
        // ValueKey() creates a key object that can be then used as a value for this key parameter
        key: ValueKey(
          expenses[index],
        ),
        background: Container(
          color: Theme.of(context).colorScheme.error,
        ),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(
          expense: expenses[index],
        ),
      ),
    );
    //  expenses.length=2, deci functia "(ctx, index) => Text('data')" o sa fie chemata de 2 ori
    // de fiecare data cand functia este chemata, "index" va fi un numar diferit: 0 pt primul, 1 pt al doilea, etc.
  }
}
