import 'dart:io';

import 'main.dart';

void mapView() {
  print("${green}Welcome to the FRC database!");
  print("What team would you like to view?");
  print("Enter their official registered name.");
  String dataViewName = stdin.readLineSync() ?? "Please type an input";
  bool teamFound = false;
  for (Robot bot in teams) {
    if (dataViewName.toLowerCase() == bot.teamName.toLowerCase()) {
      teamFound = true;
    }
  }
  if (teamFound == false) {
    print("No team found matching '$dataViewName'.");
  }
  else if (teamFound == true){
    for (Robot bots in teams) {
      if (dataViewName.toLowerCase() == bots.teamName.toLowerCase()) {
        print("$dataViewName's team number is ${bots.teamNumber}");
        for (Game game in bots.games) {
          print("In game number ${game
              .gameNumber} $dataViewName got a score of ${game.score}");
        }
      }
    }
  }
}
