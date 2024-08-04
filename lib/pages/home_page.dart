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

  List<ToDo> toDoList = [
    ToDo(
        toDoName: 'toDoName',
        selectedTime: const TimeOfDay(hour: 20, minute: 20)),
  ];

  static List<String> monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  String mouthNow = monthNames[DateTime.now().month - 1];

  void _saveNewTask(String name, TimeOfDay time) {
    if (name.isNotEmpty) {
      setState(() {
        toDoList.add(ToDo(toDoName: name, selectedTime: time));
      });
      Navigator.of(context).pop();
      _controller1.clear();
    }
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
            controller1: _controller1,
            onSave: _saveNewTask,
            onCancel: () {
              Navigator.of(context).pop();
              _controller1.clear();
            });
      },
    );
  }

  void checkBoxChange(bool? value, int index) {
    setState(() {
      toDoList[index].isMake = !toDoList[index].isMake;
    });
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
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
            Text(
              '$mouthNow ${DateTime.now().day}, ${DateTime.now().year}',
              style: const TextStyle(
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
                    selectedTime: toDoList[index].selectedTime,
                    taskCompleted: toDoList[index].isMake,
                    onChanged: (value) => checkBoxChange(value, index),
                    deleteFunction: (context) => deleteTask(index),
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
