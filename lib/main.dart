import 'dart:io';

import 'package:training_2027_project1/predictions.dart';
import 'package:training_2027_project1/view_data.dart';

import 'add_data.dart';

List<Robot> teams = [];

void runCli(List<String> arguments) {
  String appName = "FRC Scout";
  bool success = false;
  while (success == false) {
    print("Welcome to $appName");
    print("What would you like to do today?");
    print("1: Scout team");
    print("2: View our database of teams and their score");
    print("3: Predict the outcome of a match");
    print(
      "Please choose an action and type its corresponding input AS A NUMBER.",
    );
    String option = stdin.readLineSync() ?? "Error";
    int? optionInt = int.tryParse(option);
    if (optionInt == null) {
      print("This is not an option. Please try again.");
    }
    if (optionInt == 1) {
      addToMap();
      print("Are you done using $appName ?");
      print("Yes / No");
      String done = stdin.readLineSync() ?? "Error";
      if (done == "yes") {
        success = true;
      }
      if (done == "no") {
        print("Thank you for using $appName, have a good day!");
      } else {
        print(
          "That was not an option, but we take it that you are satisfied. If this assumption is incorrect, please reload the page.",
        );
        success = true;
      }
    }

    if (optionInt == 2) {
      mapView();
      print("Are you done using $appName ?");
      print("Yes / No");
      String done = stdin.readLineSync() ?? "Error";
      if (done == "yes") {
        success = true;
      }
      if (done == "no") {
        print("Thank you for using $appName, have a good day!");
      } else {
        print(
          "That was not an option, but we take it that you are satisfied. If this assumption is incorrect, please reload the page.",
        );
        success = true;
      }
    }
    if (optionInt == 3) {
      matchPredictions();
      print("Are you done using $appName ?");
      print("Yes / No");
      String done = stdin.readLineSync() ?? "Error";
      if (done == "Yes") {
        success = true;
      }
      if (done == "No") {
        print("Thank you for using $appName, have a good day!");
      } else {
        print(
          "That was not an option, but we take it that you are satisfied. If this assumption is incorrect, please reload the page.",
        );
        success = true;
      }
    }
  }
}

class Robot {
  String teamName;
  int teamNumber;
  List<Game> games;

  Robot(this.teamName, this.teamNumber, this.games);
}

class Game {
  int gameNumber;
  int score;

  Game(this.gameNumber, this.score);
}
