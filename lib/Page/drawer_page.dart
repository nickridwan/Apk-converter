import 'dart:ui';

import 'package:flutter/material.dart';
import './converter.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile.png'),
              radius: 100,
            ),
            Column(
              children: [
                Wrap(children: [
                  ListTile(
                    title: Text("Ganesha Adhiktya Warman" ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),),
                  ),ListTile(
                    title: Text("20190801475" ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),),
                  ),
                ])
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    );
  }


}
