import 'package:files_tracker_app/utilites/myTextButton.dart';
import 'package:flutter/material.dart';

class fileDescreption extends StatelessWidget {
  const fileDescreption({
    
    super.key,
    required this.descreption,
    
    });

final String descreption;
  @override
  Widget build(BuildContext context) {

    return Dialog(

      
      backgroundColor: Colors.teal.shade300,

      child:   SingleChildScrollView(
        child: Column(
        
          children: [
        
            const SizedBox(height: 10,),
             Text(
              "File description",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.teal.shade50
              ),
            ),
        
            Divider(color: Colors.grey.shade200,thickness: 3,),
            const SizedBox(height: 10,),
        
            //description text
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 10,),
                Text(
                  "description:",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade100
                  ),
                ),
              ],
            ),
            
        
            // File descreption
             Padding(
               padding: const EdgeInsets.all(8.0),
        
               child: Container(
                height: MediaQuery.of(context).size.height*0.55, // the height will be 55 % of the screen size
        
                 decoration:  BoxDecoration(
                   borderRadius: const BorderRadius.all(Radius.circular(10)),
                   color: Colors.teal.shade50,
                 ),
        
                 child: SingleChildScrollView( // the text will be scrollable
        
                   child: Text(
                           descreption,
                           textAlign: TextAlign.center,
                           style:  const TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                             ),
                           ),
                 ),
                   ),
               ),
              
               Divider(color: Colors.grey.shade200,thickness: 0.7,),
        
               // button to edit the file descreption
               MyTextButton(
                text: "Edit", 
                function: (){}
                ),
        
              // button to close the dialog
               MyTextButton(
                text: "Close", 
                color: Colors.red.shade700,
                function: (){
                  Navigator.pop(context);
                }
                ),
          ],
        ),
      )
    );
  }
}