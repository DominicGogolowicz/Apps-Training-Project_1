
  import 'dart:ffi';
import 'dart:io';
  void runCli(List<String> arguments) {
    List<String> teamNumber = [
      '2046',
      '1234'
    ];
    String? input = stdin.readLineSync() ?? '';
 int index = (teamNumber.indexOf(input));
  teamNumber.add(input);
print(index);
  }
