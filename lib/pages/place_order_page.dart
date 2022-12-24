import 'package:flutter/material.dart';
import 'package:fueldelivery/controller/change_notifier.dart';
import 'package:fueldelivery/customwidgets/custom_textfield.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PlaceOrderPage extends StatelessWidget {
  PlaceOrderPage({super.key});

  TextEditingController quantityController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AdminiController adminiController = Provider.of<AdminiController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Place Order"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Radio(
                      value: "Diesel",
                      groupValue: adminiController.typeOfOrder,
                      onChanged: ((val) {
                        adminiController.setTypeOfOrder(val!);
                        // print(adminiController.typeOfOrder);
                      })),
                  const SizedBox(
                    width: 15.0,
                  ),
                  const Text("Diesel")
                ],
              ),
              Row(
                children: [
                  Radio(
                      value: "Petrol",
                      groupValue: adminiController.typeOfOrder,
                      onChanged: ((val) {
                        adminiController.setTypeOfOrder(val!);
                        // print(adminiController.typeOfOrder);
                      })),
                  const SizedBox(
                    width: 15.0,
                  ),
                  const Text("Petrol")
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          CustomTextField(
              isObsecure: false,
              inputController: quantityController,
              hintText: "Enter quantity in Litres",
              borderRadius: 10),
          const SizedBox(
            height: 10.0,
          ),
          CustomTextField(
              isObsecure: false,
              inputController: addressController,
              hintText: "Enter address",
              borderRadius: 10),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                PriceAndQuantityManager priceQtyM = PriceAndQuantityManager(
                    type: adminiController.typeOfOrder,
                    quantity: quantityController.text,
                    address: addressController.text);
                adminiController.addOrderinfor(priceQtyM);
                Navigator.pop(context);
              },
              child: const Text(
                "Order",
                style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w700),
              )),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

// enum OrderType { Diesel, Petrol }
