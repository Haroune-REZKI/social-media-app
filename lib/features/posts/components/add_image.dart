import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_dev_project/features/posts/views/add_post.dart';

final ImagePicker _picker = ImagePicker();

Future<String?> onImageButtonPressed(
  ImageSource source,
  BuildContext context,
) async {
  if (context.mounted) {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 1200,
        maxHeight: 1200,
        imageQuality: 70,
      );
      print("yooo");
      print(pickedFile);

      return pickedFile!.path;
    } catch (e) {
      print("ERROR IN PICK FILE: ${e.toString()}");
    }
    return null;
  }
  return null;
}

class AddImage extends StatefulWidget {
  AddImage({super.key});

  bool showIcon = false;

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        String? path = await onImageButtonPressed(
          ImageSource.camera,
          context,
        );
        if (path != null) {
          // imagesItems.add({'type': 'file', 'imagePath': path});
          // widgetState.setState(() {});
          print("PATH: $path");

          AddPost.addPostController.setImagePath(path);

          setState(() {
            widget.showIcon = true;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            children: [
              const TextSpan(
                text: "Add a picture     ",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              const WidgetSpan(
                child: Icon(
                  Icons.add_a_photo,
                  // size: 20.0,
                  color: Colors.black,
                ),
              ),
              const WidgetSpan(
                child: SizedBox(
                  width: 10,
                ),
              ),
              WidgetSpan(
                child: Visibility(
                  visible: widget.showIcon,
                  child: const Icon(
                    Icons.check_circle_outline_outlined,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
