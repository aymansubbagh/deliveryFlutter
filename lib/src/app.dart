import 'package:flutter/material.dart';
import '../screens/register.dart';
import '../screens/screen.dart';
import '../client/client.dart';
import '../blocs/Provider.dart';
import '../supervisor/supervisorWidget.dart';
import '../delivery_man/DeliveryManWidget.dart';
class App extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Main();
  }
}

class Main extends State<App> {


  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        routes: <String, WidgetBuilder>{
          '/register': (BuildContext context) => RegisterState(),
          '/login': (BuildContext context) => LoginScreen(),
          '/client': (BuildContext context) => ClientScreen(),
          '/supervisor': (BuildContext context) => SupervisorApp(),
          '/delivery': (BuildContext context) => DeliveryState(),
        },
        title: 'Log me in',
        home: LoginScreen(),
      ),
    );
  }
}
