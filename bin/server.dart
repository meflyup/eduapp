import 'package:redstone/redstone.dart' as app;
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_cors/shelf_cors.dart' as shelf_cors;

@app.Route("/data/")
helloWorld() {
  return getDataFromDB();
}

@app.Route("/data/add", methods: const [app.POST])
addUser(@app.Body(app.JSON) Map user) {
  var data = app.JSON;
  
  return app.JSON.toString() + "got 1youcsfffer data";
}

String getDataFromDB() {
  //todo get data from db.
  return '''["name1","name2","name33","name43"]''';
}

@app.Route("/register/")
register() => "you are now a member";
main() {
  Map corsHeaders1 = {
    "ContentType": "application/json",
    "Access-Control-Allow-Methods": "POST",
    "Access-Control-Allow-Origin": "*"
  };
  shelf.Middleware middleware =
      shelf_cors.createCorsHeadersMiddleware(corsHeaders: corsHeaders1);
  app.setupConsoleLog();
  app.addShelfMiddleware(middleware);
  app.start(port: 90);
  print("fefef");
}
