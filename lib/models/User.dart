import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
class Users {
  String uid, ten, diachi, token, email, date, images, sdt;
  Users({
    required this.uid,
    required this.images,
    required this.ten,
    required this.diachi,
    required this.token,
    required this.date,
    required this.email,
    required this.sdt,
  });

// Future<Users> selectFromFirebase() async {
//   String id = FirebaseAuth.instance.currentUser!.uid as String;
//   try{
//     final ref = FirebaseDatabase.instance.ref();
//     final snapshot = await ref.child('User').child(uid).get();
//     return Users(
//       images: snapshot.value!['image'],
//       ten: snapshot.value!['ten'],
//       uid: snapshot.value!['uid'],
//       diachi: snapshot.value!['diachi'],
//       token: snapshot.value!['token'],
//       date: snapshot.value!['date'],
//       email: snapshot.value!['email'],
//       sdt: snapshot.value!['sdt']);
//     } 
//     on FirebaseException catch (e){
//       return  Users(images: '', ten: '', uid: '', diachi: '', token: '', date: '', email: '',sdt: '');
//     }
//   }
}