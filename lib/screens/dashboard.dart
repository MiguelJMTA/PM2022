import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green[700]
              ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("images/itclogo.png"),
                ),
                accountName: Text('Jose Miguel Tierrablanca'),
                accountEmail: Text("1803042@itcelaya.edu.mx")),
                ListTile(
                  title: Text('Fruit App'),
                  subtitle: Text('Widget Challenge'),
                  leading: Icon(Icons.restaurant,color: Colors.black,),
                  trailing: Icon(Icons.chevron_right,color: Colors.black,),
                  onTap: () {
                    Navigator.pushNamed(context, '/fruitApp');
                  },
                ),
                ListTile(
                  title: Text('Conversor de temperatura'),
                  subtitle: Text('De Celsius a Farenheit y viceversa'),
                  leading: Icon(Icons.change_circle_outlined),
                  trailing: Icon(Icons.chevron_right,color: Colors.black,),
                  onTap: (){Navigator.pushNamed(context, '/conversor');},
                )
          ],
        ),
      ),
    );
  }
}
