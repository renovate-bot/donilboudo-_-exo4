part of todo_example;

class Todo extends ConceptEntity<Todo>{
  String task;
  bool status = false;
  
  getTask()=> task;
  getStatus()=> status;
  setTask(String task){
    this.task = task;
    if (code == null) {
      code = task;
    }
  }
  setStatus(bool status)=> this.status = status;
  
  Todo Entity()=> new Todo();
 
  Todo copy() {
    var todo = super.copy();
    todo.task = task;
    todo.status = status;
    return todo;
  }

  String toString() {
    return '  {\n '
           '    ${super.toString()}, \n '
           '    Task: ${task}, \n '
           '    Status: ${status}\n'
           '  }';
  }

  Map<String, Object> toJson() {
    Map<String, Object> entityMap = super.toJson();
    entityMap['task'] = task;
    entityMap['status'] = status;
    return entityMap;
  }

  fromJson(Map<String, Object> entityMap) {
    super.fromJson(entityMap);
    task = entityMap['task'];
    status = entityMap['status'];
  }

  bool get taskValidate{
    
  }
      //.contains('Programming') ? true : false;

  int compareTo(Todo other) {
    return task.compareTo(other.task);
  }

  ConceptEntityApi newEntity() {
    // TODO implement this method
  }
}

class Todos extends ConceptEntities<Todo> {

  Todos newEntities() => new Todos();
  Todo newEntity() => new Todo();

}