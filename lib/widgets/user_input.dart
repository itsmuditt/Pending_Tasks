import 'package:flutter/material.dart';
import 'package:pending_tasks/constants/colors.dart';
import '../model/todo_model.dart';

class UserInput extends StatelessWidget {
  final textController = TextEditingController();
  final Function insertFunction; // this will receive the addItem function
  UserInput({required this.insertFunction, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      // color: const Color(0xFFDAB5FF),
      child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 20,
                        right: 20,
                        left: 20,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: textController,
                          decoration: const InputDecoration(
                        hintText: 'Add a new Task?',
                        border: InputBorder.none,
                      )),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        var myTodo = Todo(
                            title: textController.text,
                            creationDate: DateTime.now(),
                            isChecked: false);
                        // pass this to the insertfunction as parameter
                        insertFunction(myTodo);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tdBlue,
                        minimumSize: const Size(60, 60),
                        elevation: 10,
                      ),
                      child: const Text(
                        '+',
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
