import 'package:unittest/unittest.dart';
import 'package:dartlero/dartlero.dart';
import 'package:todo_example/todo_example.dart';

testTodos(Todos tasks) {
  group("Testing Todos", () {
    setUp(() {
      var tasksCount = 0;
      expect(tasks.length, equals(tasksCount));

      var design = new Todo();
      expect(design, isNotNull);
      design.task = 'Dartling Design';
      design.status = false;
      tasks.add(design);
      expect(tasks.length, equals(++tasksCount));

      var prototype = new Todo();
      expect(prototype, isNotNull);
      prototype.task = 'Dartling Prototype';
      prototype.status = true;
      tasks.add(prototype);
      expect(tasks.length, equals(++tasksCount));

      var production = new Todo();
      expect(production, isNotNull);
      production.task = 'Dartling';
      production.status = false;
      tasks.add(production);
      expect(tasks.length, equals(++tasksCount));

      //projects.display('Projects');
    });
    tearDown(() {
      tasks.clear();
      expect(tasks.isEmpty, isTrue);
    });
    test('Add task', () {
      var todo = new Todo();
      expect(todo, isNotNull);
      todo.task = 'modelibra';
      todo.status = false;
      var added = tasks.add(todo);
      expect(added, isTrue);
      tasks.display('Add  a new Task');
    });
    test('Add Task Without Data', () {
      var taskCount = tasks.length;
      var task = new Todo();
      expect(task, isNotNull);
      var added = tasks.add(task);
      expect(added, isTrue);
      tasks.display('Add Project Without Data');
    });
    test('Add Task Not Unique', () {
      var tasksCount = tasks.length;
      var task = new Todo();
      expect(task, isNotNull);
      task.task = 'Dartling';
      var added = tasks.add(task);
      expect(added, isTrue);
      tasks.display('Add Project Not Unique');
    });
    test('From Todo to JSON', () {
      var json = tasks.toJson();
      expect(json, isNotNull);
      print(json);
    });
    test('From JSON to Todo Model', () {
      List<Map<String, Object>> json = tasks.toJson();
      tasks.clear();
      expect(tasks.isEmpty, isTrue);
      tasks.fromJson(json);
      expect(tasks.isEmpty, isFalse);
      tasks.display('From JSON to Todos');
    });
  });
  }

initDisplayModel() {
  TodoModel todoModel = new TodoModel();
  todoModel.init();
  todoModel.display();
}

testModel() {
  TodoModel todoModel = new TodoModel();
  Todos tasks = todoModel.tasks;
  testTodos(tasks);
}

main() {
  testModel();
}
