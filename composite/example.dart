// The main class which takes title and subTodos.
class Todo {
  String title;
  List<Todo> subTasks;

  Todo(this.title, this.subTasks);

  @override
  String toString() => "{$title, $subTasks}";
}

// Main todo list class with Todo implementation.
class TodoList implements Todo {
  @override
  List<Todo> subTasks;

  @override
  String title;

  TodoList(this.title, this.subTasks);
}

// Special generated class which is actualy compostie (not a leaf!).
class Project extends Todo {
  Project(String title, List<Todo> subTasks) : super(title, subTasks);
}

void main() {
  List<Todo> todos = [
    // First todo is leaf.
    Todo('First todo', []),

    // Project or (Second todo) is composite.
    Project(
      'Second todo',
      [
        Todo("project's firts todo", []),
        Todo("project's second todo", []),
        Todo("project's third todo", []),
      ],
    ),

    // And of course third todo also is a leaf.
    // Because its list is empty. it hasn't any sub todo.
    // so it can't be a composite, if it hasn'a any sub class/todo.
    Todo('Third todo', [])
  ];

  var todoListClass = TodoList('Todo List', todos);

  print("=== ${todoListClass.title} ===");

  for (var i = 0; i < todoListClass.subTasks.length; i++) {
    print(
      printTODO
          .replaceAll('!', '$i')
          .replaceAll('%t', '${todoListClass.subTasks[i].title}')
          .replaceAll(
              '%sbt', '${todoListClass.subTasks[i].subTasks[i].toString()}'),
    );
  }
}

const String printTODO = """
! =======
  title: %t
  subTasks %sbt

""";
