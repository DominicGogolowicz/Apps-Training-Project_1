import 'dart:ffi';
import 'dart:io';

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
    print("Please choose an action and type its corresponding input AS A NUMBER.");
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
      } else {
        print(
          "That was not an option, but we take it that you are satisfied. If this assumption is incorrect, please reload the page.",
        );
      }
    } else {
      print("This was not an option, please try again.");
    }
  }
}

void addToMap() {
  bool addSuccess = false;
  while (addSuccess == false) {
    print("What team would you like the add to the database?");
    String newTeam = stdin.readLineSync() ?? "Error";
    print("Thank you! What is there team number?");
    String teamNumber = stdin.readLineSync() ?? "Error";
    int? teamNumberInt = int.tryParse(teamNumber);
    if (teamNumberInt == null) {
      print("The elo must be a number, please try again.");
      return;
    } else {
      print(
        "Thank you! Now what is their official FIRST robotics competition elo?",
      );
    }
    String newTeamScore = stdin.readLineSync() ?? "Error";
    int? newTeamScoreInt = int.tryParse(newTeamScore);
    Map<String, int> teamScore = {"Bear Metal": 20000, "Other Random Team": 20};
    if (newTeamScoreInt == null) {
      print("The elo must be a number, please try again.");
      return;
    } else {
      print("What game number are you scouting? Please type it as a number.");
      String gameNumber = stdin.readLineSync() ?? "Error";
      int? gameNumberInt = int.tryParse(gameNumber);
      Map<String, int> teamScore = {
        "Bear Metal": 20000,
        "Other Random Team": 20,
      };
      if (gameNumberInt == null) {
        print("The elo must be a number, please try again.");
        return;
      } else {
        Robot bot = Robot(newTeam, teamNumberInt, [
          Game(gameNumberInt, newTeamScoreInt),
        ]);

        teams.add(bot);

        print(
          "Thank you $newTeam has been added to the database with a score of $newTeamScore",
        );
        addSuccess = true;
      }
    }
  }
}

void mapView() {
  print("Welcome to the FRC database!");
  print("What team would you like to scout?");
  print("Enter their official registered name.");
  String dataViewName = stdin.readLineSync() ?? "Please type an input";
  for (Robot bots in teams) {
    if (dataViewName == bots.teamName) {
      print("$dataViewName's team number is ");
      print(bots.teamNumber);
      for (Game game in bots.games) {
        print("In game number ");
        print(game.gameNumber);
        print("They got a score of ");
        print(game.score);
      }
    }
  }
}

void matchPredictions() {
  bool predictionDecisionsSuccess = false;
  while (predictionDecisionsSuccess == false) {
    print(
      "Hello, are you trying to predict a one on one match, or a three on three?",
    );
    print("1v1 or 3v3?");
    String matchupRobotsPerTeam = stdin.readLineSync() ?? "Error";
    if (matchupRobotsPerTeam == "1v1") {
      predictionDecisionsSuccess = true;
    }
    if (matchupRobotsPerTeam == "3v3") {
      predictionDecisionsSuccess = true;
    } else {
      print(
        "That was not an option, please try again and type your input in the correct format. ",
      );
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
