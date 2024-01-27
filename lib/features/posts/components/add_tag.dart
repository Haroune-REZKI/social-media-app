import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/features/posts/views/add_post.dart';

class AddTag extends StatefulWidget {
  const AddTag({super.key});

  @override
  State<AddTag> createState() => _AddTagState();
}

class _AddTagState extends State<AddTag> {
  List<String> labels = ['Clubs', 'Pole', 'Campus'];
  List<Color> labelColors = [
    const Color(0xffC5DFDF),
    const Color(0xffFBE7AB),
    const Color(0xffFAD4A6),
    const Color.fromARGB(255, 208, 163, 216)
  ];
  int selectedLabelIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
              'Add a Tag',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: labels.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        AddPost.addPostController.setCategoryId(index + 1);

                        selectedLabelIndex = index;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedLabelIndex == index
                          ? AppColors.main
                          : labelColors[index], // Use the color from the list
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(
                          color: selectedLabelIndex == index
                              ? AppColors.main
                              : Colors.transparent,
                        ),
                      ),
                      elevation: selectedLabelIndex == index
                          ? 8.0
                          : 0.0, // Add elevation for shadow
                    ),
                    child: Text(
                      labels[index], // Use the label from the list
                      style: TextStyle(
                        color: selectedLabelIndex == index
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
