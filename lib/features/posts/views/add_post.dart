import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/features/authentication/components/customized_text.dart';
import 'package:mobile_dev_project/features/authentication/components/form_submit_button.dart';
import 'package:mobile_dev_project/features/posts/components/add_tag.dart';
import 'package:mobile_dev_project/features/posts/components/post_submit_button.dart';
import 'package:mobile_dev_project/features/posts/components/post_text_field.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  //to review: where to declare it!!
  TextEditingController postController = TextEditingController();
  String title = "Share what's on your mind right now with your fellows";

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
        title: const Text("AppName"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight * 0.95,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                CustomizedText(textMain: "Add a  new Post", textSecond: ""),
                PostTextField(title: title, controller: postController),
                SizedBox(height: 20),
                AddTag(),
                SizedBox(height: 50,),
                PostSubmitButton(
                    title: "Share!",
                    color: AppColors.main,
                    textColor: AppColors.white,
                    onTap: () {}),
              ],
            )),
      ),
    );
  }
}
