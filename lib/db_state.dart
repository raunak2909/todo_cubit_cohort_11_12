abstract class DbState {}

/// initial
/// loading
/// loaded
/// error

class DBInitialState extends DbState{}
class DBLoadingState extends DbState{}
class DBLoadedState extends DbState{
  List<Map<String, dynamic>> todo;
  DBLoadedState({required this.todo});
}
class DBErrorState extends DbState{
  String errorMsg;
  DBErrorState({required this.errorMsg});
}
