import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:look_good/AllPages/Index.dart';
import 'package:look_good/AllPages/Login.dart';



class Receiving extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return Scaffold(
              body: Center(
                child: Text('Error: ${snapshot.error}'),
              ),
            );
          }
          if(snapshot.connectionState == ConnectionState.done){
            return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, streamsnapshot){
                if(streamsnapshot.hasError){
                  return Scaffold(
                    body: Center(
                      child: Text('Error : ${streamsnapshot.error}'),
                    ),
                  );
                }

                //connection state active
                if (streamsnapshot.connectionState == ConnectionState.active){
                  User _user = streamsnapshot.data;

                  if(_user == null){
                    return Login();
                  }else{
                    return Index();
                  }
                }

                // checking the auth state
                return Scaffold(
                  body: Center(
                    child: Text('auth cehcing '),
                  ),
                );
              },
            );
          }

          return Scaffold(
            body: Center(
              child: Text('Initialization.....'),
            ),
          );
        }
    );

  }
}