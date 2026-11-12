import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit_cohort_11_12/db_helper.dart';

class DbCubit extends Cubit<List<Map<String, dynamic>>>{
  DbHelper dbHelper;
  DbCubit(this.dbHelper) : super([]);

  getInitialTodo() async {
    var todos = await dbHelper.fetchAllTodo();
    emit(todos);
  }

  addTodo({required String title, required String desc}) async {
    bool isAdded = await dbHelper.insertTodo(title: title, desc: desc);
    if (isAdded){
      getInitialTodo();
    }
  }

  toggleTodo({required bool status, required int id}) async {
    bool isUpdated = await dbHelper.updateTodoStatus(status: status, id: id);
    if(isUpdated){
      getInitialTodo();
    }
  }

}