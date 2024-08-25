import 'package:files_tracker_app/utilites/myTextField.dart';
import 'package:files_tracker_app/utilites/myTextButton.dart';
import 'package:flutter/material.dart';

class addNewFile extends StatefulWidget {
   addNewFile({super.key});

  @override
  State<addNewFile> createState() => _addNewFileState();
}

class _addNewFileState extends State<addNewFile> {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.teal,
      
      appBar: AppBar(backgroundColor: Colors.transparent,),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

        Form( // we will use the form so we can validate the text fields
         key: _formKey ,
      

        child: Column(
        
          children: [
        
          // for enter file number (text)
            Text(
              "Enter File Number",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.teal.shade100,
              ),
            ),
            const SizedBox(height: 10,),
          // for File Number
            myTextField(
              label: "File Number",
              maxLength: 8,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10,),
            
            // for enter file descreption (text)
            Text(
              "Enter descreption for the File ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.teal.shade100,
              ),
            ),
            const SizedBox(height: 10,),

            // for File descreption
            myTextField(
              
              label: "File descreption",
              maxLength: 200,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 10,),

            // Button to creat new file
            MyTextButton(
              text:"Creat" , 
              function: (){}
              ),
          ],
        ),
      ),
        ],
      )
    );
  }
}