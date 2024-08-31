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
  DateTime? submitedDate;
  DateTime? returnedDate;
  PlatformFile? submmitedFile; // not required
  PlatformFile? returnedFile; // not required



}