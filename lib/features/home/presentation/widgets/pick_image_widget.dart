import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mafqud/core/utils/app_colors.dart';

class PickImageWidget extends StatefulWidget {
  const PickImageWidget({super.key});

  @override
  State<PickImageWidget> createState() => _PickImageWidgetState();
}

class _PickImageWidgetState extends State<PickImageWidget> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _showPickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Camera"),
                onTap: () {
                  context.pop();
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text("Gallery"),
                onTap: () {
                  context.pop();
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _showPickerOptions,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.secondaryColor,
            backgroundImage: _image != null ? FileImage(_image!) : null,
            child: _image == null
                ? const Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                    size: 30,
                  )
                : null,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "My post",
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF3F51B5),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
