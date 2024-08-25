import 'package:files_tracker_app/classes/file.dart';
import 'package:files_tracker_app/classes/version.dart';
import 'package:files_tracker_app/providers/dateProvider.dart';
import 'package:files_tracker_app/utilites/myTextButton.dart';
import 'package:files_tracker_app/utilites/myTextField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDialog extends StatefulWidget {
  const MyDialog({
    
    super.key,
    required this.file
    
    });

  final File file ;
  
  @override
  State<MyDialog> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {


final TextEditingController _versionNameController =TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();





  @override
  Widget build(BuildContext context) {


    return SingleChildScrollView(
        child: AlertDialog(
         
          
          backgroundColor: Colors.teal.shade300,
          title: const Text(
            "Add new Version",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Colors.white
            ),
            ),
        
          content: Form(
            key: _formKey,

            child: Consumer<dataProvider>(
              builder: (context, myProvider ,_) {
                return Column( // contents of the dialog
                        
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
                
                    // conditions....
                      validator: (val) {
                        if (_versionNameController.text.isEmpty || _versionNameController.text=="" ){
                          return "Enter version name !!!" ;
                        }
                        // if everything was ok
                        return null;
                        
                      },
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
                            myProvider.selectDateMethod(context);
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
                          // choosen date (Text)
                          if(myProvider.selectedDate!=null)
                            Text(
                              myProvider.selectedDate!.toLocal().toString().split(' ')[0], // show the selected date
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade200,
                                
                              ),
                              )
                          else // if the date was = null
                            Text(
                              "Please Select date",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow.shade700
                              ),
                              ) ,
                
                          const SizedBox(height: 5,),
                        
                        
                          const SizedBox(height: 30,),
                          
                        
                          // for attachment file
                        
                        
                          Divider(color: Colors.grey.shade300,),
                
                          // save button
                          MyTextButton(
                            text: "Add", 
                            function: (){
                        
                              if( _formKey.currentState!.validate() && myProvider.selectedDate != null){
                        
                        //---------------------------------------------------------------------------------------------
                                bool isNameRepeted =false; // to prevent version name repetion
                
                                for(Version version in widget.file.versionsList){ // this loop to check if the name was repeted or not
                                  if(version.title == _versionNameController.text.trim()){
                                    isNameRepeted =true;
                                  }
                                }
                        //---------------------------------------------------------------------------------------------
                        
                                if(!isNameRepeted){ // if the name was not repeted we will add new version
                                myProvider.addVersion(
                                  widget.file,
                                  Version(
                                    title: _versionNameController.text.trim(), 
                                    date: myProvider.selectedDate
                                    ),
                                  
                                   );

                                   setState(() {});
                                     
                                   
                                  
                                Navigator.pop(context); // close the page after adding new version
                
                                 // to update the state directly and restart the variables
                                _versionNameController.text="";
                                  myProvider.makeDateNull();
                              
                
                                }
                        
                                //else show error massege if repeted
                                  //.............
                                  
                                
                              }
                              // Here we have to show error massage since there is null values
                                // ..............
                      
                              
                            }// end of the txt function
                
                          ),
                
                          //close button
                          MyTextButton(
                            text: "Close", 
                            color: Colors.red.shade700,
                            function: (){
                              Navigator.pop(context);
                            },
                            )
                    
                  ],
                );
              }
            ),
          ),
        
        ),
      );


  }
}