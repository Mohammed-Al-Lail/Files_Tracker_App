import 'package:files_tracker_app/classes/version.dart';

class File {

File({ // constructor

required this.fileNumber,
required this.fileDescreption,


});

final int fileNumber;
String fileDescreption;
final List <Version> versionsList = [];

}





//List of all files on the system

List <File> allFilesList = [

  File(
    fileNumber: 12345678, 
    fileDescreption: "Descreption 1",
    ),

    File(
    fileNumber: 87654321, 
    fileDescreption: "Descreption 2"
    ),

];



// map of files with file number as key and list of versioins of that file as value

Map < int , File  > filesMap = {

12345678: allFilesList[0],
87654321: allFilesList[1],


};