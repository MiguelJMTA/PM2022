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
                  backgroundColor: Colors.green[700],
                  backgroundImage: AssetImage("images/itclogo.png"),
                ),
                accountName: Text('Jose Miguel Tierrablanca'),
                accountEmail: Text("18030542@itcelaya.edu.mx")),
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
                ),
                ListTile(
                  title: Text('Login con gradiente'),
                  subtitle: Text('New Login'),
                  leading: Icon(Icons.login),
                  trailing: Icon(Icons.chevron_right,color: Colors.black,),
                  onTap: (){Navigator.pushNamed(context, '/login_screen');},
                ),
                ListTile(
                  title: Text('Notes'),
                  subtitle: Text('Notes screen'),
                  leading: Icon(Icons.note),
                  trailing: Icon(Icons.chevron_right,color: Colors.black,),
                  onTap: (){Navigator.pushNamed(context, '/notes');},
                ), 
                ListTile(
                  title: Text('Movies'),
                  subtitle: Text('Movies screen'),
                  leading: Icon(Icons.movie),
                  trailing: Icon(Icons.chevron_right,color: Colors.black,),
                  onTap: (){Navigator.pushNamed(context, '/movies');},
                ),ListTile(
                  title: Text('About Us'),
                  subtitle: Text('About Us screen'),
                  leading: Icon(Icons.info),
                  trailing: Icon(Icons.chevron_right,color: Colors.black,),
                  onTap: (){Navigator.pushNamed(context, '/about_us');},
                ),
                ListTile(
                  title: Text('Favorite Movies'),
                  subtitle: Text('Favorite Movies screen'),
                  leading: Icon(Icons.favorite_outline),
                  trailing: Icon(Icons.chevron_right,color: Colors.black,),
                  onTap: (){Navigator.pushNamed(context, '/favorite_movies');},
                ),
          ],
        ),
      ),
    );
  }
}
