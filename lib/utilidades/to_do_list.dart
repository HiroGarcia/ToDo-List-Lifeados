import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoList extends StatelessWidget {
  String toDoName;

  ToDoList({
    super.key,
    required this.toDoName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: (context) {},
            icon: Icons.delete,
            backgroundColor: const Color.fromARGB(255, 82, 79, 79),
            borderRadius: BorderRadius.circular(10),
          )
        ]),
        child: Container(
          padding: const EdgeInsets.only(left: 8, top: 8, right: 20, bottom: 8),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(32, 31, 31, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    shape: const CircleBorder(),
                    value: false,
                    onChanged: (context) {},
                    activeColor: Colors.black,
                  ),
                  Text(
                    toDoName,
                    style: const TextStyle(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const Text(
                '6.00 pm',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
