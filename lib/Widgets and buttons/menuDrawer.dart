import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:look_good/AllPages/profile.dart';
import 'package:look_good/AllPages/settings.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.0),
              color: Colors.blue[800],
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // foto fo the user profile

                      ),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile',
                style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              onTap: () {
                Navigator.push(context, new MaterialPageRoute
                  (builder: (context) => Profile()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting',
                style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              onTap: () {
                Navigator.push(context, new MaterialPageRoute
                  (builder: (context) => settings()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout',
                style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
            ),
          ]
      ),
    );
  }
}