part of todo_example;

class TodoModel extends ConceptModel{
  static final String task = 'Todo';
  
  Map<String, ConceptEntities> newEntries() {
    var tasks = new Todos();
    var map = new Map<String, ConceptEntities>();
    map[task] = tasks;
    return map;
  }
  
  Todos get tasks => getEntry(task);
  
  init() {
    var design = new Todo();
    design.setTask('Dartling Design');
    design.setStatus(false);
    tasks.add(design);

    var prototype = new Todo();
    prototype.setTask('Dartling Prototype');
    prototype.setStatus(false);
    tasks.add(prototype);

    var production = new Todo();
    production.setTask('Dartling');
    production.setStatus(false);
    tasks.add(production);
  }

  display() {
    print('Todo Model');
    print('=============');
    tasks.display('Todo');
    print(
      '============= ============= ============= '
      '============= ============= ============= '
    );
  }

}