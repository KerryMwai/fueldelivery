import 'package:flutter/material.dart';
import 'package:fueldelivery/pages/home_page.dart';

class CustomTextField extends StatelessWidget {
  bool isObsecure;
  TextEditingController inputController;
  String hintText;
  double borderRadius;
  CustomTextField(
      {super.key,
      required this.isObsecure,
      required this.inputController,
      required this.hintText,
      required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 15.0),
      width: size.width - 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: Colors.black.withOpacity(0.6), width: 3.0)),
      child: TextField(
        cursorColor: Colors.black,
        obscureText: isObsecure,
        controller: inputController,
        style: const TextStyle(color: Colors.black, fontSize: 20),
        decoration:
            InputDecoration(border: InputBorder.none, hintText: hintText),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AdminPage()));
      },
      child: Container(
          width: (size.width - 40) / 2.2,
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
          decoration: BoxDecoration(
              color: Colors.brown, borderRadius: BorderRadius.circular(25)),
          child: const Center(
            child: Text(
              "Login",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5),
            ),
          )),
    );
  }
}
