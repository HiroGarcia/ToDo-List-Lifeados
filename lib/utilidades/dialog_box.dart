import 'package:flutter/material.dart';
import 'button_dialog_box.dart';

// ignore: must_be_immutable
class DialogBox extends StatefulWidget {
  final TextEditingController controller1;
  final Function(String, TimeOfDay) onSave;
  final VoidCallback onCancel;

  const DialogBox({
    super.key,
    required this.controller1,
    required this.onSave,
    required this.onCancel,
  });

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            timePickerTheme: TimePickerThemeData(
              hourMinuteTextColor: Colors.white,
              dialHandColor: const Color.fromRGBO(132, 218, 213, 1),
              hourMinuteColor: const Color.fromRGBO(32, 31, 31, 1),
              cancelButtonStyle: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromRGBO(21, 21, 21, 1),
      content: SizedBox(
        height: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
              ),
              controller: widget.controller1,
              decoration: const InputDecoration(
                helperStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 0.2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 0.2,
                  ),
                ),
                hintText: 'Add a new Task',
                hintStyle: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(127, 255, 255, 255),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(
                  text: 'Select Time',
                  onPressed: () => _selectTime(context),
                ),
                Text(
                  ('${selectedTime.hourOfPeriod}:${selectedTime.minute}${selectedTime.hour < 12 ? 'am' : 'pm'}'),
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //save button
                MyButton(
                  text: 'Save',
                  onPressed: () {
                    widget.onSave(widget.controller1.text, selectedTime);
                  },
                ),

                //cancel button
                MyButton(text: 'Cancel', onPressed: widget.onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
