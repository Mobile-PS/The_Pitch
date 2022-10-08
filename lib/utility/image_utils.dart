import 'dart:io';
import 'dart:typed_data';

import 'package:azblob/azblob.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime_type/mime_type.dart';
import 'package:the_new_pitchapp/utility/color_constants.dart';
import 'package:the_new_pitchapp/utility/colors.dart';
import 'package:the_new_pitchapp/utility/const_string.dart';


const BUCKET_NAME = "thepitchprofileimage";
const CVBUCKET_NAME = "thepitchcv";
const VIDEOBUCKET_NAME = "thepitchvideo";
const BLOBURL = "DefaultEndpointsProtocol=https;AccountName=thestoragepitch;AccountKey=7hGk4OoMu6aG+cyoEXEBfWi5Tq+Dw/h3UNMlz4Q351QksBkVA6FsLQ50Rx/0p1Bv/vm8VP8RvtvTiU7nJl4Pkg==;EndpointSuffix=core.windows.net";

Future<CroppedFile?> getImageCropper(XFile image, double ratioX, double ratioY) async {
      return await ImageCropper().cropImage(
            sourcePath: image.path,
            compressFormat: ImageCompressFormat.jpg,
            compressQuality: 100,
            aspectRatioPresets: [
                  CropAspectRatioPreset.square,
                  CropAspectRatioPreset.ratio3x2,
                  CropAspectRatioPreset.original,
                  CropAspectRatioPreset.ratio4x3,
                  CropAspectRatioPreset.ratio16x9
            ],
            uiSettings: [
                  AndroidUiSettings(
                      toolbarTitle: 'Cropper',
                      toolbarColor: primaryColor,
                      toolbarWidgetColor: Colors.white,
                      initAspectRatio: CropAspectRatioPreset.original,
                      lockAspectRatio: false),
                  IOSUiSettings(
                        title: 'Cropper',
                  )],
      );
}


Future uploadImageToAzure(File imagefile) async {
      try {
            String fileName = imagefile.path
                .split('/')
                .last;
            print(fileName);

            // read file as Uint8List
            Uint8List content = await imagefile.readAsBytes();
            var storage = AzureStorage.parse(BLOBURL);
            //String container = "image";
            // get the mine type of the file
            String? contentType = mime(fileName);
            await storage.putBlob('/$BUCKET_NAME/$fileName', bodyBytes: content,
                contentType: contentType,
                type: BlobType.BlockBlob);
            print("done");
      } on AzureStorageException catch (ex) {
            print(ex.message);
      } catch (err) {
            print(err);
      }
}

Future uploadResumeToAzure(File cvfile) async {
      try {
            String fileName = cvfile.path
                .split('/')
                .last;
            print(fileName);

            // read file as Uint8List
            Uint8List content = await cvfile.readAsBytes();
            var storage = AzureStorage.parse(BLOBURL);
            //String container = "image";
            // get the mine type of the file
            String? contentType = mime(fileName);
            await storage.putBlob('/$CVBUCKET_NAME/$fileName', bodyBytes: content,
                contentType: contentType,
                type: BlobType.BlockBlob);
            print("done");
      } on AzureStorageException catch (ex) {
            print(ex.message);
      } catch (err) {
            print(err);
      }
}


Future uploadVideoToAzure(File videofile) async {
      try {
            String fileName = videofile.path
                .split('/')
                .last;
            print(fileName);

            // read file as Uint8List
            Uint8List content = await videofile.readAsBytes();
            var storage = AzureStorage.parse(BLOBURL);
            //String container = "image";
            // get the mine type of the file
            String? contentType = mime(fileName);
            await storage.putBlob('/$VIDEOBUCKET_NAME/$fileName', bodyBytes: content,
                contentType: contentType,
                type: BlobType.BlockBlob);
            print("done");
      } on AzureStorageException catch (ex) {
            print(ex.message);
      } catch (err) {
            print(err);
      }
}