import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit_cohort_11_12/add_todo_page.dart';
import 'package:todo_cubit_cohort_11_12/db_cubit.dart';
import 'package:todo_cubit_cohort_11_12/db_helper.dart';
import 'package:todo_cubit_cohort_11_12/db_state.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<DbCubit>().getInitialTodo();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: BlocBuilder<DbCubit, DbState>(builder: (context, state){
        if (state is DBLoadingState){
          return Center(child: CircularProgressIndicator(),);
        }

        if(state is DBLoadedState){
          List<Map<String, dynamic>> mTodos = state.todo;
          return mTodos.isNotEmpty
              ? ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: CheckboxListTile(
                  value:
                  mTodos[index][DbHelper.column_todo_is_completed] == 1,
                  onChanged: (value) {
                    context.read<DbCubit>().toggleTodo(
                      status: value ?? false,
                      id: mTodos[index][DbHelper.column_todo_id],
                    );
                  },
                  title: Text(mTodos[index][DbHelper.column_todo_title]),
                  subtitle: Text(mTodos[index][DbHelper.column_todo_desc]),
                ),
              );
            },
            itemCount: mTodos.length,
          )
              : Center(child: Text("No Todo's yet!!"));
        }

        if(state is DBErrorState){
          return Center(
            child: Text("Error: ${state.errorMsg}"),
          );
        }

        return Container();
      }),
      floatingActionButton: FloatingActionButton(
        child: Center(child: Icon(Icons.add)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTodoPage()),
          );
        },
      ),
    );
  }
}
