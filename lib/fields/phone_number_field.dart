import 'package:flutter/material.dart';

class PhoneNumberField extends StatefulWidget {
  const PhoneNumberField({Key? key}) : super(key: key);

  @override
  _PhoneNumberFieldState createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          icon: const Icon(
            Icons.contact_phone,
            size: 30,
          ),
          iconColor: Colors.black54,
          labelText: 'Phone number',
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(Icons.phone),
          prefixText: '+380',
          prefixStyle: const TextStyle(color: Colors.black, fontSize: 16),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
              iconSize: 30,
            ),
          ),
          helperText: 'Enter the phone number to add to your contact list.',
          helperMaxLines: 2,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(
              color: Colors.black54,
              width: 2,
              style: BorderStyle.solid,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2,
              style: BorderStyle.solid,
            ),
          ),
        ),
        keyboardType: TextInputType.phone,
        maxLength: 9,
      ),
    );
  }
}
