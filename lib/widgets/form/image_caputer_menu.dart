import 'dart:io';

import 'package:authtest/core/colors.dart';
import 'package:authtest/notifier_service.dart';
import 'package:authtest/service_locator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageCaptureMenu extends StatelessWidget {
  final void Function(File file)? onSelectImage;
  final void Function(List<File> files)? onSelectImages;
  final ImagePicker picker = ImagePicker();
  final bool isMultiple;

  ImageCaptureMenu({
    Key? key,
    this.onSelectImage,
    this.onSelectImages,
    this.isMultiple = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          _MenuItem(
            icon: Icons.camera,
            label: 'Камера',
            onPress: () {
              getImage(ImageSource.camera, context);
            },
          ),
          Divider(height: 8),
          _MenuItem(
            icon: Icons.image,
            label: 'Выбрать изображение',
            onPress: () {
              if (isMultiple == true) {
                getImages(context);
              } else {
                getImage(ImageSource.gallery, context);
              }
            },
          ),
        ],
      ),
    );
  }

  Future<void> getImage(ImageSource source, BuildContext context) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null && onSelectImage != null) {
      onSelectImage!(File.fromUri(Uri.file(pickedFile.path)));
      Navigator.of(context).pop();
    }
  }

  Future<void> getImages(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.image,
        allowCompression: true,
      );

      List<File> list = [];

      if (result != null) {
        list = result.paths.map((path) => File(path!)).toList();
      }

      if (list.isNotEmpty && onSelectImages != null) {
        onSelectImages!(list);
        Navigator.of(context).pop();
      }
    } on Exception catch (error) {
      serviceLocator<NotifierService>().showError(
        context: context,
        error: error,
      );
    }
  }
}

class _MenuItem extends StatelessWidget {
  final IconData? icon;
  final String? label;
  final void Function()? onPress;

  const _MenuItem({
    Key? key,
    this.icon,
    this.label,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        child: InkWell(
          enableFeedback: true,
          onTap: () {
            if (onPress != null) {
              onPress!();
            }
          },
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(
                    icon,
                    color: AppColors.primary,
                  ),
                ),
                Text(label!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
