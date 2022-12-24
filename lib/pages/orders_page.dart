import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/change_notifier.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    AdminiController adminiController = Provider.of<AdminiController>(context);
    return SingleChildScrollView(
        child: Column(
      children: List.generate(
          adminiController.orderInformation.length,
          (index) => InkWell(
                onLongPress: () => adminiController.deleteOrder(index),
                child: Card(
                  color: Colors.grey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        adminiController.orderInformation[index].type,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2),
                      ),
                      Text(
                        adminiController.orderInformation[index].quantity,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2),
                      ),
                      Text(
                        adminiController.orderInformation[index].address,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2),
                      ),
                    ],
                  ),
                ),
              )),
    ));
  }
}
