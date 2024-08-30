import 'package:files_tracker_app/classes/version.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class versionScreen extends StatelessWidget {
  const versionScreen({
    
    super.key,
    required this.version
    
    });


  final Version version ;
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.teal,
      appBar: AppBar(

        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text(
          version.title,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.teal.shade50
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
                      version.submitedDate!.toLocal().toString().split(' ')[0],  // .split(' ') return list of items after specefic pattern
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
        
                    if(version.submmitedFile != null) // if there was an attachment
                       
                      TextButton( // show text button withe the file name
        
                        onPressed: (){// open the file when the user click on the nameof the file
                          OpenFile.open(version.submmitedFile!.path); // using open_file package
                        },
                        child: SizedBox( // so we can use SingleChildScrollView
                          width: 170,
                          child: SingleChildScrollView( // scrolling horizontally if the name was too long
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              version.submmitedFile!.name.toString(),
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
                            fontSize: 14,
                            color: Colors.red.shade700
                          ),
                      ),  
        //---------------------------------------------------------------------------------------------------------
                   
                  ]
                ),
                const SizedBox(height: 10,),
               const Divider(thickness: 2, color: Colors.black,),
               const SizedBox(height: 20,),

                //Row for return date

                //Row for retun file



                // edit button 

              ],
            ),
            ),


            
          )
        ],
      ),
    );
  }
}