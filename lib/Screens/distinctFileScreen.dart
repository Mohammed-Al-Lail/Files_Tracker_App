

import 'package:files_tracker_app/Screens/home.dart';
import 'package:files_tracker_app/classes/file.dart';
import 'package:files_tracker_app/utilites/fileDescreptionDialog.dart';

import 'package:files_tracker_app/utilites/myDialog.dart';
import 'package:files_tracker_app/utilites/myTextButton.dart';
import 'package:files_tracker_app/utilites/versionContainer.dart';
import 'package:flutter/material.dart';

class distinctFileScreen extends StatefulWidget {
  const distinctFileScreen({ // constructor
    
    super.key,
    required this.file,
    
    });

  final File file;


  

  @override
  State<distinctFileScreen> createState() => _distinctFileScreenState();
}

class _distinctFileScreenState extends State<distinctFileScreen> {

  
  // Method for add new verion button 
  void addNewVersionMethod(){
    //widget.file.versionsList.add(Version(title: "Version 1", date: DateTime(2022 , 10 , 2)));

    showDialog(
      context: context,
       builder: (BuildContext ctx){

      return  MyDialog( file: widget.file );

      }
    );

  }



  //Method to show the descreption of the file Dialog
  void fileDescreptionButtonMethod(){


    showDialog(
      context: context,
       builder: (BuildContext ctx){

        return fileDescreption(descreption: widget.file.fileDescreption);
    }
      
    );

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      backgroundColor: Colors.teal,
      
      

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
          
          
            children: [
             const SizedBox(height: 30,),
              
              // for file number (text) 
                Row(
          
                  children: [
                    const SizedBox(width: 10,),
                    Text(
                      "File Num:",
                      style: TextStyle(
          
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Colors.teal.shade100
                      ),
                    ),
                    const SizedBox(width: 10,),
          
                    Text(
                      "${widget.file.fileNumber}",
                      style:  TextStyle(
          
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        backgroundColor: Colors.teal.shade900
                      ),
                    ),
          
                  ],
                ),
                const SizedBox(height: 5,),
          
                // for file descreption text + icon
                Row(
          
                  children: [
                    const SizedBox(width: 10,),
                    Text(
                      "File descreption:",
                      style: TextStyle(
          
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Colors.teal.shade100,
                        
                      ),
                    ),
                    const SizedBox(width: 10,),
          
                  // button for file descreption
                    IconButton(
                      onPressed: fileDescreptionButtonMethod, 
                      icon: const Icon(
                        Icons.edit_document,
                        size: 25,
                        color: Colors.white,
                        
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.teal.shade900)
                      ),
                      
                      ),
          
                  ]
                ),
          
                //for add new version Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
          
                  // close the file button
                    MyTextButton(
                      text: "Close File",
                      color: Colors.red.shade700,
                      width: 150,
                      height:45,
                      fontSize: 20, 
                      function: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const home())); // go to home Page
                      }
                      ),
          
                  // add new version Button
                    MyTextButton(
                      text: "Add Version",
                      width: 150,
                      height:45,
                      fontSize: 20, 
                      function: addNewVersionMethod
                      ),
                  ],
                ),
                Divider(color: Colors.grey.shade200, thickness: 0.7,),
          
                 const SizedBox(height: 20,),
          
                 // for versions (Text)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Versions",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade100
                          ),
                        ),
                      ),
                    ],
                  ),
                
          
                const SizedBox(height: 20,),
          
                // list viwe of the versions
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: widget.file.versionsList.length,
                        itemBuilder: (context, index) {
                      
                          return versionContainer(version: widget.file.versionsList[index]);
                        },
                        
                        ),
                    ),
                    const SizedBox(height: 20,)
                 
          
          
            ],
          ),
        ),
      ),
    );


  }
}