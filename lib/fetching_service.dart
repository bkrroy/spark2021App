import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class FetchingService extends ChangeNotifier {
  FetchingService(this._firebaseFirestore);

  FirebaseFirestore _firebaseFirestore;

  final String speakers = 'Speakers';
  final String sponsors = 'Sponsors';
  final String prizes = 'Prizes';

  List<String> prizesList = [];
  List<List<String>> speakerList = [];
  List<String> sponsorsList = [];

  /// To fetch the information of all the speakers
  Future<List<List<String>>> getSpeakerInfo() async {
    speakerList = [];
    final collection = await _firebaseFirestore.collection(speakers).get();
    final List<DocumentSnapshot> documents = collection.docs;
    try{
      final String designation = 'designation';
      final String name = 'name';
      final String picURL = 'picUrl';

      documents.forEach((element) async{
        List<String> tempList = [];

        tempList.add(element.data()[name]);
        tempList.add(element.data()[designation]);
        tempList.add(element.data()[picURL]);

        speakerList.add(tempList);
      });
      return speakerList;
    } catch (e) {
      print(e);
      return [[]];
    }
  }
  
  Future<List<String>> getSponsorsList() async {
    sponsorsList = [];
    final collection = await _firebaseFirestore.collection(sponsors).get();
    final List<DocumentSnapshot> documents = collection.docs;
    
    documents.forEach((element) { 
      sponsorsList.add(element.data()['picURL']);
    });

    return sponsorsList;
  }

  Future<List<String>> getPrizesList() async {
    prizesList = [];

    final collection = await _firebaseFirestore.collection(prizes).get();
    final List<DocumentSnapshot> documents = collection.docs;

    documents.forEach((element) {
      prizesList.add(element.data()['first']);
      prizesList.add(element.data()['second']);
      prizesList.add(element.data()['third']);
    });

    return prizesList;
  }

  Future<String> getAnnouncements() async {
    final collection = await _firebaseFirestore.collection('Announcement').doc('docs').get();
    return collection.data()['announcement'];
  }
}
