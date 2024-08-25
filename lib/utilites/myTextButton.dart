import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextButton extends StatelessWidget {
   MyTextButton({
    
    super.key,
    required this.text,
    required this.function,
    
    this.width=200, // defult values
    this.height=60,
    this.fontSize=24

    
    });


  final String text;
  final Function()? function;
   double width;
   double height;
   double? fontSize;
  
  @override
  Widget build(BuildContext context) {

    return Padding(

               padding: const EdgeInsets.all(8.0),
               child: TextButton(
      
                onPressed: function,
      
                style:  ButtonStyle( 
                  
                  backgroundColor: MaterialStatePropertyAll(Colors.yellow.shade800),
                  shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                   )),
                   fixedSize:  MaterialStatePropertyAll(Size(width,height ),)
                 ),
      
                  child:  Text(
                    text,
                   style:  TextStyle(
                     fontSize: fontSize,
                     fontWeight: FontWeight.w900,
                     color: Colors.white
                   ),
                  ),
                  
                  ),
    );
  }
}