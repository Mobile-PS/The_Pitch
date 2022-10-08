import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:the_new_pitchapp/User_Profile/widget/personal_textform_widget.dart';
import 'package:the_new_pitchapp/controller/profile_screen_controller.dart';
import 'package:the_new_pitchapp/login/login.dart';
import 'package:the_new_pitchapp/signup/signup_textform_widget.dart';
import 'package:the_new_pitchapp/utility/colors.dart';
import 'package:the_new_pitchapp/utility/common.dart';
import 'package:the_new_pitchapp/utility/widget/default_button.dart';
import 'package:the_new_pitchapp/login/widget/textform_widget.dart';
import 'package:video_player/video_player.dart';

class PersonalUplodFormWidget extends StatefulWidget {
  const PersonalUplodFormWidget({Key? key}) : super(key: key);

  @override
  State<PersonalUplodFormWidget> createState() => _PersonalUplodFormWidgetState();
}

class _PersonalUplodFormWidgetState extends State<PersonalUplodFormWidget> {

  final profileCtrl = Get.put(ProfileScreenController());

  VideoPlayerController? _videoPlayerController;

  final ImagePicker picker = ImagePicker();

  _pickVideoFromCamera() async {
    final XFile? video = await picker.pickVideo(source: ImageSource.camera,maxDuration: Duration(seconds: 15));

    if(video !=null) {
      File _cameraVideo = File(video.path);
      // profileCtrl.updateVideo(_cameraVideo);

      if (_cameraVideo != null) {
        profileCtrl.updateVideoType('Record');
        _videoPlayerController = VideoPlayerController.file(_cameraVideo)
          ..initialize().then((_) {
            profileCtrl.updateVideo(_cameraVideo);
            _videoPlayerController!.play();
          });
      }
    }
  }

  _pickVideoFromGallary() async {
    final XFile? video = await picker.pickVideo(source: ImageSource.gallery,maxDuration: Duration(seconds: 15));
    if(video !=null) {
      File _cameraVideo1 = File(video.path);
      // profileCtrl.updateVideo(_cameraVideo);
      if (_cameraVideo1 != null) {
        profileCtrl.updateVideoType('Upload');
        _videoPlayerController = VideoPlayerController.file(_cameraVideo1)
          ..initialize().then((_) {
            if (_videoPlayerController!.value.duration.inSeconds! > 30) {
              profileCtrl.updateVideo(_cameraVideo1);
              showSnackbar('we only allow 30 second video');
            }
            else {
              profileCtrl.updateVideo(_cameraVideo1);
              _videoPlayerController?.play();
            }
          });
      }
    }
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    if(_videoPlayerController !=null) {
      _videoPlayerController?.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {

    profileCtrl.init(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenController>(builder: (_)
    {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*Container(
                  height: 50,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: buttonColor),
                    color: buttonColor1,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.description,
                        color: buttonColor,
                      ),
                      SizedBox(width: 5,),
                      Text(
                        'Preview',
                        style: TextStyle(
                            color: buttonColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),*/
                SizedBox(width: 5,),
              /*  Container(
                  height: 50,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.redAccent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.clear,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),*/
              ],),
            SizedBox(height: 15,),
            DefaultButton(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 1.5,
                height: 50,
                text: 'Upload Resume ',
                press: () async{

                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      allowMultiple: false,
                      type: FileType.custom,
                      allowedExtensions: ['jpg', 'pdf', 'doc'],
                    );

                    if (result != null) {
                      File file = File(result.files.single.path!);
                      profileCtrl.updateCV(file);
                    }

                    //  Get.to(SignIn());

                }),
            SizedBox(
              height: 5,
            ),
            Align(
                alignment: Alignment.center,
                child:
                Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.black),
                        image: DecorationImage(
                          fit: BoxFit.scaleDown,
                          image: profileCtrl.selectedResume != null ?
                          FileImage(profileCtrl.selectedResume!):
                          profileCtrl.resumeURL != null? NetworkImage(profileCtrl.resumeURL!):
                          AssetImage("assets/images/avatar.png") as ImageProvider,
                        )))),
            SizedBox(
              height: 50,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*Container(
                  height: 50,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: buttonColor),
                    color: buttonColor1,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.video_collection_outlined,
                        color: buttonColor,
                      ),
                      SizedBox(width: 5,),
                      Text(
                        'Preview',
                        style: TextStyle(
                            color: buttonColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),*/
                SizedBox(width: 5,),
               /* Container(
                  height: 50,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.redAccent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.clear,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),*/
              ],),
            SizedBox(height: 15,),
            DefaultButton(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 1.5,
                height: 50,
                text: 'Upload Video',
                press: ()  {
                  showVideoSelectionDialog(context, () async {

                    _pickVideoFromGallary();
                  }, () async {

                    _pickVideoFromCamera();
                    /*final XFile video = await _picker.pickVideo(
                            source: ImageSource.camera, maxDuration: Duration(seconds: 30));
                        if (video != null) {
                          File cropped = File(video.path);
                          if (cropped != null) {
                            profileCtrl.updateVideo(cropped);
                            //_controller.updateTopViewImage(cropped);
                          }
                        }*/
                  });
                },),
            SizedBox(height: 15,),

            profileCtrl.videoURL !=null?
            _videoPlayerController!= null
                ? Container(
                width: 250,
                height: 250,
                child:
                GestureDetector(
                  onTap: () {
                    if(_videoPlayerController!.value.isPlaying){
                      _videoPlayerController?.pause();
                    }
                    else {
                      _videoPlayerController?.play();
                    }
                  },
                  child:
                  VideoPlayer(_videoPlayerController!),
                )):SizedBox.shrink():
            profileCtrl.selectedVideo !=null?_videoPlayerController!= null
                ? Container(
                width: 150,
                height: 150,
                child:
                GestureDetector(
                  onTap: () {
                    if(_videoPlayerController!.value.isPlaying){
                      _videoPlayerController?.pause();
                    }
                    else {
                      _videoPlayerController?.play();
                    }
                  },
                  child:
                  VideoPlayer(_videoPlayerController!),
                )):SizedBox.shrink():Text('No Video selected'),
            SizedBox(
              height: 10,
            ),
            //SizedBox(height: 15,),
            DefaultButton(
              width: 150,
              height: 50,
              text: 'Save',
              press: ()  {
                profileCtrl.init(context);
                profileCtrl.uploadResumeToAzure();
              },),
            SizedBox(height: 50,),

          ],
        ),
      );
    });
  }
}
