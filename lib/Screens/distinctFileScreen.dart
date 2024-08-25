

import 'package:files_tracker_app/classes/file.dart';
import 'package:files_tracker_app/classes/version.dart';
import 'package:files_tracker_app/utilites/myTextButton.dart';
import 'package:files_tracker_app/utilites/myTextField.dart';
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

  final TextEditingController _versionNameController =TextEditingController();
  DateTime? _selectedDate;

// method for the date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(), // ?? DateTime.now() is the defult value
      firstDate: DateTime(2023),
      lastDate: DateTime(2027),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // Method for add new verion button 
  void addNewVersionMethod(){
    //widget.file.versionsList.add(Version(title: "Version 1", date: DateTime(2022 , 10 , 2)));

    showDialog(context: context, builder: (BuildContext ctx){

      return AlertDialog(
        backgroundColor: Colors.teal.shade300,
        title: const Text(
          "Add new Version",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: Colors.white
          ),
          ),
      
        content: Column( // contents of the dialog
      
          children: [
            
            const SizedBox(height: 10,),
            Divider(color: Colors.grey.shade300,),
            Text(
              "Version name",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[350]
              ),
            ),

            myTextField(
              controller: _versionNameController,
              label: "Version name",
              keyboardType: TextInputType.text,
              maxLength: 15,
              ),
              const SizedBox(height: 10,),

              Divider(color: Colors.grey.shade300,),
              Text(
              "Select Date",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[350]
              ),
            ),

            IconButton(
                  onPressed: (){
                    _selectDate(context);
                  }, 
                  icon: const Icon(
                    Icons.date_range_outlined,
                    size: 45,
                    color: Colors.white,
                    
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.teal.shade900)
                  ),
                  splashColor: Colors.white,
                  ),
                  const SizedBox(height: 5,),


                  const SizedBox(height: 30,),
                  

                  // for attachment file


                  Divider(color: Colors.grey.shade300,),
                  // save button
                  MyTextButton(
                    text: "Add", 
                    function: (){

                      if(_versionNameController.text.trim().isNotEmpty && _selectedDate!= null){

                        bool isNameRepeted =false; // to prevent name repetion

                        for(Version version in widget.file.versionsList){ // this loop to check if the name was repeted or not
                          if(version.title == _versionNameController.text.trim()){
                            isNameRepeted =true;
                          }
                        }

                        if(!isNameRepeted){ // if the name was not repeted we will add new version
                        widget.file.versionsList.add(
                          Version(
                            title: _versionNameController.text.trim(), 
                            date: _selectedDate
                            )
                        );
                        }

                        //else show error massege if repeted
                          //.............

                      }
                      // Here we have to show error massage since there is null values
                        // ..............


                      setState((){ // to update the state directly and restart the variables
                        _versionNameController.text="";
                        _selectedDate = null;
                      }); 
                      
                      Navigator.pop(ctx);
                    }
                    )
            
          ],
        ),
      
      );

        

    });

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      backgroundColor: Colors.teal,
      
      appBar: AppBar(backgroundColor: Colors.transparent,),




      body: Column(
      
      
        children: [
          
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

                IconButton(
                  onPressed: (){}, 
                  icon: const Icon(
                    Icons.edit_document,
                    size: 25,
                    color: Colors.white,
                    
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.teal.shade900)
                  ),
                  splashColor: Colors.white,
                  ),

              ]
            ),

            //for add new version Button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                Expanded(
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
    );


  }
}