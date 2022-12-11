import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';


class Subject extends StatefulWidget {
  @override
  _SubjectState createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  final todoController = TextEditingController();

  void addToDo() async {
    if (todoController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Empty title"),
        duration: Duration(seconds: 2),
      ));
      return;
    }
    await saveSubject(todoController.text);
    setState(() {
      todoController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              width: 400,
              height: 400,
              padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      autocorrect: true,
                      textCapitalization: TextCapitalization.sentences,
                      controller: todoController,
                      decoration: InputDecoration(
                          labelText: "נושא חדש",
                          labelStyle: TextStyle(color: Colors.blueAccent)),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: Colors.blueAccent,
                      ),
                      onPressed: addToDo,
                      child: Text("הוספה")),
                ],
              )),
        ],
      ),
    );
  }

  Future<void> saveSubject(String title) async {
    final todo = ParseObject('Subject')..set('title', title)..set('done', false);
    await todo.save();
  }

  Future<List<ParseObject>> getSubject() async {
    QueryBuilder<ParseObject> querySubject =
    QueryBuilder<ParseObject>(ParseObject('Subject'));
    final ParseResponse apiResponse = await querySubject.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }

  Future<void> updateSubject(String id, bool done) async {
    var todo = ParseObject('Subject')
      ..objectId = id
      ..set('done', done);
    await todo.save();
  }

  Future<void> deleteSubject(String id) async {
    var todo = ParseObject('Subject')..objectId = id;
    await todo.delete();
  }
}