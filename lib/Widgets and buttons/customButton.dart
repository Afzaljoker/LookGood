import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool outlinebtn;
  customButton({this.text, this.onPressed,this.outlinebtn});


  @override
  Widget build(BuildContext context) {

    bool _outlinebtn = outlinebtn ?? false;

    return GestureDetector(
      onTap: onPressed,
        child: Container(
        height: 65.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _outlinebtn ? Colors.transparent : Colors.black,
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
              borderRadius: BorderRadius.circular(12.0,
              )
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 10.0,
        ),
        child: Stack(
          children: [
            Text(text?? 'Text',
            style: TextStyle(
              fontSize: 16,
              color:  _outlinebtn ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
            ),
            ),
          ],
        ),
      ),
    );
  }
}
