import 'package:flutter/material.dart';
import 'models/category.dart';
import 'models/expense.dart';
import 'utils/expense_x.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.teal),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Expense> _expenses = [];

  void _addSampleExpense() {
    setState(() {
      _expenses.add(Expense(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        title: 'Coffee',
        amount: 2.5,
        category: Category.food,
        date: DateTime.now(),
      ));
    });
  }

  void _reset() => setState(_expenses.clear);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: _reset,
            tooltip: 'Reset',
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              '${_expenses.length} expenses · '
              '${_expenses.total.asMoney} USD',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addSampleExpense,
        tooltip: 'Add coffee',
        child: const Icon(Icons.add),
      ),
    );
  }
}