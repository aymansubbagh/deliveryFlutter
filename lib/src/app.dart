
import 'package:flutter/material.dart';
import '../screens/register.dart';
import '../screens/screen.dart';
import '../client/client.dart';
import '../blocs/Provider.dart';
class App extends StatelessWidget{

  Widget build(BuildContext context){
    return Provider(
      child: MaterialApp(
        routes: <String, WidgetBuilder>{
          '/register': (BuildContext context) => Register(),
          '/login':   (BuildContext context) => LoginScreen(),
          '/client':   (BuildContext context) => ClientScreen(),
        },
        title: 'Log me in',
        home: Scaffold(
          body: LoginScreen(),

        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
