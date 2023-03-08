

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'UserModel.dart';

class EditUserProfileRepo{

  final db = FirebaseFirestore.instance;
  int count=0 ;
  Future<bool> checkEmail(String currentUser) async {
    var query = await db.collection("Users").doc(currentUser).get() ;
    if (query['email'] == userModel.email) {
      return true ;
    } else {
      QuerySnapshot querySnapshot= await db.collection("Users").get() ;
      querySnapshot.docs.forEach((element) {
        if (element['email']== userModel.email)
        {count ++;}
      });
      print(count);
      if (count>=1) {
        count=0 ;
        return false ;
      }
      count = 0 ;
      return true ; }
  }


  Future<void> readData(String id) async {
    final snapshot = await db.collection('Users').doc(id).get();
    userModel.user_id = snapshot.data()!['user_id'] ;
    userModel.firstname = snapshot.data()!['first_name'] ;
    userModel.lastname = snapshot.data()!['last_name'] ;
    userModel.email = snapshot.data()!['email'] ;
    userModel.address = snapshot.data()!['address'] ;
    userModel.phone_number = snapshot.data()!['phone_number'] ;
    userModel.profile_picture = snapshot.data()!['profile_picture'] ;
    userModel.bio = snapshot.data()!['bio'] ;
    userModel.birth_date = snapshot.data()!['birth_date'] ;
    userModel.company = snapshot.data()!['company'] ;
    userModel.role = snapshot.data()!['role'] ;
    userModel.password = snapshot.data()!['password'] ;
  }

  Future<bool> updateData(String doc) async {
    try {
      await db.collection('Users').doc(doc).update(userModel.toJson());
      return true ;
    }
    catch (e) {
      return false ;
    }
  }


  Future<MemoryImage> loadImage(String imageUrl) async {
    RegExp regExp = RegExp(r'.+(\/|%2F)(.+)\?.+');
    print(imageUrl) ;
    //This Regex won't work if you remove ?alt...token
    Iterable<RegExpMatch> matches = regExp.allMatches(imageUrl);
    print(matches);
    var match = matches.elementAt(0);
    var name = Uri.decodeFull(match.group(2)!);
    final ref = FirebaseStorage.instance.ref("TestFolder/"+name);
    Uint8List? imageBytes = await ref.getData(10 * 1024 * 1024);
    return  MemoryImage(imageBytes!);

  }


}


EditUserProfileRepo editUserProfileRepo = EditUserProfileRepo();