import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class DeliveryState extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DeliveryWidget();
  }


}

class DeliveryWidget extends State<DeliveryState>{

  final List<String> clients = new List<String>();
  bool boolValue = false;
  @override
  Widget build(BuildContext context) {
    clients.add('ayman subbagh 0544089753 https://goo.gl/maps/cu13vWivgLYiThUa8');
    clients.add('ahmad murad 0544089753 https://goo.gl/maps/hpYWwZTJSRVE9bH89');
    clients.add('abood murad 0544089753 https://goo.gl/maps/hpYWwZTJSRVE9bH89');
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Delivery'),
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
              onTap: (){
                List order = clients[index].split(' ');
                runApp(MaterialApp(
                  home: Scaffold(
                    appBar: AppBar(
                      title: Text(order[0] + ' ' + order[1]),
                    ),
                    body: Center(
                      child: Column(
                        children: <Widget>[
                          Text('name: ' + order[0] + ' ' + order[1]),
                          Text('phone number: ' + order[2]),
                          InkWell(
                            child: Text('location: ' + order[3]),
                            onTap: () async{
                              print(order[3]);
                              if(await canLaunch(order[3])){
                                await launch(order[3]);
                              }else{
                                throw 'Could not launch $order[3]';
                              }
                            },

                          ),
                        ],
                      ),
                    ),
                  ),
                )
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

}