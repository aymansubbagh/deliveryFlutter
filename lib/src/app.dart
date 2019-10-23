
import 'package:flutter/material.dart';
import '../screens/register.dart';
import '../screens/screen.dart';
class App extends StatelessWidget{

  Widget build(BuildContext context){
    return MaterialApp(

      title: 'Log me in',
      home: Scaffold(
        body: Scaffold(
          body: Center(
            child: InkWell(
              child: Text('ayman'),
              onTap: () => {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => LoginScreen()),
                ),
              },
            ),
          ),
        ),

      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
