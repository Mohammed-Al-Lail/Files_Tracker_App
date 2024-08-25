
import 'package:files_tracker_app/classes/file.dart';
import 'package:files_tracker_app/classes/version.dart';
import 'package:flutter/material.dart';

class dataProvider extends ChangeNotifier{



// map of files with file number as key and list of versioins of that file as value

final Map < int , File  > filesMap = {};
DateTime? _selectedDate;




//Methods.......

// method for the date
  Future<void> selectDateMethod(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(), // ?? DateTime.now() is the defult value
      firstDate: DateTime(2023),
      lastDate: DateTime(2032),

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


    
  


  // getters 
   DateTime? get selectedDate => _selectedDate;
  

}
