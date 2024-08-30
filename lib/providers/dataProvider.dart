
import 'package:file_picker/file_picker.dart';
import 'package:files_tracker_app/classes/file.dart';
import 'package:files_tracker_app/classes/version.dart';
import 'package:flutter/material.dart';

class dataProvider extends ChangeNotifier{



// map of files with file number as key and list of versioins of that file as value

final Map < int , File  > filesMap = {};
DateTime? _selectedDate;
PlatformFile? _submittedFile;




//Methods.......

// method for the date
  Future<void> selectDateMethod(BuildContext context) async { // we use (Future) keyword for the things that need time to be completed , and also we use (async) and (await) key words with Future

    // call showDatePicker methdo and use (await) so the value on next lines will depend on this
    final DateTime? picked = await showDatePicker( // by using (await) key word we will not go to the next line until we finish from this block {the benefit of it is that , the next lines may depend on this value so we should wai for it}
      context: context,
      initialDate: _selectedDate ?? DateTime.now(), // ?? DateTime.now() is the defult value
      firstDate: DateTime(2024),
      lastDate: DateTime(2034),

    );
    if (picked != null && picked != _selectedDate) {
        _selectedDate = picked;
    }
    notifyListeners();
  }

// method to reset the date make it = null
  void makeDateNull(){ 
    _selectedDate = null;
    notifyListeners();
  }

  // method to add new file to the map
    void addFile(File file){
      filesMap[file.fileNumber] = file ;
      notifyListeners();
    }

    //method to add version
    void addVersion(File file, Version version){
      filesMap[file.fileNumber]!.versionsList.add(version);
      notifyListeners();
    }

    // method to check if the version name was repeted or not
    bool isVersionNameValid(File file , String versionTitle){

      bool isNameValid=true; // to prevent version name repetion
                
      for(Version version in file.versionsList){ // this loop to check if the name was repeted or not

        if(version.title.toLowerCase() == versionTitle.trim().toLowerCase()){
          isNameValid =false;
        }
      }

        return isNameValid;
    }


    //Method to pick file and return it
  Future<void> selectFile() async { // we use (Future) keyword for the things that need time to be completed , and also we use (async) and (await) key words with Future

    

      // call pickFiles  methdo and use (await) so the value on next lines will depend on this
      final result = await FilePicker.platform.pickFiles(); // using file_picker packge

    // if the result was = null {the user did't choose file}
    if(result == null){
    return ; // return null
    }

  // if the file was not == null { the user choose file}
      _submittedFile = result.files.first; // update the value of the selected file
      
  notifyListeners();

  }
  


  // getters 
   DateTime? get selectedDate => _selectedDate;
   PlatformFile? get submitedFile => _submittedFile;
  

}
