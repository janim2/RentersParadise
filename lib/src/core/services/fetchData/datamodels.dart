import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataModel extends StatefulWidget {
  @override
  _DataModelState createState() => _DataModelState();
}

class _DataModelState extends State<DataModel> {

  List newData = [];

  addData(){
    Map dataToAdd = {
      "name":"Aberor",
      "Age":22,
      "Description":"Wonderful personality",
      "isHandsome":true,
    };

    CollectionReference collectionReference = FirebaseFirestore.instance.collection("collectionPath");
    collectionReference.add(dataToAdd);
  }

  fetchData(){
  CollectionReference collectionReference = FirebaseFirestore.instance.collection("collectionPath");
  collectionReference.snapshots().listen((event) {
      setState(() {
        newData = event.docs;
      });
  });
  }


  deleteData()async{
  CollectionReference collectionReference = FirebaseFirestore.instance.collection("collectionPath");
  QuerySnapshot querySnapshot = await collectionReference.get();
  querySnapshot.docs[0].reference.delete();
  }


  updateData()async{
  CollectionReference collectionReference = FirebaseFirestore.instance.collection("collectionPath");
  QuerySnapshot querySnapshot = await collectionReference.get();
  querySnapshot.docs[0].reference.update({"name":"Eugene"});
  }



  @override
  Widget build(BuildContext context) {

  List data =[ 
          {"label": "Add","function":(){addData();},},
          {"label": "Fetch","function":(){fetchData();},},
          {"label": "Delete","function":(){deleteData();},},
          {"label": "Update","function":(){updateData();},},
          {"label": "Search","function":(){print("Searching for object ...");},},
          ];    

    return NotificationListener<OverscrollIndicatorNotification>(
    onNotification: (__){
    __.disallowGlow();
    return false;
    },
    child: ListView(
      children: [
        for(int i=0; i <= data.length-1;i++)
        RaisedButton(onPressed: data[i]["function"],
        child:Text(data[i]["label"])),
      ],
    ),
    );
  }
}