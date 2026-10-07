import 'dart:io';

import 'main.dart';

void mapView() {
  print("Welcome to the FRC database!");
  print("What team would you like to scout?");
  print("Enter their official registered name.");
  String dataViewName = stdin.readLineSync() ?? "Please type an input";
  for (Robot bots in teams) {
    if (dataViewName == bots.teamName) {
      print("$dataViewName's team number is ${bots.teamNumber}");
      for (Game game in bots.games) {
        print("In game number ${game.gameNumber}");
        print("They got a score of ${game.score}");
      }
    }
  }
}
