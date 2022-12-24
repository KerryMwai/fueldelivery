// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:fueldelivery/controller/change_notifier.dart';
import 'package:fueldelivery/customwidgets/custom_textfield.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => AdminiController())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Authenticate(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Authenticate extends StatelessWidget {
  Authenticate({super.key});
  TextEditingController userId = TextEditingController();
  TextEditingController userpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 40, left: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              CustomTextField(
                isObsecure: false,
                inputController: userId,
                hintText: "Enter id",
                borderRadius: 30,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                isObsecure: true,
                inputController: userpassword,
                hintText: "Enter password",
                borderRadius: 30,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton()
            ],
          ),
        ),
      ),
    ));
  }
}
