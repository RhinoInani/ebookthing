import 'package:ebookthing/screens/home_screen.dart';
import 'package:ebookthing/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  dynamic currentScreen;
  FSBStatus status;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FoldableSidebarBuilder(
          drawerBackgroundColor: Colors.deepOrange[50],
          status: status,
          drawer: CustomDrawer(
            closeDrawer: (){
              setState(() {
                status = FSBStatus.FSB_CLOSE;
              });
            },
          ),
          screenContents: HomeScreen(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: (){
            setState((){
              status = status == FSBStatus.FSB_OPEN?FSBStatus.FSB_CLOSE:FSBStatus.FSB_OPEN;
            },);
          },
          child: Icon(Icons.menu, color: Colors.black,),
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  final Function closeDrawer;
  final setScreen;

  const CustomDrawer({Key key, this.closeDrawer, this.setScreen}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      color: Colors.white,
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.grey.withAlpha(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(radius: 50,),
                SizedBox(
                  height: 10,
                ),
                Text("Rohin Inani", style: TextStyle(fontSize: 20),)
              ],
            ),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context)=>MainScreen()
                  ),
              );
              closeDrawer();
            },
            leading: Icon(Icons.home, color: Colors.black,),
            title: Text("Home"),
          ),
          Divider(
            height: 5,
            color: Colors.grey,
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context)=>SearchScreen(),
              ),
            );
            closeDrawer();},
            leading: Icon(Icons.search, color: Colors.grey),
            title: Text("Search"),
          ),
          Divider(
            height: 5,
            color: Colors.grey,
          ),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.favorite, color: Colors.red[400],),
            title: Text("Favorites"),
          ),
          Divider(
            height: 5,
            color: Colors.grey,
          ),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.bookmark, color: Colors.blue[300],),
            title: Text("Recomended"),
          ),
          Divider(
            height: 5,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
