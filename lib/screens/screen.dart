import 'package:flutter/material.dart';
import '../blocs/loginBloc.dart';
import '../blocs/Provider.dart';
class LoginScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }

}

class LoginState extends State<LoginScreen>{
  final formKey = GlobalKey<FormState>();
  Widget build(BuildContext context){

    final bloc = Provider.of(context);
    return MaterialApp(
        title: 'ayman',
      home: Scaffold(
        appBar: AppBar(title: Text('Login'),),
        body: SingleChildScrollView(
        child: loginWidget(bloc),
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


  Widget loginWidget(Bloc bloc){

    return Column(
      children: <Widget>[
        Container(margin: EdgeInsets.all(20),),
        emailField(bloc),
        Container(margin: EdgeInsets.all(20),),
        passwordField(bloc),
        Container(margin: EdgeInsets.all(20),),
        submitButton(),
        Container(margin: EdgeInsets.all(20),),
        InkWell(
          child: Text('register now!!'),
          onTap: (){
            Navigator.pushNamed(context, '/register');
          },
        ),
      ],
    );
  }



  Widget emailField(Bloc bloc){
    return StreamBuilder(
      stream: bloc.emailValidate,
      builder: (context, snapshot){
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: 'Email Address',
              errorText: snapshot.error,
              hintText: 'you@example.com',
          ),
          onChanged: bloc.changeEmail,
        );
      },
    );
  }

  Widget passwordField(Bloc bloc){
    return StreamBuilder(
      stream: bloc.passwordValidate,
      builder: (password, snapshot){
        return TextField(
          //obscureText: true,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            errorText: snapshot.error,
            labelText: 'Password',

          ),
          onChanged: bloc.changePassword,
        );
      },
    );
  }

  Widget submitButton(){
    return Center(
      child: RaisedButton(onPressed: (){
          print('wa khra');

      },
      child: Text('Submit'),
      ),

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

}