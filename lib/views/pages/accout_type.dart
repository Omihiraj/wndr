import 'package:flutter/material.dart';

import 'login.dart';

class AccountType extends StatelessWidget {
  const AccountType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/account_type.jpg",
                ),
                fit: BoxFit.cover)),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          logBtn(
              context: context,
              btnText: 'Content Creator',
              travelStatus: false),
          const SizedBox(height: 20),
          logBtn(context: context, btnText: 'Traveller', travelStatus: true),
          const SizedBox(
            height: 20,
          )
        ]),
      ),
    );
  }

  Widget logBtn(
      {context, required String btnText, required bool travelStatus}) {
    return Center(
      child: SizedBox(
        width: 270,
        height: 50,
        child: MaterialButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginPage(
                          traveller: travelStatus,
                        )));
          },
          color: travelStatus
              ? const Color.fromARGB(38, 255, 255, 255)
              : Colors.blue,
          elevation: 5,
          shape: RoundedRectangleBorder(
              side: travelStatus
                  ? const BorderSide(color: Colors.white)
                  : BorderSide.none,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
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
}
