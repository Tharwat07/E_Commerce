import 'package:e_commerce/logic/controller/product_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgetes/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_rating_bar/flutter_simple_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ClothesInfo extends StatelessWidget {
  ClothesInfo(
      {Key? key,
      required this.title,
      required this.productId,
      required this.rate,
      required this.description})
      : super(key: key);
  final String title;
  final controller = Get.find<ProductController>();
  final int productId;
  final String description;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              Obx(() {
                return Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Get.isDarkMode
                        ? Colors.white.withOpacity(0.4)
                        : Colors.grey.withOpacity(0.4),
                  ),
                  child: InkWell(
                    onTap: () {
                      controller.mangeFav(productId);
                    },
                    child: controller.isFav(productId)
                        ? Icon(
                            Icons.favorite,
                      color:Colors.red,
                          )
                        : Icon(
                            Icons.favorite_outline,
                            color: Get.isDarkMode ? pinkClr : mainColor,
                          ),
                  ),
                );
              }),
            ],
          ),
          Row(
            children: [
              TextUtil(
                  text: "$rate",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underline: TextDecoration.none),
              const SizedBox(
                width: 10,
              ),
              RatingBar(
                rating: rate,
                icon: const Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.grey,
                ),
                starCount: 5,
                spacing: 1,
                size: 20,
                isIndicator: false,
                allowHalfRating: true,
                onRatingCallback: (value, isIndictor) {
                  isIndictor.value = true;
                },
                color: Colors.orangeAccent,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ReadMoreText(
            description,
            trimLines: 3,
            trimMode: TrimMode.Line,
            textAlign: TextAlign.justify,
            trimCollapsedText: "Show More ",
            trimExpandedText: "Show Less",
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),

            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            style: TextStyle(
              fontSize: 16,
              height: 2,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
