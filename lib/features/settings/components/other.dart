import 'package:flutter/material.dart';

class Other extends StatefulWidget {
  const Other({super.key});

  @override
  State<Other> createState() => _OtherState();
}

class _OtherState extends State<Other> {
  bool dark = false;
  List<String> languages = ["English", "Arabic"];
  String Language = "English";
  List<String> regions = ["Algeria", "Other.."];
  String region = "Algeria";

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            child: Icon(
              Icons.settings_suggest,
              color: Color(0xFF006175),
            ),
          ),
          Text(
            "Other",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                color: Color(0xFF006175),
                fontSize: 20),
          )
        ],
      ),
      Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  dark = !dark;
                });
              },
              child: Text(
                "Dark Mode",
                style: TextStyle(
                  color: Color(0xFF454545),
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Switch(
                value: dark,
                activeColor: Color(0xFF006175),
                onChanged: (value) {
                  setState(() {
                    dark = value;
                  });
                }),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  dark = !dark;
                });
              },
              child: Text(
                "Language",
                style: TextStyle(
                  color: Color(0xFF454545),
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            DropdownButton(
                value: Language,
                items: languages.map((langua) {
                  return DropdownMenuItem(
                    child: Text(langua),
                    value: langua,
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    Language = newValue!;
                  });
                })
          ],
        ),
      ),
            Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  dark = !dark;
                });
              },
              child: Text(
                "Region",
                style: TextStyle(
                  color: Color(0xFF454545),
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            DropdownButton(
                value: region,
                items: regions.map((values) {
                  return DropdownMenuItem(
                    child: new Text(values),
                    value: values,
                  );
                }).toList(),
                onChanged: (value){
                  setState(() {
                    region = value!;
                  });
                },)
          ],
        ),
      ),
    ]);
  }
}
