
import 'package:flutter/material.dart';
class ClientScreen extends StatefulWidget{

  State<StatefulWidget> createState(){
    return Client();
  }

}

class Client extends State<ClientScreen>{
  final List<String> orders = new List<String>();
  final controller = TextEditingController();

  Widget build(BuildContext context){
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ayman'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){

              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      contentPadding: EdgeInsets.only(bottom: bottom),
                      content: orderForm(),
                    );
                  }
              );


          },
          child: Icon(Icons.add),

        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              drawerHeader(),
              drawerContent(),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(orders[index]),
            );
          },
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
          title: Text('home'),
        ),
        ListTile(
          trailing: Icon(Icons.perm_identity),
          title: Text('edit profile'),
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
          title: Text('notifications'),
        ),
        ListTile(
          trailing: Icon(Icons.close),
          title: Text('logout'),
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

  Widget orderForm(){
    return SingleChildScrollView(
        child: Container(
      width: 260.0,
      height: 320.0,
        child: Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: controller,
            //obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'customer name:',
            ),
          ),
          Container(margin: EdgeInsets.only(top:5),),

          TextFormField(
            //obscureText: true,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'customer phone number:',
            ),
          ),
          Container(margin: EdgeInsets.only(top:5),),


          TextFormField(
            //obscureText: true,
            keyboardType: TextInputType.url,
            decoration: InputDecoration(
              labelText: 'customer location:',
            ),
          ),
          Container(margin: EdgeInsets.only(top:5),),


          TextFormField(
            enableInteractiveSelection: true,
            //obscureText: true,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              labelText: 'customer order:',
            ),


          ),
          Container(margin: EdgeInsets.only(top:5),),
          FloatingActionButton(
            onPressed: (){
              setState(() {
                orders.add(controller.text);

              });
            },
          ),


        ],
      ),
    ),
    ),
    );
  }
}