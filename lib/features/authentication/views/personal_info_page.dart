import 'package:flutter/material.dart';
import 'package:mobile_dev_project/features/authentication/components/dob_input_field.dart';
import 'package:mobile_dev_project/features/authentication/components/input_field.dart';
import 'package:mobile_dev_project/features/authentication/components/prsonal_info_text.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  @override
  Widget build(BuildContext context) {
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
        body: Container(
          child: Column(
            children: [
              PersonalInfoText(),
              InputField(title: 'Full Name'),
              InputField(title: 'Email'),
              DobInputField()
            ],
          ),
        ));
  }
}
