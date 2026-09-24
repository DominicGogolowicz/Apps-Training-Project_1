import 'dart:ffi';
import 'dart:io';

void runCli(List<String> arguments) {
  String appName = "FRC Scout";
  bool success = false;
  while (success == false) {
    print("Welcome to $appName");
    print("What would you like to do today?");
    print("1: Scout team");
    print("2: View our database of teams and their score");
    print("3: Predict the outcome of a match");
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
      }
      else {
        print("That was not an option, but we take it that you are satisfied. If this assumption is incorrect, please reload the page.");
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
      }
      else {
        print("That was not an option, but we take it that you are satisfied. If this assumption is incorrect, please reload the page.");
      }
    }
    if (optionInt == 3) {
      matchPredictions();
      print("Are you done using $appName ?");
      print("Yes / No");
      String done = stdin.readLineSync() ?? "Error";
      if (done == "yes") {
        success = true;
      }
      if (done == "no") {
        print("Thank you for using $appName, have a good day!");
      }
      else {
        print("That was not an option, but we take it that you are satisfied. If this assumption is incorrect, please reload the page.");
      }
    }
    else {
      print("This was not an option, please try again.");
    }
  }
}

void addToMap() {
  bool addSuccess = false;
  while (addSuccess == false) {
    print("What team would you like the add to the database?");
    String newTeam = stdin.readLineSync() ?? "Error";
    print(
      "Thank you! Now what is their official FIRST robotics competition elo?",
    );
    String newTeamScore = stdin.readLineSync() ?? "Error";
    int? newTeamScoreInt = int.tryParse(newTeamScore);
    Map<String, int> teamScore = {"Bear Metal": 20000, "Other Random Team": 20};
    if (newTeamScoreInt == null) {
      print("The elo must be a number, please try again.");
    } else {
      teamScore[newTeam] = newTeamScoreInt;
      print(
        "Thank you $newTeam has been added to the database with a score of $newTeamScore",
      );
      addSuccess = true;
    }
  }
  void mapView() {
    print("Welcome to the FRC database!");
    print("This is the data we  currently haveL $teamScore");
    print("If you wish to add more please use function one to add to our database.");
  }
  void matchPredictions() {
    bool predictionDecisionsSuccess = false;
    while (predictionDecisionsSuccess == false) {
      print("Hello, are you trying to predict a one on one match, or a three on three?");
      print("1v1 or 3v3?");
      String matchupRobotsPerTeam = stdin.readLineSync() ?? "Error";
      if (matchupRobotsPerTeam == "1v1") {
        predictionDecisionsSuccess = true;

      }
      if (matchupRobotsPerTeam == "3v3") {
        predictionDecisionsSuccess = true;

      }
      else {
        print(
            "That was not an option, please try again and type your input in the correct format. ");
      }
    }
  }
}
