import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit_cohort_11_12/db_cubit.dart';

class AddTodoPage extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add todo")),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: "Title",
                hintText: "Enter your title here..",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                ),
              ),
            ),
            SizedBox(height: 11),
            TextField(
              controller: descController,
              maxLines: 4,
              minLines: 4,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: "Desc",
                hintText: "Enter your desc here..",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                ),
              ),
            ),
            SizedBox(height: 11),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () async {
                    context.read<DbCubit>().addTodo(
                        title: titleController.text, desc: descController.text);
                    Navigator.pop(context);
                  },
                  child: Text("Save"),
                ),
                SizedBox(
                  width: 11,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
