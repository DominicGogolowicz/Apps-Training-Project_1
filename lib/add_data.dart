import 'dart:io';

import 'main.dart';

void addToMap() {
  bool addSuccess = false;
  while (addSuccess == false) {
    print("What team would you like the add to the database?");
    String newTeam =
        stdin.readLineSync() ?? "Please type their name, not team number";
    int? newTeamInt = int.tryParse(newTeam);
    if (newTeamInt == null) {
      print("Thank you! What is there team number?");
      String teamNumber = stdin.readLineSync() ?? "Error";
      int? teamNumberInt = int.tryParse(teamNumber);
      if (teamNumberInt == null) {
        print("The team number must be a number, please try again.");
      } else {
        print("What game number are you scouting? Please type it as a number.");
        String gameNumber = stdin.readLineSync() ?? "Error";
        int? gameNumberInt = int.tryParse(gameNumber);
        if (gameNumberInt == null) {
          print("The game number must be a NUMBER");
        } else {
          print("Thank you! How many fuel was collected that game?");
          String newTeamScore = stdin.readLineSync() ?? "Error";
          int? newTeamScoreInt = int.tryParse(newTeamScore);
          if (newTeamScoreInt == null) {
            print("Fuel collected must be a number");
          }
          else {
            Robot bot = Robot(newTeam, teamNumberInt, [
              Game(gameNumberInt, newTeamScoreInt),
            ]);

            teams.add(bot);

            print(
              "Thank you $newTeam($teamNumberInt) has been added to the database with a game $gameNumberInt score of $newTeamScore",
            );
            addSuccess = true;
          }
        }
      }
    } else {
      print("Their name must be a word not a number");
    }
  }
}
