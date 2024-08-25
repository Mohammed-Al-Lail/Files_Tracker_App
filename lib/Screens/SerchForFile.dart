import 'package:files_tracker_app/Screens/distinctFileScreen.dart';
import 'package:files_tracker_app/classes/file.dart';
import 'package:files_tracker_app/utilites/myTextField.dart';
import 'package:files_tracker_app/utilites/myTextButton.dart';
import 'package:flutter/material.dart';

class searchForFile extends StatefulWidget {
  const searchForFile({super.key});

  @override
  State<searchForFile> createState() => _searchForFileState();
}

class _searchForFileState extends State<searchForFile> {


    final TextEditingController _fileNumberController = TextEditingController();
    

 // method for the search button   
   void searchButtonMethod(){

    for(int fileNumber in filesMap.keys){

      if( _fileNumberController.text.trim() == fileNumber.toString()){

        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:  const SizedBox(
              height: 30,

              child: Center(
                      
                child: Text(
                    "The file was found ",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: Colors.white
                      ),
                    ),
                  ),
                ),

                    backgroundColor: Colors.green.shade900,
                    duration: const Duration(seconds: 2),
                    
             )
      );

        Future.delayed( // after 3 seconds go to the file page information 
          const Duration(seconds: 3) ,
          () => Navigator.push(context, MaterialPageRoute(builder: (context)=> distinctFileScreen(file: filesMap[fileNumber]!))),
        );

        return; // if we found the required file go out from the method

      }

    }

      

      // if we iterate over all keys and we did not find the file number
        ScaffoldMessenger.of(context).showSnackBar( 
        SnackBar(
          content:  const SizedBox(
              height: 30,

              child: Center(
                      
                child: Text(
                    "The file was't found !!",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: Colors.white
                      ),
                    ),
                  ),
                ),

                    backgroundColor: Colors.red.shade900,
                    duration: const Duration(seconds: 2),
                    
             )
      );

   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.teal,
      
      appBar: AppBar(backgroundColor: Colors.transparent,),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
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
              controller: _fileNumberController,
              label: "File Number",
              maxLength: 8,
              keyboardType: TextInputType.number,
            ),


            const SizedBox(height: 10,),

            // Button to searcg file
            MyTextButton(
              text:"Search" , 
              function: searchButtonMethod
              ),

      ]
    ),

    );
  }
}