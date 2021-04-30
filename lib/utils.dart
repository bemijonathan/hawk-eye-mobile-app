import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawkeye/colors.dart';

void getSnackbar(String message) {
  Get.snackbar('An error occured', message,
      backgroundColor: nimbusBlue, colorText: white);
}

void getDialog({String message, Function todo}) {
  Get.dialog(Container(
    height: Get.width,
    width: Get.width * .7,
    child: Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(message),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'Go back',
                    style: TextStyle(
                        color: nimbusBlue, fontWeight: FontWeight.bold),
                  )),
              TextButton(
                  onPressed: () => todo,
                  child: Text(
                    'Proceed',
                    style: TextStyle(
                        color: nimbusBlue, fontWeight: FontWeight.bold),
                  )),
            ],
          )
        ],
      ),
    ),
  ));
}
