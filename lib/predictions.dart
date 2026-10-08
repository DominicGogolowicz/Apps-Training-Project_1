import 'dart:io';
import 'main.dart';
import 'dart:math';

void matchPredictions() {
  oneOnOne();
}

void oneOnOne() {
  bool predictionsTeams = false;
  while (predictionsTeams == false) {
    print(
      '${orange}What is the first team that you want to put into the prediction engine? Type this as a number',
    );
    String teamNameOneOnOneOne = stdin.readLineSync() ?? "Error";
    int? teamNameOneOnOneOneInt = int.tryParse(teamNameOneOnOneOne);
    if (teamNameOneOnOneOneInt == null) {
      print('Sorry but that was not an option please try again');
    }
    else {
      print('Now what is the next team?');
      String teamNameOneOnOneTwo = stdin.readLineSync() ?? "Error";
      int? teamNameOneOnOneTwoInt = int.tryParse(teamNameOneOnOneTwo);
      if (teamNameOneOnOneTwoInt == null) {
        print('Sorry that is not an option');
      }
      else {
        Robot? firstTeamFound;
        double teamOneAverageScore = 0;
        for (Robot currentTeam in teams) {
          if (currentTeam.teamNumber == teamNameOneOnOneOneInt)  {
            firstTeamFound = currentTeam;
          }
        }
        if (firstTeamFound == null) {
          print(
            "We do not have a team like that in our database, please scout this team if you want to start recording their data",
          );
        } else {
          int teamOneTotalScore = 0;
          int teamOneGameNumber = 0;
          for (Game currentGame in firstTeamFound.games) {
            teamOneTotalScore += currentGame.score;
            teamOneGameNumber++;
          }
          teamOneAverageScore = (teamOneTotalScore / teamOneGameNumber);
        }
        Robot? secondTeamFound;
        double teamTwoAverageScore = 0;
        for (Robot currentTeam in teams) {
          if (currentTeam.teamNumber == teamNameOneOnOneTwoInt)  {
            secondTeamFound = currentTeam;
          }
        }
        if (secondTeamFound == null) {
          print(
            "We do not have a team like that in our database, please scout this team if you want to start recording their data",
          );
        } else {
          int teamTwoTotalScore = 0;
          int teamTwoGameNumber = 0;
          for (Game currentGame in secondTeamFound.games) {
            teamTwoTotalScore += currentGame.score;
            teamTwoGameNumber++;
          }
          teamTwoAverageScore = (teamTwoTotalScore / teamTwoGameNumber);
        }
        if (teamOneAverageScore > teamTwoAverageScore) {
          double difference = teamOneAverageScore - teamTwoAverageScore;
          print("$teamNameOneOnOneOne wins by $difference points!");
          predictionsTeams = true;
        }

        if (teamTwoAverageScore > teamOneAverageScore) {
          double difference = teamTwoAverageScore - teamOneAverageScore;
          print("$teamNameOneOnOneTwo wins by $difference points!");
          predictionsTeams = true;
        }

        if (teamOneAverageScore == teamTwoAverageScore) {
          print("It's a tie!");
          predictionsTeams = true;
        }
      }
    }
  }
}
