class TaskModel {
  final String name;

  final String time;

  final String date;

  final status ;
  late final task_id ;

  final uid;


  TaskModel({required this.name, required this.time, required this.date , required this.status , required this.task_id ,required  this.uid});

  factory TaskModel.fromJson(Map<String, dynamic>? json){
    return TaskModel(
        uid : json?["uid"],
        name: json?["name"], time : json?["time"], date : json?["date"] , status: json?["status"] , task_id: json?["task_id"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "name" : name,
      "time" : time,
      "date" : date,
      "status" : status,
      "task_id" : task_id,
      "uid" : uid,
    };
  }

}