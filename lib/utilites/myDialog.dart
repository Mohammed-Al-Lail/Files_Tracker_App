import 'package:files_tracker_app/classes/file.dart';
import 'package:files_tracker_app/classes/version.dart';
import 'package:files_tracker_app/providers/dataProvider.dart';
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
          title:  Text(
            "Add new Version",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Colors.teal.shade50
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
                        
                    myTextField( //Version name text form field
                      controller: _versionNameController,
                      label: "Version name",
                      keyboardType: TextInputType.text,
                      maxLength: 15,
                      errorFontSize: 12,
                      errorColor: Colors.red.shade700,
                
                    // conditions....
                      validator: (val) {
                        // if the text was empty
                        if (_versionNameController.text.isEmpty || _versionNameController.text=="" ){
                          return "Enter version name !" ;
                        }
                        //if the name of the version already exist on the file
                        if(!myProvider.isVersionNameValid(widget.file, _versionNameController.text)) {
                          return " not valid Version name !!";
                        }
                        // if everything was Ok
                        return null;
                        
                      },
                      ),
                
                      
                      const SizedBox(height: 10,),
                      Divider(color: Colors.grey.shade300,),

                  // selecting Date Section.....
                      Text(
                      "Select Date",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[350]
                      ),
                    ),

                  // icon button to select the date
                    IconButton(
                          onPressed: (){ // go to the (datatProvider) class to see the method
                            myProvider.selectDateMethod(context);
                          }, 
                
                          icon: const Icon( // icon to select date
                            Icons.date_range_outlined,
                            size: 30,
                            color: Colors.white,
                            
                          ),
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(Colors.teal.shade900)
                          ),
                  
                          ),
                          // choosen date (Text)

                          if(myProvider.selectedDate!=null) // if the user choose date from the calander
                            Text(
                              myProvider.selectedDate!.toLocal().toString().split(' ')[0], // show the selected date on the screen
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber.shade600,
                                
                              ),
                              )
                          else // else if the date was = null (not selected)
                            Text( // show this text
                              "Please Select date",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Colors.red.shade900
                              ),
                              ) ,
                
                          const SizedBox(height: 5,),
                          Divider(color: Colors.grey.shade300,),

               
                          //  file attachment Section.......
                          
                            Text(
                              "Attach file",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[350]
                                ),
                              ),
                              const SizedBox(height: 5,),

                            // icon button to attach file
                              IconButton(

                              onPressed:myProvider.selectFile , // you can find this mehod at the top of this file  {this class}
                               icon: const Icon(
                                 Icons.attach_file,
                                 size: 30,
                                 color: Colors.white,
                                 
                               ),
                               style: ButtonStyle(
                                 backgroundColor: WidgetStatePropertyAll(Colors.teal.shade900)
                               ),
                               
                      
                               ),

                               // if there was an attachment we will add the name of the selected file , {if not , the text will not appear}
                               if(myProvider.submitedFile != null)
                                  Text(
                                    myProvider.submitedFile!.name,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber.shade600
                                    ),
                                    ),

                          Divider(color: Colors.grey.shade300,),
                          const SizedBox(height: 10,),
               

                //  Buttons Section.........

                          // save button
                          MyTextButton(
                            text: "Add", 
                            function: (){
                        
                              if( _formKey.currentState!.validate() && myProvider.selectedDate != null){ // if the form was valid and the user select date
                        
                                myProvider.addVersion( // add new Version { see the method on the [dataProvider class] }
                                  widget.file,
                                  Version(
                                    title: _versionNameController.text.trim(), 
                                    submitedDate: myProvider.selectedDate,
                                    submmitedFile: myProvider.submitedFile // this value could be null {not neccessary to have a value here}
                                    ),
                                  
                                   );

                                   
                                    
                                   
                                  
                                Navigator.pop(context); // close the page after adding new version
                
                                 // to update the state directly and restart the variables
                                _versionNameController.text="";
                                  myProvider.makeDateNull(); // reset the date { this method comes from dataProvider class}
                              
                
                              }
                              
                      

                            }// end of the txt function
                
                          ),

                
                          //close button
                          MyTextButton(
                            text: "Close", 
                            color: Colors.red.shade700,
                            function: (){
                              Navigator.pop(context);
                            },
                            ),
                            
                    
                  ],
                );
              }
            ),
          ),
        
        ),
      );


  }
}