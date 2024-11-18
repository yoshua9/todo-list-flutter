import 'package:flutter/material.dart';
import 'package:todoman/core/core.dart';
import 'package:todoman/lib.dart';

class BottomModalToAddTask extends StatefulWidget {
  const BottomModalToAddTask({super.key});

  @override
  State<BottomModalToAddTask> createState() => _BottomModalToAddTaskState();
}

class _BottomModalToAddTaskState extends State<BottomModalToAddTask> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Tag level = Tag.low;
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: .8,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: ColorsApp.primary,
              ),
            ),
            Gaps.vGap20,
            const Text(
              'Crear Tarea',
              style: TextStyle(
                  fontSize: 25,
                  color: ColorsApp.primary,
                  fontWeight: FontWeight.w700),
            ),
            Gaps.vGap30,
            TextField(
              controller: titleController,
              keyboardType: TextInputType.text,
              maxLength: 70,
              decoration: const InputDecoration(
                  labelText: 'Nombre de la tarea',
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
            ),
            Gaps.vGap10,
            TextField(
              controller: descriptionController,
              maxLength: 250,
              maxLines: 3,
              decoration: const InputDecoration(
                  labelText: 'Descripción de la tarea',
                  alignLabelWithHint: true,
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
            ),
            Gaps.vGap10,
            const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nivel de importancia',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                )),
            DropdownButtonFormField<Tag>(
              value: level,
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                setState(() {
                  level = value;
                });
              },
              items: [Tag.high, Tag.low, Tag.medium]
                  .map<DropdownMenuItem<Tag>>((value) {
                String title = '';
                switch (value) {
                  case Tag.low:
                    title = 'Baja';
                    break;
                  case Tag.medium:
                    title = 'Normal';
                    break;
                  case Tag.high:
                    title = 'Urgente';
                    break;
                }
                return DropdownMenuItem<Tag>(
                  value: value,
                  child: Text(
                    title,
                    style: const TextStyle(
                        height: 0.8,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500),
                  ),
                );
              }).toList(),
              menuMaxHeight: 500,
              icon: const Icon(
                Icons.arrow_drop_down_circle_rounded,
                color: Colors.grey,
              ),
              dropdownColor: Colors.indigo.shade100,
              decoration: const InputDecoration(
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                floatingLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 14.0,
                ), // Adjust the padding here
              ),
            ),
            Gaps.vGap30,
            GestureDetector(
              onTap: () {
                if (titleController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty) {
                  final Task task = Task(
                      id: DateTime.now().toIso8601String(),
                      task: titleController.text,
                      level: level,
                      description: descriptionController.text);

                  Navigator.of(context).pop(task);
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: ColorsApp.primary,
                ),
                child: const Text('Crear Tarea',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
