import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

void main() async {
  var url =
      'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22';
  http.Response response = await http.get(Uri.parse(url));
  try {
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      var weatherId = decodedData['weather'][0]['id'];
      var temp = decodedData['main']['temp'];
      var name = decodedData['name'];
      print(decodedData);
      print(weatherId);
      print(temp);
      print(name);
    } else {
      print('Failed');
    }
  } catch (e) {
    print(e);
  }
}

void performTask() {
  task1();
  task2();
  task3();
}

void task1() {
  String result = 'task1';
  print('task1 complete');
}

void task2() {
  Duration three = Duration(seconds: 3);

  Future.delayed(three, () {
    String result = 'task2';
    print('task2 complete');
  });
}

void task3() {
  String result = 'task3';
  print('task3 complete');
}
