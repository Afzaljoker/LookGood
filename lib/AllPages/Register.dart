import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:look_good/AllPages/Login.dart';
import 'package:look_good/Widgets%20and%20buttons/customButton.dart';
import 'package:look_good/Widgets%20and%20buttons/input_field.dart';

import '../constants.dart';

class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
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

 Future<String> _createAccount() async {
   try{
     await FirebaseAuth.instance.createUserWithEmailAndPassword
       (email: _registerEmail, password: _registerPassword);
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


    String _createAccountFeedback = await _createAccount();
    if(_createAccountFeedback != null){
      _alertDialogBuilder(_createAccountFeedback);
    }else {
      Navigator.pop(context);
    }
}

  String _registerEmail = '';
  String _registerPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child:Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('lib/Images/Register.gif'),
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
                  child: Text("Simple steps to\n Register",
                    textAlign: TextAlign.center,
                    style: Constant.heading,),
                ),
                Column(
                  children: [
                    input_field(
                      hintText: 'Email',
                      onChanged: (value){
                        _registerEmail = value;
                      },
                    ),
                    input_field(
                      hintText: 'Password',
                      onChanged: (value){
                        _registerPassword = value;
                      },
                      isPasswordField: true,

                    ),
                    input_field(
                      hintText: 'Phone',
                    ),
                    customButton(
                      text: 'Create Account',
                      onPressed: (){
                        _submitForm();

                      },
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 16.0
                  ),
                  child: customButton(
                    text: 'Already Registered ?',
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()
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
