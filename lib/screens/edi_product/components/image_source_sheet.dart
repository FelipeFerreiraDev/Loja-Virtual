import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceSheet extends StatelessWidget {
  ImageSourceSheet({this.onImageSelected});

  final Function(File) onImageSelected;

  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {

    Future<void> editImage(String path) async {
    final File croppedFile = await ImageCropper.cropImage(
        sourcePath: path,
        aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0), androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Editar Imagem',
          toolbarColor: Theme.of(context).primaryColor,
          toolbarWidgetColor: Colors.white,
        ),);
        if(croppedFile!= null) {
          onImageSelected(croppedFile);
        }
  }

    return BottomSheet(
        onClosing: () {},
        builder: (_) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FlatButton(
                  onPressed: () async {
                    final PickedFile file =
                        await picker.getImage(source: ImageSource.camera);
                    editImage(file.path);
                  },
                  child: const Text('Camêra'),
                ),
                FlatButton(
                  onPressed: () async {
                    final PickedFile file =
                        await picker.getImage(source: ImageSource.gallery);
                    editImage(file.path);
                  },
                  child: const Text('Galeria'),
                ),
              ],
            ));
  }
}
