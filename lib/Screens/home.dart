import 'package:files_tracker_app/Screens/SerchForFile.dart';
import 'package:files_tracker_app/Screens/addNewFile.dart';
import 'package:files_tracker_app/utilites/myTextButton.dart';
import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      backgroundColor: Colors.teal,

      body: SafeArea(
        child: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          
            children: [
          // manage your files (text)
            Text(
              "Manage Your Files Easier !!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.teal.shade100
              ),
            ),
            const SizedBox(height: 30,),


          // two text buttons
              MyTextButton(
                text: "Add new file ",
                function: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>  addNewFile()));
                },
              ),

              MyTextButton(
                text: "Search for a file ",
                function: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const searchForFile()));
                },
              ),
            ],
          ),
        ),
      ),
    );

  }
}