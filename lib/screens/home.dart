import 'package:flutter/material.dart';
import 'package:pending_tasks/constants/colors.dart';
import '../model/db_model.dart';
import '../model/todo_model.dart';
import '../widgets/user_input.dart';
import '../widgets/todo_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // we have to create our functions here, where the two widgets can communicate

  // create a database object so we can access database functions
  var db = DatabaseConnect();

  // function to add todo
  void addItem(Todo todo) async {
    await db.insertTodo(todo);
    setState(() {});
  }

  // function to delete todo
  void deleteItem(Todo todo) async {
    await db.deleteTodo(todo);
    setState(() {});
  }

  // Function to Check/Uncheck Tasks
  void isDone(Todo todo) async {
    await db.isDone(todo);
    setState(() {});
  }

// Scaffold for HomePage
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: buildAppbar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                // searchBox(),
                Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 30,
                  ),
                  child: const Text(
                    'My Pending Tasks',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                // Calling all pending Tasks
                Todolist(
                  insertFunction: addItem,
                  deleteFunction: deleteItem,
                  isDone: isDone,
                ),
              ],
            ),
          ),
          // Taking input from User and adding that Task
          UserInput(insertFunction: addItem),
        ],
      ),
    );
  }

// Appbar Function
  AppBar buildAppbar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Icon(
          Icons.menu,
          color: tdBlack,
          size: 30,
        ),
        SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/PTasks.png'),
          ),
        )
      ]),
    );
  }
}
