import 'package:flutter/material.dart';
import '../validators/validators.dart';
import 'package:flutter/material.dart';
import '../src/app.dart';


class Register extends StatelessWidget{

  Widget build(BuildContext context){
    return MaterialApp(
      title: 'ayman',
      home: Scaffold(
        appBar: AppBar(title: Text('Registration'),),
        body: SingleChildScrollView(
    child: registerWidget(context),
      ),
      ),
      debugShowCheckedModeBanner: false,
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