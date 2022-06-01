import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/logic/controller/setting_controller.dart';
import 'package:e_commerce/view/widgetes/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({Key? key}) : super(key: key);
  final controller = Get.find<SettingController>();
  final authController = Get.find<AuthController>();



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Obx((){return  Row(
         children: [
           Container(
             height: 100,
             width: 100,
             decoration: const BoxDecoration(
               color: Colors.white,
               shape: BoxShape.circle,
               image: DecorationImage(
                 image: NetworkImage(
                  "https://img.icons8.com/office/344/person-male.png",
                 ),
                 fit: BoxFit.cover,
               ),
             ),
           ),
           const SizedBox(
             width: 15,
           ),
           Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 TextUtil(
                     text: controller.capitalize( authController.displayUserName.value ),
                     fontSize: 18,
                     fontWeight: FontWeight.bold,
                     color: Get.isDarkMode ? Colors.white : Colors.black,
                     underline: TextDecoration.none),
                 TextUtil(
                     text:   authController.displayUserEmail.value  ,
                     fontSize: 14,
                     fontWeight: FontWeight.normal,
                     color: Get.isDarkMode ? Colors.white : Colors.black,
                     underline: TextDecoration.none)
               ],
             ),
           )
         ],
       );})
      ],
    );
  }
}
