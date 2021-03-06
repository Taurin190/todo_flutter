import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:todo_flutter/entity/todo_hub.dart';
import 'package:todo_flutter/entity/user.dart';
import 'package:firebase_database/firebase_database.dart';

class TodoApi {
  static const bool Debug = false;
  final _reference = FirebaseDatabase.instance.reference();
  
  Future<List<Todo>> fetchTodoList() async {
    if (Debug) {
      return Todo.fromJsonList(
        json.decode(await rootBundle.loadString("assets/data.json"))
      );
    }
    DataSnapshot d = await _reference.child("todo").once();
    print(d.value);
    if (d.value == null) {
      return [];
    }
    List<Todo> todoList = [];
    d.value.forEach((key, value){
      Todo todo = new Todo({
        'title': value['title'],
        'description': value['description'],
        'createAt': value['createAt']
      });
      todo.key = key;
      todoList.add(todo);
    });
    print(todoList);
    return todoList;
  }

  Future<void> createTodo(Todo todo, User user) async {
    print("Create TODO");
    var newPostRef = _reference.child("todo").push();
    return newPostRef.set({
      'title': todo.title,
      'description': todo.description,
      'createAt': todo.createdAt, 
      'uid': user.uid
    });
  }

  Future<void> closeTodo(String key) async {
    print("Delete TODO");
    return _reference.child("todo").child(key).remove();
  } 
}