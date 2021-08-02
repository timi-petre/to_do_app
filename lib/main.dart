// Import MaterialApp and other widgets which we can use to quickly create a material app
import 'package:flutter/material.dart';

// Code written in Dart starts exectuting from the main function. runApp is part of
// Flutter, and requires the component which will be our app's container. In Flutter,
// every component is known as a "widget".
void main() => runApp(TodoApp());

// Every component in Flutter is a widget, even the whole app itself
class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      home: TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<String> _todoItems = [];
// This will be called each time the + button is pressed
  void _addTodoItem() {
    // Putting our code inside "setState" tells the app that our state has changed, and
    // it will automatically re-render the list
    setState(() {
      int index = _todoItems.length;
      _todoItems.add('Item ' + index.toString());
    });
  }

// Build the whole list of todo items
  Widget _buildTodoList() {
    return ListView.builder(
      itemCount: _todoItems.length,
      itemBuilder: (context, index) {
        // itemBuilder will be automatically be called as many times as it takes for the
        // list to fill up its available space, which is most likely more than the
        // number of todo items we have. So, we need to check the index is OK.
        if (index < _todoItems.length) {
          return Card(child: _buildTodoItem(_todoItems[index]));
        }
        return null!;
      },
    );
  }

  Widget _buildTodoItem(String todoText) {
    return ListTile(
      title: Text(todoText),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        centerTitle: true,
      ),
      body: _buildTodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodoItem,
        tooltip: 'Add task',
        child: Icon(Icons.add),
      ),
    );
  }
}
