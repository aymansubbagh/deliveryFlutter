import 'package:flutter/material.dart';

class SupervisorApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SupervisorWidget();
  }
}
class SupervisorWidget extends State<SupervisorApp>{
  final controller = TextEditingController();
  final List<String> clients = new List<String>();
  bool boolValue = false;
  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Supervisor'),
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
          itemCount: clients.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(clients[index]),
              onLongPress: (){
                showDialog(
                    context: context,
                  builder: (context){
                      return AlertDialog(
                        content: Column(
                          children: <Widget>[
                            Text("ahmad murad"),
                            Checkbox(
                              value: boolValue,
                              onChanged: (bool value){
                                setState(() {
                                  boolValue = value;
                                });
                              },
                            ),
                          ],
                        ),
                      );
                  }
                );
              },
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

  Widget orderForm(){
    return SingleChildScrollView(
      child: Container(
        width: 100.0,
        height: 130.0,
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
              FloatingActionButton(
                onPressed: (){
                  setState(() {
                    clients.add(controller.text);

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