import 'package:flutter/material.dart';
import 'package:pending_tasks/constants/colors.dart';
// import '../constants/colors.dart';
import '../model/db_model.dart';
import './todo_card.dart';

class Todolist extends StatelessWidget {
  // create an object of database connect
  // to pass down to todocard, first our todolist have to receive the functions
  final Function insertFunction;
  final Function deleteFunction;
  final Function isDone;
  final db = DatabaseConnect();
  Todolist(
      {required this.insertFunction,
      required this.deleteFunction,
      required this.isDone,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.getTodo(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var data =
              snapshot.data; // this is the data we have to show. (list of todo)
          var datalength = data!.length;

          return datalength == 0
              ? Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                      alignment: Alignment.topCenter,
                      child: const Text('Hurray!!\nYou have no pending tasks left !!', 
                      style: TextStyle(color: tdBlack, 
                                      fontSize: 25, 
                                      fontWeight: FontWeight.w400, 
                                      fontFamily: 'ChakraPetch',), 
                      textAlign: TextAlign.center, ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset('assets/images/achievement.png'),
                    ),
                  )
                ],
              )
              : ListView.builder(
                shrinkWrap: true,
                  itemCount: datalength,
                  itemBuilder: (context, i) => Todocard(
                    id: data[i].id,
                    title: data[i].title,
                    creationDate: data[i].creationDate,
                    isChecked: data[i].isChecked,
                    insertFunction: insertFunction,
                    deleteFunction: deleteFunction,
                    isDone: isDone,
                  ),
                );
        },
      ),
    );
  }
}
