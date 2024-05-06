abstract class TaskCubitStates {

}

class appIntialState extends TaskCubitStates{

}

class CreateTaskLoadingState extends TaskCubitStates{}
class CreateTaskSuccessState extends TaskCubitStates{}
class CreateTaskErrorState extends TaskCubitStates{}
class GetTaskLoadingState extends TaskCubitStates{}
class GetTaskSuccessState extends TaskCubitStates{}
class GetTaskErrorState extends TaskCubitStates{}

class GetAllTasksLoadingState extends TaskCubitStates{}
class GetAllTasksSuccessState extends TaskCubitStates{}
class GetAllTasksErrorState extends TaskCubitStates{}

class UpdateIDLoadingState extends TaskCubitStates{}
class UpdateIDSuccessState extends TaskCubitStates{}
class UpdateIDErrorState extends TaskCubitStates{}
