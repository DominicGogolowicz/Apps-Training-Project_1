
  import 'dart:io';
  void runCli(List<String> arguments) {
    String dollars = '12345678';
    print('Hello User, What is your username?');
    String input = stdin.readLineSync() ?? 'Thank you';
    if (input == 'Dominic') {
      print('Hello $input now please input your login');
      String login = stdin.readLineSync() ?? 'Thank you';
      if (login == '1234567') {
        print('Welcome $input your account has $dollars in it');
      }
    }
    else {
      print('Incorrect');
      print('Hello User, What is your username?');
      String input = stdin.readLineSync() ?? 'Thank you';
    }

  }
