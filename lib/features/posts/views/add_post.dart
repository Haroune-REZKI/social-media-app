import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/features/authentication/components/customized_text.dart';
import 'package:mobile_dev_project/features/authentication/components/form_submit_button.dart';
import 'package:mobile_dev_project/features/posts/components/add_tag.dart';
import 'package:mobile_dev_project/features/posts/components/post_submit_button.dart';
import 'package:mobile_dev_project/features/posts/components/post_text_field.dart';
import 'package:mobile_dev_project/features/posts/controllers/add_post_controller.dart';
import 'package:mobile_dev_project/utils/components/bottom_navigation_bar.dart';
import 'package:get/get.dart';

class AddPost extends StatefulWidget {
  static AddPostController addPostController =
      Get.put<AddPostController>(AddPostController());
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  //to review: where to declare it!!
  String title = "Share what's on your mind right now with your fellows";

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
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
              PostTextField(title: title, controller: AddPost.addPostController.postContentController),
              const SizedBox(height: 20),
              const AddTag(),
              const SizedBox(
                height: 50,
              ),
              FormSubmitButton(
                title: "Share!",
                color: AppColors.main,
                textColor: AppColors.white,
                onTap: () {
                  print("post content ${AddPost.addPostController.postContentController.text}");
                  AddPost.addPostController.addPost(context);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: 1,
      ),
    );
  }
}
