import 'package:flutter/material.dart';
import 'package:todo_flutter/entity/todo_hub.dart';
import 'package:todo_flutter/ui/todo_detail.dart';
import 'package:todo_flutter/ui/todo_creation.dart';
import 'package:todo_flutter/ui/login.dart';
import 'package:todo_flutter/ui/home.dart';
import 'package:todo_flutter/ui/profile.dart';
import 'package:todo_flutter/ui/sign_up.dart';
import 'package:todo_flutter/ui/forgot_password.dart';

class AppBloc {
  void openTodoDetailPage(context, Todo todo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TodoDetailView(todo),
      )
    );
  }

  void openTodoCreationPage(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TodoCreation(),
      )
    );
  }

  void gotoLoginPage(context) {
     Navigator.pushReplacement(
      context, 
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      )
    );
  }
  void returnLoginPage(context) {
    Navigator.pushAndRemoveUntil(
      context, 
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
      ModalRoute.withName('/'),
    );
  }

  void openSignUpPage(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpPage(),
      )
    );
  }

    void openProfilePage(context, user) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(user),
      )
    );
  }

  void openForgotPasswordPage(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ForgotPassword(),
      )
    );
  }

  void gotoTodoListPage(context) {
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(
        builder: (context) => TodoHome(),
      )
    );
  }

  void returnPage(context) {
    Navigator.pop(context);
  }
}

final appBloc = AppBloc();