// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:slide_menu_drawer/constants.dart';

class TransactionsWidget extends StatelessWidget {
  const TransactionsWidget(
      {Key? key,
      required this.circleImage,
      required this.product,
      required this.brand,
      required this.price,
      required this.priceColor,
      required this.dolarColor})
      : super(key: key);

  final ImageProvider<Object>? circleImage;
  final String product, brand, price;
  final Color? priceColor, dolarColor;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.9,
      height: width * 0.132,
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 15,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.black,
                  backgroundImage: circleImage,
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product,
                    style: TextStyle(color: white, fontSize: 14),
                  ),
                  Text(
                    brand,
                    style:
                        TextStyle(fontSize: 12, color: white.withOpacity(0.6)),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                price,
                style: TextStyle(
                  color: priceColor,
                  fontSize: 18,
                ),
              ),
              Icon(
                Icons.attach_money,
                size: 22,
                color: dolarColor,
              )
            ],
          )
        ],
      ),
    );
  }
}
