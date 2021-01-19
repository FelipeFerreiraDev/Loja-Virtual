import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceSheet extends StatelessWidget {
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: () {},
        builder: (_) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    picker.getImage(source: ImageSource.camera);
                  },
                  child: const Text('Camêra'),
                ),
                FlatButton(
                  onPressed: () {
                    picker.getImage(source: ImageSource.gallery);
                  },
                  child: const Text('Galeria'),
                ),
              ],
            ));
  }
}
