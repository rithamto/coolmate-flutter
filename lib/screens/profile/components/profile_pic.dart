import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePic extends StatefulWidget { 
  const ProfilePic({Key? key,}) : super(key: key);

  @override
  _ProfilePicState createState() => _ProfilePicState();
  }

class _ProfilePicState extends State<ProfilePic>{
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    final storageRef = FirebaseStorage.instance.ref();
    final imagesRef = storageRef.child(uid);   
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: FileImage(File('/data/user/0/com.example.coolmate/app_flutter/' + uid + '.png')),
            radius: 50.0,
            key: UniqueKey(),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.white),
                  ),
                  primary: Colors.white,
                  backgroundColor: const Color(0xFFF5F6F9),
                ),
                onPressed: () async {
                  
                  File? _photo;
                  final pickedFile = await ImagePicker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    _photo = File(pickedFile.path); 
                  }
                  try {
                    await imagesRef.putFile(_photo!);
                    final downloadUrl = (await imagesRef.getDownloadURL());
                    final Directory x = await getApplicationDocumentsDirectory();
                    String duplicateFilePath = x.path;
                    final File localImage = await _photo.copy(('$duplicateFilePath/$uid' + '.png'));
                    final DatabaseReference ref = FirebaseDatabase.instance.ref("User");
                    await ref.update({                 
                      "$uid/image": downloadUrl,
                    });
                  } on FirebaseException catch (e) {}  
                  imageCache.clear();
                  imageCache.clearLiveImages();    
                  setState(() {
                    
                  });          
                },
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}