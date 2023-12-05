import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';

class AddTag extends StatefulWidget {
  const AddTag({super.key});

  @override
  State<AddTag> createState() => _AddTagState();
}

class _AddTagState extends State<AddTag> {
  List<String> labels = ['Ensia', 'Ensm', 'Campus', 'Clubs'];
  List<Color> labelColors = [
    Color(0xffC5DFDF),
    Color(0xffFBE7AB),
    Color(0xffFAD4A6),
    const Color.fromARGB(255, 208, 163, 216)
  ];
  int selectedLabelIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              'Add a Tag',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
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
                        selectedLabelIndex = index;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedLabelIndex == index
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
