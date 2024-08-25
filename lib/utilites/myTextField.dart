import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class myTextField extends StatelessWidget {

   myTextField({ // constructor
    
    super.key,
    
    required this.label,
    this.controller,
    this.validator,
    this.keyboardType,
    this.maxLength,

    
    });


   String label;
   TextEditingController? controller;
   String? Function(String?)? validator;
   TextInputType? keyboardType;
   int? maxLength;


  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.all(8.0),
      
              child: TextFormField(

                controller: controller,
                keyboardType: keyboardType,
                maxLength:maxLength,
                
              

                decoration: InputDecoration(

                  filled: true,
                  fillColor: Colors.white,
                // max length decoration
                  counterStyle: TextStyle( 
                    fontSize: 12,
                    color: Colors.grey.shade100
                    ),

                  label: Text(
                    label,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade700
                    ),
                    
                    ),
                  
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
               
                  ),
                    
                  // when we click on the text field border
                   focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(
                      width: 4,
                      color: Colors.yellow.shade800
                    )
                  ),
                  
                ),
                
                validator: validator,
              ),
            );
  }
}