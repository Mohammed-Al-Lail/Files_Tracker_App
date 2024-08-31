import 'package:files_tracker_app/classes/version.dart';
import 'package:files_tracker_app/providers/dataProvider.dart';
import 'package:files_tracker_app/utilites/myTextButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class updateInfoDialog extends StatefulWidget {
   updateInfoDialog({super.key, required this.version});

  Version version; 
  @override
  State<updateInfoDialog> createState() => _updateInfoDialogState();
}

class _updateInfoDialogState extends State<updateInfoDialog> {
  @override
  Widget build(BuildContext context) {

    
    return SingleChildScrollView(
        child: AlertDialog(
         
          
          backgroundColor: Colors.teal.shade300,

          // dialog title

          title:  Text(
            " Edit Version: ${widget.version.title}",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Colors.teal.shade50
            ),
            ),


        // contents of the dialog

          content: Consumer<dataProvider>( // from provider package
            builder: (context, myProvider ,_) {

              return Column( 
                      
                children: [

                //for submission date

                  const SizedBox(height: 10,),
                  Divider(color: Colors.grey.shade300,),
                  Text(
                    "Edit Submission Date",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[350]
                    ),
                  ),

                  IconButton(
                        onPressed: (){ // go to the (datatProvider) class to see the method
                          myProvider.SelectSubmissionDate(context);
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

                        // choosen submission date (Text)
                        if(myProvider.submissiondDate !=null)
                          Text(
                            myProvider.submissiondDate!.toLocal().toString().split(' ')[0], // show the selected date on the screen
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber.shade600,
                              
                            ),
                            ),
                        
              
                        const SizedBox(height: 5,),
                        Divider(color: Colors.grey.shade300,),
                      
                 
                      //  submitted file attachment Section.......

                          Text(
                            "Edit Submitted File",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[350]
                              ),
                            ),
                            const SizedBox(height: 5,),
          
                          // icon button to attach file
                            IconButton(
          
                            onPressed:myProvider.selectSubmittedFile , // you can find this mehod at the top of this file  {this class}
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
                    
                    const SizedBox(height: 10,),
                    Divider(color: Colors.grey.shade300,),
          
                // selecting return Date Section.....
                    Text(
                    "Edit return Date",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[350]
                    ),
                  ),
          
                // icon button to select the return date
                  IconButton(
                        onPressed: (){ // go to the (datatProvider) class to see the method
                          myProvider.selectReturnDate(context,widget.version);
                        }, 
              
                        icon: const Icon( // icon to select return date
                          Icons.date_range_outlined,
                          size: 30,
                          color: Colors.white,
                          
                        ),
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.orange.shade900)
                        ),
                
                        ),

                        // choosen date (Text)
          
                        if(myProvider.returnDate !=null) // if the user choose date from the calander
                          Text(
                            myProvider.returnDate!.toLocal().toString().split(' ')[0], // show the selected date on the screen
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber.shade600,
                              
                            ),
                            )
                        else // else if the date was = null (not selected)
                          Text( // show this text
                            "No date was Sellected",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: Colors.red.shade900
                            ),
                            ) ,
              
                        const SizedBox(height: 5,),
                        Divider(color: Colors.grey.shade300,),
          
             
                        //  return file attachment Section.......
                          Text(
                            "Edit return File",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[350]
                              ),
                            ),
                            const SizedBox(height: 5,),
          
                          // icon button to attach file
                            IconButton(
          
                            onPressed:myProvider.selectReturnFile , // you can find this mehod at the top of this file  {this class}
                             icon: const Icon(
                               Icons.attach_file,
                               size: 30,
                               color: Colors.white,
                               
                             ),
                             style: ButtonStyle(
                               backgroundColor: WidgetStatePropertyAll(Colors.orange.shade900)
                             ),
                             
                    
                             ),
          
                             // if there was an attachment we will add the name of the selected file , {if not , the text will not appear}
                             if(myProvider.returnFile != null)
                                Text(
                                  myProvider.returnFile!.name,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber.shade600
                                  ),
                                  )

                            else // else if the date was = null (not selected)
                              Text( // show this text
                                "No File was Sellected",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.red.shade900
                                ),
                                ) ,
          
                        Divider(color: Colors.grey.shade300,),
                        const SizedBox(height: 10,),
             
          
              //  Buttons Section.........
          
                        // save button
                        MyTextButton(
                          text: "Save", 
                          function: (){
                          // update data
                             myProvider.updateVersionData(widget.version);
                             setState(() {});
                               
                             
                             myProvider.resetData(); // reset the date { this method comes from dataProvider class}
                             Navigator.pop(context); // close the page after adding new version
                             
                                
                            }
                            
                  
              
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
      );
  }
}