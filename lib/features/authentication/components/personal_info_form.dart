import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/features/authentication/components/form_input_field.dart';
import 'package:mobile_dev_project/features/authentication/components/gender_selectoe.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PersonalInfoForm extends StatelessWidget {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  static final formKey = GlobalKey<FormState>();
  PersonalInfoForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormInputField(
              title: "Full Name",
              controller: fullNameController,
              icon: Icon(Icons.person),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormInputField(
                title: "Email",
                controller: emailController,
                icon: const Icon(Icons.email)),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: IntlPhoneField(
                controller: phoneNumberController,
                decoration: InputDecoration(
                    labelText: 'Phone Number',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: AppColors.main), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(30.0),
                    )),
                initialCountryCode: 'DZ',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              )),
          Padding(padding: const EdgeInsets.all(8), child: GenderSelector())
        ],
      )),
    );
  }
}
