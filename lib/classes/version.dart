import 'package:file_picker/file_picker.dart';

class Version{

  Version({ // constructor

  required this.title,
  required this.submitedDate,
  this.returnedDate,
  this.submmitedFile,
  this.returnedFile,
  });


  final String title;
  final DateTime? submitedDate;
  DateTime? returnedDate;
  PlatformFile? submmitedFile; // not required
  PlatformFile? returnedFile; // not required



// methods 

//method to update the returned date 

void setReturnDate(DateTime? date){
  returnedDate=date;
}

//method to set return file 
void setReturnedFile(PlatformFile? file){
  returnedFile = file;
}

}