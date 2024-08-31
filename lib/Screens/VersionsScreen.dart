import 'package:files_tracker_app/classes/version.dart';
import 'package:files_tracker_app/utilites/UpdateInfoDialog.dart';
import 'package:files_tracker_app/utilites/myTextButton.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class versionScreen extends StatefulWidget {
  const versionScreen({
    
    super.key,
    required this.version
    
    });


  final Version version ;

  @override
  State<versionScreen> createState() => _versionScreenState();
}

class _versionScreenState extends State<versionScreen> {


  // Method for Edit verion button 
  void EditVersionMethod(){
    
    showDialog(
      context: context,
       builder: (BuildContext ctx){

      return  updateInfoDialog(version: widget.version);

      }
    );

  }


  // Method to calculate the diffrence between the two dates
    Text findTheDiffOnDaysText(){
      if(widget.version.returnedDate!=null){ // if there was returned date

        Duration diffrenceDayes= widget.version.returnedDate!.difference(widget.version.submitedDate!); // use {.difference} method which is exist on date time class to fine the diffrence between two dates
        
        return Text(
          "${diffrenceDayes.inDays} Days",  // use { .inDays to find the diffrence on daye} , we can find also the diffrence on seconds,hours,......
          style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.amber.shade800,
          ),
        ) ; 
      }
      
      else { // if the returnedDate was = null

        return Text(
          "No response yet",  
          style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: Colors.red.shade800,
          ),
        ) ;   
      }
      
      
    }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.teal,

      appBar: AppBar(

        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text(
          widget.version.title,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.teal.shade50
          ),
        ),

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
      ),


      body: Column(

        children: [

          Center(
            child: Container(
            
              width: MediaQuery.of(context).size.width * 0.8, // 80 % from the screen width
              height: 650,
              margin: const EdgeInsets.only(top: 10),

              decoration: BoxDecoration(
              color: Colors.grey[350],
              borderRadius: const BorderRadius.all(Radius.circular(8))
            ),



            child: Column(

              children: [

              // data Text 
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Data",
                    style: TextStyle(
                      fontSize: 30,
                     fontWeight: FontWeight.w900,
                     
                    ),
                  ),
                ),
                Divider(color: Colors.grey.shade200,),
               const SizedBox(height: 40,),
                //Row for send date

                Row(
        
                  children: [
                    const SizedBox(width: 10,),
                    Text(
                      "Submission Date: ",
                      style: TextStyle(
        
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey.shade600,
                        
                      ),
                    ),
                    const SizedBox(width: 10,),
        
                    Text(
                      widget.version.submitedDate!.toLocal().toString().split(' ')[0],  // .split(' ') return list of items after specefic pattern
                      style:  TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey.shade800,
                        
                      ),
                    ),
        
                    
        
                  ]
                ),

                //Row for send file

                Row(
        
                  children: [
                    const SizedBox(width: 10,),
                    Text(
                      "Submmital: ",
                      style: TextStyle(
        
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey.shade600,
                        
                      ),
                    ),
                    const SizedBox(width: 10,),
        
                    // here we have to provide an attachment file like pdf....
        
        //------------------------------- Considerd as one Widget --------------------------------------------
        
                    if(widget.version.submmitedFile != null) // if there was an attachment
                       
                      TextButton( // show text button withe the file name
        
                        onPressed: (){// open the file when the user click on the nameof the file
                          OpenFile.open(widget.version.submmitedFile!.path); // using open_file package
                        },
                        child: SizedBox( // so we can use SingleChildScrollView
                          width: 170,
                          child: SingleChildScrollView( // scrolling horizontally if the name was too long
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              widget.version.submmitedFile!.name.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blueAccent.shade700
                              ),
                            ),
                          ),
                        ),
                        
                       
                      )
                      
                    else // else if there was no attachment show this text
                      Text(
                        "No files was attached",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Colors.red.shade800,
                          ),
                      ),  
        //---------------------------------------------------------------------------------------------------------
                   
                  ]
                ),
                const SizedBox(height: 10,),
               const Divider(thickness: 2, color: Colors.black,),
               const SizedBox(height: 20,),

                //Row for return date

                  Row(
        
                  children: [
                    const SizedBox(width: 10,),
                    Text(
                      "return Date: ",
                      style: TextStyle(
        
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey.shade600,
                        
                      ),
                    ),

                    const SizedBox(width: 10,),

            //------------------------------- Considerd as one Widget --------------------------------------------

                // for returned date {could be updated later}
                  if(widget.version.returnedDate != null)
                    Text( // if the return date was assigned this text will appear
                      widget.version.returnedDate!.toLocal().toString().split(' ')[0],  // .split(' ') return list of items after specefic pattern
                      style:  TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey.shade800,
                        
                      ),
                    )

                  else
                    Text( // if the return date was not assigned
                      "Not assigned" ,
                      style:TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Colors.red.shade800,
                        
                      ),
                    ),

                 ]
                ),
        // --------------------------------------------------------------------------------------------------------
                    
        
                //Row for retun file

                  const SizedBox(height: 20,),

                  Row(
        
                  children: [
                    const SizedBox(width: 10,),
                    Text(
                      "return: ",
                      style: TextStyle(
        
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey.shade600,
                        
                      ),
                    ),
                    const SizedBox(width: 10,),
        
                    // here we have to provide an attachment file like pdf....
        
        //------------------------------- Considerd as one Widget --------------------------------------------
        
                    if(widget.version.returnedFile != null) // if there was an attachment
                       
                      TextButton( // show text button withe the file name
        
                        onPressed: (){// open the file when the user click on the nameof the file
                          OpenFile.open(widget.version.returnedFile!.path); // using open_file package
                        },
                        child: SizedBox( // so we can use SingleChildScrollView
                          width: 190,
                          child: SingleChildScrollView( // scrolling horizontally if the name was too long
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              widget.version.returnedFile!.name.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blueAccent.shade700
                              ),
                            ),
                          ),
                        ),
                        
                       
                      )
                      
                    else // else if there was no attachment show this text
                      Text(
                        "No files was attached",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Colors.red.shade800,
                          ),
                      ),  
        //---------------------------------------------------------------------------------------------------------
                   
                  ]
                ),

                const SizedBox(height: 10,),
               const Divider(thickness: 2, color: Colors.black,),
               const SizedBox(height: 40,),

        // Section to calculate the diffrence on between the two dates if provided

                Row(

                  children: [
                    
                    const SizedBox(width: 10,),
                    Text(
                      "Responded After: ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey.shade600,
                      ),
                    ),

                    const SizedBox(width: 10,),
                  // for the text of the diffrence on the days
                   findTheDiffOnDaysText()


                  ],
                ),



                const Spacer(),
               Divider(color: Colors.grey.shade200,),
               
                  
                // Edit button 

                  MyTextButton(
                    text: "Edit",
                    color: Colors.blueGrey.shade400, 
                    function: EditVersionMethod
                    ),
                  const SizedBox(height: 20,),

              ],
            ),
            ),


            
          )
        ],
      ),
    );
  }
}