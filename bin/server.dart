import 'package:redstone/redstone.dart' as app;

@app.Route("/head/")
helloWorld() => "Hello, World! dart server";
@app.Route("/register/")
register()=>"you are now a member";
main() {
  app.setupConsoleLog();
  app.start();
}