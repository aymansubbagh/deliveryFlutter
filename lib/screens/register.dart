import 'package:flutter/material.dart';
import '../validators/validators.dart';
import 'package:flutter/material.dart';
import '../src/app.dart';

class RegisterState extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Register();
  }

}
class Register extends State<RegisterState>{

  Widget build(BuildContext context){
    return MaterialApp(
      title: 'ayman',
      home: Scaffold(
        appBar: AppBar(title: Text('Registration'),),
        body: SingleChildScrollView(
    child: registerWidget(context),
      ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              drawerHeader(),
              drawerContent(),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget drawerContent(){
    return Column(
      children: <Widget>[
        ListTile(
          trailing: Icon(Icons.home),
          title: Text('login'),
          onTap: (){
            Navigator.pushNamed(context, '/login');
          },
        ),
        ListTile(
          trailing: Icon(Icons.perm_identity),
          title: Text('register'),
          onTap: (){
            Navigator.pushNamed(context, '/register');
          },
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                  )
              )
          ),
        ),
        ListTile(
          trailing: Icon(Icons.notifications),
          title: Text('client'),
          onTap: (){
            Navigator.pushNamed(context, '/client');
          },
        ),
        ListTile(
          trailing: Icon(Icons.close),
          title: Text('supervisor'),
          onTap: (){
            Navigator.pushNamed(context, '/supervisor');
          },
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                  )
              )
          ),
        ),
        ListTile(
          trailing: Icon(Icons.notifications),
          title: Text('delivery'),
          onTap: (){
            Navigator.pushNamed(context, '/delivery');
          },
        ),
      ],
    );
  }

  Widget drawerHeader(){
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage('assets/images/download.png'),
          fit: BoxFit.fill,
        ),
        color: Colors.blue,

      ), child: null,
    );
  }





  // register widget
  Widget registerWidget(BuildContext context){
    return Column(
      children: <Widget>[
        Container(margin: EdgeInsets.all(20),),
        nameField(),
        Container(margin: EdgeInsets.all(20),),
        phoneField(),
        Container(margin: EdgeInsets.all(20),),
        emailField(),
        Container(margin: EdgeInsets.all(20),),
        passwordField(),
        Container(margin: EdgeInsets.all(20),),
        passwordField(),
        Container(margin: EdgeInsets.all(20),),
        submitButton(context),
      ],
    );
  }


  //name field widget
  Widget nameField(){
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Name',
        hintText: 'your full name',
      ),

    );
  }


//phone field widget
  Widget phoneField(){
    return TextFormField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: 'Phone Number',
        hintText: '+966544089753',
      ),

    );
  }



  // email field widget
  Widget emailField(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),

    );
  }


  //password field
  Widget passwordField(){
    return TextFormField(
      //obscureText: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Password',
      ),
    );
  }



  //submit button field
  Widget submitButton(BuildContext context){
    return Center(
      child: RaisedButton(
        onPressed: (){
        Navigator.pushNamed(context, '/client');

      },
        child: Text('Submit'),
      ),

    );
  }


}