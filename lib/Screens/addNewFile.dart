import 'package:files_tracker_app/Screens/distinctFileScreen.dart';
import 'package:files_tracker_app/classes/file.dart';
import 'package:files_tracker_app/providers/dateProvider.dart';
import 'package:files_tracker_app/utilites/myTextField.dart';
import 'package:files_tracker_app/utilites/myTextButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class addNewFile extends StatefulWidget {
   addNewFile({super.key});

  @override
  State<addNewFile> createState() => _addNewFileState();
}

class _addNewFileState extends State<addNewFile> {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // this key will be used to validate the form
  final TextEditingController _fileNumberController = TextEditingController();
  final TextEditingController _fileDescreptionController = TextEditingController();


  // method for creat button
  void creatButtonMethod(){


     //_formKey.currentState!.validate(); ==> this return boolean , {true} if (all) conditons satisfied on the form (using validator argument) , and false otherwise even if there was one error it will return false
        if(_formKey.currentState!.validate() ){ // if everything was valid

            Provider.of<dataProvider>(context , listen: false).addFile( // use provider packeg {make listen: false since we are using method }
              File( // add new file to the system
              fileNumber: int.parse(_fileNumberController.text), 
              fileDescreption: _fileDescreptionController.text,
                )  
              );

              // show success massege
              ScaffoldMessenger.of(context).showSnackBar( 
                SnackBar(
                  content:  const SizedBox(
                    height: 30,
                    child: Center(
                      child: Text(
                          "The file was created Successfully",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: Colors.white
                            ),
                          ),
                        ),
                      ),
                          backgroundColor: Colors.green.shade900,
                          duration: const Duration(seconds: 3),
                   ),
            );

            Future.delayed( // after 4 second open the new file page
              const Duration(seconds: 4),
              () => Navigator.push(context, MaterialPageRoute(builder: (context)=> distinctFileScreen(file: Provider.of<dataProvider>(context).filesMap[int.parse(_fileNumberController.text)]!  ))),
              
            );
            

            
            return; // go out the method

        } // end of if valid
  }// end of method







  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.teal,
      
      appBar: AppBar(
        
        leading: Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.teal.shade100
              ),
            
              child: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  
                  color: Colors.black,
                )
                
                ),
            ),

        backgroundColor: Colors.transparent,
        
        ),

      body: Form( // we will use the form so we can validate the text fields
       key: _formKey ,
       
            
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      
        children: [

          // icon for design   
            Container(
              width: 120, 
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.teal.shade50
              ),
              child: const Icon(
              Icons.file_open_outlined,
                size: 100,
                color: Colors.teal,
              
              ),
            ),
            const SizedBox(height: 30,),
      
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
            validator: (val){

            // conditions...

              if(_fileNumberController.text.length!=8){ 
                return "The file number must be 8 length";
              }
              if(Provider.of<dataProvider>(context,listen: false).filesMap.keys.contains(int.parse(_fileNumberController.text))){

                return "This file number alredy exist on the system !!";
              }
              // if every thing was ok
              return null;
            },
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
            controller: _fileDescreptionController,
            label: "File descreption",
            maxLength: 400,
            keyboardType: TextInputType.text,
            validator: (val){

              // condtions ...
              if(_fileDescreptionController.text.length<10){
                return "Write at least 10 long file descreption";
              }

              // if was ok
              return null;
            },
          ),
          const SizedBox(height: 10,),
      
          // Button to creat new file
          MyTextButton(
            text:"Creat" , 
            function: creatButtonMethod,
            ),

            const SizedBox(height: 50,)
        ],
      ),
            )
    );
  }
}