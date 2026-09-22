import 'dart:ffi';
import 'dart:io';

void runCli(List<String> arguments) {
  bool success = false;
  while (success == false) {
    print("What would you like to do today?");
    print("1: Scout team");
    String option = stdin.readLineSync() ?? "Error";
    int? optionInt = int.tryParse(option);
    if (optionInt == null) {
      print("This is not an option. Please try again.");
    }
    if (optionInt == 1) {
      addToMap();
      success = true;
    }
    if (optionInt == 2) {
      mapView();
      success = true;
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
    print("This is our database $teamScore");
  }
}
