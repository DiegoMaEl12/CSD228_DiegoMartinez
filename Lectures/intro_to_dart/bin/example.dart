import 'dart:convert';
import 'dart:io';

void main() async {
  final activeDir = Directory.current;
  if(!activeDir.existsSync()){
    throw new Exception("How tf are we running?");
  }
  // activeDir.list().listen((entry){
  //   print(entry.path);
  // });

  var file = File("${activeDir.path}/bin/example.json");
  if (!file.existsSync()) {
    throw Exception("Missing example.csv");
  }

  await file
  .readAsString()
  .then(jsonDecode)
  .then((json) {
    print('Parsed json: $json, rt: ${json.runtimeType}');
    print('Parsed name: ${json['name']}');
    print('Parsed values: ${json['hidden']}');
  })
    //   .readAsLines()
    //   .then((lines) {
    //     lines.forEach((line) {
    //       print(line.split(',').join(" "));
    //   });
    // })
    .catchError((err, st) {
      print('ran into error reading file');
    });
  print(file.statSync());

  print(
    jsonEncode({
      'name': 'inline-json',
      'hidden': false,
      'ts': DateTime.timestamp().toString()
    })
  );

}
