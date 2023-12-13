import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/features/authentication/components/form_input_field.dart';
import 'package:mobile_dev_project/features/authentication/components/gender_selector.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PersonalInfoForm extends StatefulWidget {
  static final personalInfoFormKey = GlobalKey<FormState>();
  PersonalInfoForm({
    super.key,
  });

  @override
  State<PersonalInfoForm> createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: PersonalInfoForm.personalInfoFormKey,
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
              controller: emailController,
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
                  //phone is an object (print phone to see)
                  print(phone.completeNumber);
                },
                keyboardType: TextInputType.phone,
                validator: (phone) {
                  if (phone == null ||
                      phone.completeNumber == null ||
                      !isNumeric(phone.completeNumber)) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              )),
          Padding(padding: const EdgeInsets.all(8), child: GenderSelector())
        ],
      )),
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
