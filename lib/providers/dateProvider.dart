
import 'package:files_tracker_app/classes/file.dart';
import 'package:files_tracker_app/classes/version.dart';
import 'package:flutter/material.dart';

class dataProvider extends ChangeNotifier{



// map of files with file number as key and list of versioins of that file as value

final Map < int , File  > filesMap = {};
DateTime? _selectedDate;



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

    //method to get version list for specefic file
    List<Version> getVersionList(File file){

      return filesMap[file.fileNumber]!.versionsList;
      
    }


  


  // getters 
   DateTime? get selectedDate => _selectedDate;
  

}
