import 'package:flutter/material.dart';

import '../constants/config.dart';
import '../models/tour.dart';

Widget tourCard(Tour tour) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
    child: InkWell(
        child: Container(
      width: 200,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          Positioned(
              left: 0,
              top: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  tour.heroImg,
                  width: 200,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              )),
          Positioned(
            bottom: 50,
            left: 5,
            child: RichText(
              text: TextSpan(
                text: tour.heroName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
                children: const [
                  TextSpan(
                      text: ' by Nimal',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                          fontSize: 12)),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.location_pin,
                          color: Colors.amber,
                        ),
                        Text(
                          "UAE",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Text(
                          "${tour.ratings}",
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    )),
  );
}

Widget cctourCard(Tour tour) {
  return InkWell(
      child: Container(
    width: 190,
    height: 190,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
    ),
    child: Stack(
      children: [
        Positioned(
            left: 0,
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                tour.heroImg,
                width: 190,
                height: 190,
                fit: BoxFit.cover,
              ),
            )),
        Positioned(
          bottom: 50,
          left: 5,
          child: RichText(
            text: TextSpan(
              text: tour.heroName,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              children: const [
                TextSpan(
                    text: '',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                        fontSize: 12)),
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.location_pin,
                        color: Colors.amber,
                      ),
                      Text(
                        "UAE",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(
                        "${tour.ratings}",
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            ))
      ],
    ),
  ));
}

Center addbtn({context, required Widget nextPage, required String btnText}) {
  return Center(
    child: SizedBox(
      width: 270,
      height: 50,
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => nextPage));
        },
        color: MainColor,
        elevation: 5,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Text(
          btnText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
