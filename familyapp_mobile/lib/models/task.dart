class Task {
  final String taskTitle, taskDescription, taskStatus;
  final DateTime taskDeadline;
  final int taskAuthor;

  Task(this.taskTitle, this.taskDescription, this.taskDeadline, this.taskAuthor, this.taskStatus);

  /* factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      taskTitle: json["task_title"],
      taskDescription: json["task_description"],
      taskAuthor: json["task_author"],
      taskDeadline: json["task_deadline"],
      taskStatus: json["task_status"]
    );
  } */
}