import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

/*class _NewExpenseState extends State<NewExpense> {
  // intially nothing is pressed/registered, you get the point
  var _enteredTitle = '';

  void _saveTitleInput(String value) {
    _enteredTitle = value;
    //setState() is not needed because the UI is not updating
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          //TextField will display a text input
          //maxLength can be used to set the max amount of characters that can be entered into this input field
          //keyboardType can access the TextInputType enum provided by Flutter to control which type of keyboard
          // should be presented
          // keyboardType: TextInputType.text este default, deci o setez degeaba aici
          TextField(
            //onChanged register a function when there is a modification(e.g. the user pressed a key) - good for getting user input
            // just pointing at the function, not calling it
            onChanged: _saveTitleInput,
            maxLength: 50,
            // keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    print(_enteredTitle);
                  },
                  child: const Text('Save expense')),
            ],
          ),
        ],
      ),
    );
  }
}*/

//ALTERNATIVE WAY OF HANDLING THE USER INPUT - NO VAR AND STORAGE NEEDED
class _NewExpenseState extends State<NewExpense> {
  // this creates an object that's optimized for handling user input
  //Flutter now does all the heavy lifting os storing the entered value and so on
  final _titleController = TextEditingController();
  final _numberController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  @override
  void dispose() {
    _titleController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final date = DateTime.now();
    final firstDate = DateTime(date.year - 1, date.month, date.day);
    // "await" goes in front of the code that returns a Future
    // internally, the value stored in pickedDate won't be avaible immediatley
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: firstDate,
        lastDate: date);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _showDialog() {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
          title: const Text('Invalid input'),
          // content is the main text shown in the dialogue
          content: const Text(
              'Please make sure that all of the info entered is valid'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    } else {
      // to show a message, I will use another built-in function by Flutter, the "showDialog" function
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          // content is the main text shown in the dialogue
          content: const Text(
              'Please make sure that all of the info entered is valid'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    }
  }

  void _submitExpenseData() {
    // converting String to a number(if it's possible)
    final enteredAmount = double.tryParse(_numberController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    //trim removes any whitespace excess at the beggining or end
    // this wil be true if I ahve an empty title,etc. -> I will show an error
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      //iOS text feeling
      _showDialog();
      return;
    }
    // I can get acces to the properties of the widget class that belongs to your state class by using "widget"
    // it's avaible only in the classes that extend the State class
    widget.onAddExpense(
      Expense(
          amount: enteredAmount,
          title: _titleController.text,
          date: _selectedDate!,
          category: _selectedCategory),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    //viewInsets.bottom sees the space taken by the keyboard for example
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (ctx, constraints) {
      /*print(constraints.minWidth);
      print(constraints.maxWidth);
      print(constraints.minHeight);
      print(constraints.maxHeight);*/
      return SizedBox(
        //to make sure that this gets as much space as it's necesar
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 15, keyboardSpace + 15),
            child: Column(
              children: [
                //TextField will display a text input
                //maxLength can be used to set the max amount of characters that can be entered into this input field
                //keyboardType can access the TextInputType enum provided by Flutter to control which type of keyboard
                // should be presented
                // keyboardType: TextInputType.text este default, deci o setez degeaba aici
                TextField(
                  //onChanged register a function when there is a modification(e.g. the user pressed a key) - good for getting user input
                  // just pointing at the function, not calling it
                  //onChanged: _saveTitleInput,
                  // insted of onChanged, we can now use a "controller :" parameter
                  // MULTIPLE FIELDS => MULTIPLE CONTROLLERS
                  controller: _titleController,
                  maxLength: 50,
                  // keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    label: Text('Title:'),
                  ),
                ),
                /*const SizedBox(
                height: 5,
              ),*/
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _numberController,
                        maxLength: 4,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        decoration: const InputDecoration(
                          prefixText: '\$ ',
                          label: Text('Price:'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(_selectedDate == null
                              ? 'No date selected'
                              : formatter.format(_selectedDate!)),
                          IconButton(
                            onPressed: _presentDatePicker,
                            icon: const Icon(Icons.calendar_month),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    DropdownButton(
                        value: _selectedCategory,
                        items: Category.values
                            .map(
                              (category) => DropdownMenuItem(
                                value: category,
                                child: Text(
                                  category.name.toUpperCase(),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          setState(() {
                            _selectedCategory = value;
                          });
                        }),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        // the ".text" property contains the the text the user entered into the input field
                        //print(_titleController.text);
                        //print(_numberController.text);
                        _submitExpenseData();
                      },
                      child: const Text('Save expense'),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // closes the modal overlay
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
