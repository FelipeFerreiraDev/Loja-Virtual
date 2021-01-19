import 'dart:io';

import 'package:BJDelivery/models/product.dart';
import 'package:BJDelivery/screens/edi_product/components/image_source_sheet.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class ImagesForm extends StatelessWidget {
  const ImagesForm(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return FormField<List<dynamic>>(
      initialValue: List.from(product.images),
      builder: (state) {
        void onImageSelected(File file) {
          state.value.add(file);
          state.didChange(state.value);
          Navigator.of(context).pop();
        }

        return AspectRatio(
          aspectRatio: 1,
          child: Carousel(
            boxFit: BoxFit.contain,
            images: state.value.map<Widget>((image) {
              return Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  if (image is String)
                    Image.network(
                      image,
                      fit: BoxFit.cover,
                    )
                  else
                    Image.file(
                      image as File,
                      fit: BoxFit.cover,
                    ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        icon: const Icon(Icons.remove),
                        color: Colors.red,
                        onPressed: () {
                          state.value.remove(image);
                          state.didChange(state.value);
                        }),
                  )
                ],
              );
            }).toList()
              ..add(Material(
                  color: Colors.grey[100],
                  child: IconButton(
                      icon: const Icon(Icons.add_a_photo),
                      color: Theme.of(context).primaryColor,
                      iconSize: 50,
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (_) => ImageSourceSheet(
                                  onImageSelected: onImageSelected,
                                ));
                      }))),
            dotSize: 4,
            dotSpacing: 15,
            dotBgColor: Colors.transparent,
            dotColor: Theme.of(context).primaryColor,
            autoplay: false,
          ),
        );
      },
    );
  }
}
