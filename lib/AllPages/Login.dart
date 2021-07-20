

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:look_good/AllPages/Register.dart';
import 'package:look_good/Widgets%20and%20buttons/customButton.dart';
import 'package:look_good/Widgets%20and%20buttons/input_field.dart';
import 'package:look_good/constants.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<void> _alertDialogBuilder(String error) async{
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text('Error'),
        content: Container(
          child: Text(error),
        ),
        actions: [
          FlatButton(
            child: Text('Close dialog'),
            onPressed: (){
              Navigator.pop(context);
            },
          )
        ],
      );
    });
  }

  Future<String> _loginAccount() async {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword
        (email: _loginEmail, password: _loginPassword);
      return null;
    }on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  void _submitForm() async{


    String _signInFeedBack = await _loginAccount();
    if(_signInFeedBack != null){
      _alertDialogBuilder(_signInFeedBack);
    }
  }

  String _loginEmail = '';
  String _loginPassword = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/Images/Login.gif'),
              fit: BoxFit.cover
            )
          ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment .spaceBetween,

        children: [
          Container(
            padding: EdgeInsets.only(
              top: 24.0
            ),
            child: Text("Welcome to LookGood \nOnline shopping App",
            textAlign: TextAlign.center,
            style: Constant.heading,),
          ),
          Column(
            children: [
              input_field(
                hintText: 'Email',
                onChanged: (value){
                  _loginEmail = value;
                },
              ),
              input_field(
                hintText: 'Password',
                onChanged: (value){
                  _loginPassword = value;
                },
              ),
              customButton(
                text: 'Login',
                onPressed: (){
                  _submitForm();
                },
              )
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(
              bottom: 16.0
            ),
            child: customButton(
              text: 'Create a New Account',
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => register()
                    )
                );
              },
              outlinebtn: true,
            ),
          ),
         ],
        ),
      ),
     )
    );
  }
}
