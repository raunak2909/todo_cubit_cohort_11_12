import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit_cohort_11_12/db_helper.dart';
import 'package:todo_cubit_cohort_11_12/db_state.dart';

class DbCubit extends Cubit<DbState>{
  DbHelper dbHelper;
  DbCubit(this.dbHelper) : super(DBInitialState());

  getInitialTodo() async {
    emit(DBLoadingState());
    var todos = await dbHelper.fetchAllTodo();
    emit(DBLoadedState(todo: todos));
  }

  addTodo({required String title, required String desc}) async {
    emit(DBLoadingState());

    await Future.delayed(Duration(seconds: 10));

    bool isAdded = await dbHelper.insertTodo(title: title, desc: desc);
    if (isAdded){
      getInitialTodo();
    } else {
      emit(DBErrorState(errorMsg: "Something went wrong!!"));
    }
  }

  toggleTodo({required bool status, required int id}) async {
    emit(DBLoadingState());
    bool isUpdated = await dbHelper.updateTodoStatus(status: status, id: id);
    if(isUpdated){
      getInitialTodo();
    } else {
      emit(DBErrorState(errorMsg: "Something went wrong!!"));
    }
  }

}

/// Expense UI - git repo - mail
/// Wallpaper UI - git repo - mail
/// Todo App with Cubit - git repo - mail
/// Notes App with Cubit - git repo - mail
/// Todo App with Provider - git repo - mail
/// Notes App with Provider - git repo - mail
