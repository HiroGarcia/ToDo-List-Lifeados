import 'package:flutter/material.dart';
import 'package:to_do_app/utilidades/colors.dart';
import 'package:to_do_app/utilidades/to_do_list.dart';

import '../utilidades/class_to_do.dart';
import '../utilidades/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller1 = TextEditingController();
  // ignore: unused_field
  // final TextEditingController _controller2 = TextEditingController();
  List<ToDo> toDoList = [
    ToDo(toDoName: 'toDoName', hour: 5),
  ];

  @override
  // ignore: override_on_non_overriding_member
  void _saveNewTask() {
    // ignore: unused_local_variable
    var name = _controller1.text;
    // var hour = _controller2.text;
// ignore: unnecessary_null_comparison
    if (name.isNotEmpty) {
      toDoList.add(ToDo(toDoName: name, hour: 5));
      Navigator.of(context).pop();
      _controller1.clear();
    }
    setState(() {});
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller1: _controller1,
          // controller2: _controller2,
          onSave: _saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(21, 21, 21, 1),
      appBar: AppBar(
        backgroundColor: Firstcolor,
        toolbarHeight: 90,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.keyboard_arrow_left,
              size: 30,
            ),
            Text(
              'Todo List',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            Icon(Icons.more_vert_rounded),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, top: 50, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Today',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const Text(
              'August 1, 2024',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w400,
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Flexible(
              child: ListView.builder(
                itemCount: toDoList.length,
                itemBuilder: (context, index) {
                  return ToDoList(
                    toDoName: toDoList[index].toDoName,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Firstcolor,
        shape: const CircleBorder(),
        elevation: 10,
        child: const Icon(
          Icons.add,
          size: 35,
          color: Colors.black,
        ),
      ),
    );
  }
}
