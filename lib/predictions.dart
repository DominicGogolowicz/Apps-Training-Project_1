import 'dart:io';
import 'main.dart';

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
