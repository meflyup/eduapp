import 'package:redstone/redstone.dart' as app;
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_cors/shelf_cors.dart' as shelf_cors;
import 'package:sqljocky5/sqljocky.dart';
import 'package:sqljocky5/utils.dart';
import 'dart:async';

@app.Route("/data/")
helloWorld() {
  return getDataFromDB();
}

@app.Route("/data/add", methods: const [app.POST])
addUser(@app.Body(app.TEXT) String userData) {
  String data = userData;
  return data;
}

Future<String> getDataFromDB() async {
  var pool = new ConnectionPool(
      host: 'www.muedu.org',
      port: 3306,
      user: 'deit-2015',
      password: 'deit@2015!',
      db: 'project_2015_example',
      max: 5);
  var results = await pool.query('select iduser, firstname,lastname from user');
  //todo get data from db.
  String response;
  await results.forEach((row) {
    response = 'FirstName: ${row[1]}, LastName: ${row[2]}';
  });
  return response;

  // return '''["name1","name2","name33","name43"]''';
}

@app.Route("/register/")
register() => "you are now a member";
main() {
  Map corsHeaders1 = {
    "Access-Control-Allow-Methods": "POST",
    "Access-Control-Allow-Origin": "*",
  };
  shelf.Middleware middleware =
      shelf_cors.createCorsHeadersMiddleware(corsHeaders: corsHeaders1);
  app.setupConsoleLog();
  app.addShelfMiddleware(middleware);
  app.start(port: 90);
  print("fefef");
}
