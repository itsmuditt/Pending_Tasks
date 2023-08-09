import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pending_tasks/constants/colors.dart';
import '../model/todo_model.dart';

// ignore: must_be_immutable
class Todocard extends StatefulWidget {
  // create varibles that a todocard will receive data for
  final int id;
  final String title;
  final DateTime creationDate;
  bool isChecked;
  final Function insertFunction;
  final Function deleteFunction;
  final Function isDone;
  Todocard(
      {required this.id,
      required this.title,
      required this.creationDate,
      required this.isChecked,
      required this.insertFunction, // it will handle the changes in checkbox
      required this.deleteFunction, // it will handle the delete button function
      required this.isDone,
      Key? key})
      : super(key: key);

  @override
  State<Todocard> createState() => _TodocardState();
}

class _TodocardState extends State<Todocard> {
  @override
  Widget build(BuildContext context) {
    // create a local todo
    var anotherTodo = Todo(
        id: widget.id,
        title: widget.title,
        creationDate: widget.creationDate,
        isChecked: widget.isChecked);
    //
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          widget.isDone(anotherTodo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          widget.isChecked ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: tdBlack,
                  decoration:
                      widget.isChecked ? TextDecoration.lineThrough : null,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                DateFormat('dd MMM yyyy - hh:mm aaa')
                    .format(widget.creationDate),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8F8F8F),
                ),
              ),
            ],
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: tdRed, borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: () {
              widget.deleteFunction(anotherTodo);
            },
          ),
        ),
      ),
    );
  }
}
