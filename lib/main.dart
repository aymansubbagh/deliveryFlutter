import 'package:flutter/material.dart';
import './src/app.dart';
import './screens/screen.dart';
import './screens/register.dart';
import './client/client.dart';
void main() {
  runApp(MaterialApp(
    home: LoginScreen(),
    routes: <String, WidgetBuilder>{
    '/register': (BuildContext context) => Register(),
      '/login':   (BuildContext context) => LoginScreen(),
      '/client':   (BuildContext context) => ClientScreen(),
  },
    debugShowCheckedModeBanner: false,
  ),
  );
}
//void main () => runApp(ClientScreen());