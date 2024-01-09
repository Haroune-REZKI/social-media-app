import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/features/authentication/components/form_input_field.dart';
import 'package:mobile_dev_project/features/authentication/components/gender_selector.dart';
import 'package:mobile_dev_project/features/authentication/controllers/personal_info_controller.dart';

class PersonalInfoForm extends StatelessWidget {
  static PersonalInfoController personalInfoController =
      Get.put<PersonalInfoController>(PersonalInfoController());

  static final personalInfoFormKey = GlobalKey<FormState>();
  const PersonalInfoForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: personalInfoFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormInputField(
              title: "Full Name",
              controller: personalInfoController.fullName,
              icon: const Icon(Icons.person),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a username';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormInputField(
              title: "Email",
              controller: personalInfoController.email,
              icon: const Icon(Icons.email),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an email address';
                }
                // Use the email validation provided by TextFormField
                if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
                    .hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: IntlPhoneField(
                controller: personalInfoController.phoneNumber,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 2,
                      color: AppColors.main,
                    ), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                initialCountryCode: 'DZ',
                onChanged: (phone) {
                  //phone is an object (print phone to see)
                  print(phone.completeNumber);
                },
                keyboardType: TextInputType.phone,
                validator: (phone) {
                  if (phone == null || !isNumeric(phone.completeNumber)) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              )),
          const Padding(
            padding: EdgeInsets.all(8),
            child: GenderSelector(),
          )
        ],
      ),
    );
  }

  //to check of the number is numeric
  bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
}
