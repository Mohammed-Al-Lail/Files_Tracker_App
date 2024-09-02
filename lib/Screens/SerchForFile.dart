import 'package:files_tracker_app/Screens/distinctFileScreen.dart';
import 'package:files_tracker_app/providers/dataProvider.dart';
import 'package:files_tracker_app/utilites/myTextField.dart';
import 'package:files_tracker_app/utilites/myTextButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class searchForFile extends StatefulWidget {
  const searchForFile({super.key});

  @override
  State<searchForFile> createState() => _searchForFileState();
}

class _searchForFileState extends State<searchForFile> {


    final TextEditingController _fileNameController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // this key will be used to validate the form
    

 // method for the search button   
   void searchButtonMethod(){

    for(String fileName in Provider.of<dataProvider>(context,listen: false).filesMap.keys){

      if( _fileNameController.text.trim().toLowerCase() == fileName.toString().toLowerCase()){ // use .toLowerCase() to unable the serching in two ways upper case searching and lower case searching

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
          () => Navigator.push(context, MaterialPageRoute(builder: (context)=> distinctFileScreen(file: Provider.of<dataProvider>(context).filesMap[fileName]!))),
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

      body: SingleChildScrollView(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
            children: [
        
              const SizedBox(height: 100,),
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
                "Enter File Name",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.teal.shade100,
                ),
              ),
        
              const SizedBox(height: 10,),
        
            // for File Name
              Form(
                key: _formKey,
        
                child: myTextField(
                  controller: _fileNameController,
                  label: "File Name",
                  maxLength: 15,
                  keyboardType: TextInputType.text,
                  validator: (val) {
                    
                    // conditions....
                    if(_fileNameController.text.trim().length<=5){
                      return "The file Name must be 6 length at least";
                    }
        
                    return null;
                  },
                ),
              ),
        
        
              const SizedBox(height: 10,),
        
              // Button to searcg file
              MyTextButton(
                text:"Search" , 
                function: (){
        
                  if(_formKey.currentState!.validate()){
                    searchButtonMethod() ;
                    _formKey.currentState!.reset(); // to reset the form
        
                  }
                }
                ),
        
                const SizedBox(height: 50,),
        
        ]
            ),
      ),

    );
  }
}