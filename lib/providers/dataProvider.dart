
import 'package:file_picker/file_picker.dart';
import 'package:files_tracker_app/classes/file.dart';
import 'package:files_tracker_app/classes/version.dart';
import 'package:flutter/material.dart';

class dataProvider extends ChangeNotifier{



// map of files with file number as key and list of versioins of that file as value

final Map < int , File  > filesMap = {};
// Data of the file

DateTime? _submissiondDate;
PlatformFile? _submittedFile;

DateTime? _returnDate;
PlatformFile? _returnFile;




//Methods.......


// method for the submission date
  Future<void> SelectSubmissionDate(BuildContext context) async { // we use (Future) keyword for the things that need time to be completed , and also we use (async) and (await) key words with Future

    // call showDatePicker methdo and use (await) so the value on next lines will depend on this
    final DateTime? picked = await showDatePicker( // by using (await) key word we will not go to the next line until we finish from this block {the benefit of it is that , the next lines may depend on this value so we should wai for it}
      context: context,
      initialDate: _submissiondDate ?? DateTime.now(), // ?? DateTime.now() is the defult value
      firstDate: DateTime(2024),
      lastDate: DateTime(2034),

    );
    if (picked != null && picked != _submissiondDate) {
        _submissiondDate = picked;
    }
    notifyListeners();
  }

  // method for the retur date
  Future<void> selectReturnDate(BuildContext context , Version version) async { // we use (Future) keyword for the things that need time to be completed , and also we use (async) and (await) key words with Future

    // call showDatePicker methdo and use (await) so the value on next lines will depend on this
    final DateTime? picked = await showDatePicker( // by using (await) key word we will not go to the next line until we finish from this block {the benefit of it is that , the next lines may depend on this value so we should wai for it}
      context: context,
      initialDate: _returnDate ?? version.submitedDate , // ?? version.submitedDate is the defult value if the {_returnDate was = null}

      firstDate: DateTime(version.submitedDate!.year , version.submitedDate!.month , version.submitedDate!.day ), // specefay the first date to be the same day of the submittion day so that we can not choose date befor the submission date { year , month , day }
      lastDate: DateTime(2034), // last date

    );
    if (picked != null && picked != _returnDate) {
        _returnDate = picked;
    }
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


// File Methods

// method to add new file to the map
    void addFile(File file){
      filesMap[file.fileNumber] = file ;
      notifyListeners();
    }

  


    //Method to sellect the submited file
  Future<void> selectSubmittedFile() async { // we use (Future) keyword for the things that need time to be completed , and also we use (async) and (await) key words with Future

    

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


  //Method to sellect the submited file
  Future<void> selectReturnFile() async { // we use (Future) keyword for the things that need time to be completed , and also we use (async) and (await) key words with Future

    

      // call pickFiles  methdo and use (await) so the value on next lines will depend on this
      final result = await FilePicker.platform.pickFiles(); // using file_picker packge

    // if the result was = null {the user did't choose file}
    if(result == null){
    return ; // return null
    }

  // if the file was not == null { the user choose file}
      _returnFile = result.files.first; // update the value of the selected file
      
  notifyListeners();

  }
  
  // method to update version data
    void updateVersionData(Version version){

      if(_submissiondDate !=null){ version.submitedDate = _submissiondDate; }
      if(_submittedFile !=null){ version.submmitedFile = _submittedFile; }

      if(_returnDate !=null){ version.returnedDate = _returnDate; }
      if(_returnFile !=null){ version.returnedFile = _returnFile; }
    
      
      notifyListeners();
    }

  // method to reset the data 
    void resetData(){
      _submissiondDate = null ;
      _submittedFile = null ;

      _returnDate = null ;
      _returnFile = null ;
    }


  // getters.... 
   DateTime? get submissiondDate => _submissiondDate;
   PlatformFile? get submitedFile => _submittedFile;

   DateTime? get returnDate => _returnDate;
   PlatformFile? get returnFile => _returnFile;

  

}
