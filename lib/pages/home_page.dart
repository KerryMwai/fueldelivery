import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fueldelivery/controller/change_notifier.dart';
import 'package:fueldelivery/pages/place_order_page.dart';
import 'package:provider/provider.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    AdminiController controlpages = Provider.of<AdminiController>(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("HELLO ADMIN"),
        centerTitle: true,
        leading: const Text(""),
        actions: [
          IconButton(
              onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.powerOff))
        ],
      ),
      body: IndexedStack(
        index: controlpages.getactiveIndex,
        children: controlpages.pages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.blueAccent,
          items: List.generate(
              controlpages.bottomNavIcons.length,
              (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        controlpages.bottomNavIcons[index],
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(controlpages.bottomNavText[index])
                      ],
                    ),
                  )),
          onTap: (index) {
            controlpages.setActiveIndex(index);
            // print(controlpages.getactiveIndex);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => PlaceOrderPage())));
        },
        child: const FaIcon(FontAwesomeIcons.plus),
      ),
    );
  }
}
