import 'package:file_picker/file_picker.dart';

class Version{

  Version({ // constructor

  required this.title,
  required this.date,
  this.pickedFile
  });


  final String title;
  final DateTime? date;
  PlatformFile? pickedFile; // not required


}