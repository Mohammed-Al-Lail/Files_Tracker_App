
import 'package:files_tracker_app/classes/version.dart';
import 'package:flutter/material.dart';

class versionContainer extends StatelessWidget {
  const versionContainer({
    
    super.key,
    required this.version,
    });

  final Version version;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
      
        width: 300 ,
        height: 200,
      
        decoration: BoxDecoration(
          color: Colors.grey[350],
          borderRadius: const BorderRadius.all(Radius.circular(8))
        ),
      
        child: Column(
      
          children: [
      
            const SizedBox(height: 5,),
            // version Name
              Center(
                child: Text(
                  version.title,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: Colors.black
                  ),
                ),
              ),
              const Divider(color: Colors.white,),
      
              const SizedBox(height: 10,),
      
            // for date 
              Row(
      
                children: [
                  const SizedBox(width: 10,),
                  Text(
                    "Date: ",
                    style: TextStyle(
      
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.grey.shade600,
                      
                    ),
                  ),
                  const SizedBox(width: 10,),
      
                  Text(
                    version.date!.toLocal().toString().split(' ')[0],  // .split(' ') return list of items after specefic pattern
                    style:  TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.grey.shade800,
                      
                    ),
                  ),
      
                  
      
                ]
              ),
      
              const SizedBox(height: 50,),
      
      
      
              // for attachment
              Row(
      
                children: [
                  const SizedBox(width: 10,),
                  Text(
                    "Attachment: ",
                    style: TextStyle(
      
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.grey.shade600,
                      
                    ),
                  ),
                  const SizedBox(width: 10,),
                  // here we have to provide a pdf file
      
                 
                ]
              ),
      
      
      
      
          ],
        ),
      ),
    );


  }
}