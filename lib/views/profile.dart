import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/config.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Container profilepic() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 7, color: MainColor),
      ),
      child: Container(
        height: 100,
        width: 100,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/5.jpg'),
              fit: BoxFit.cover,
            )),
      ),
    );
  }

  Padding name() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width * 0.55,
        decoration: const BoxDecoration(
          color: MainColor,
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Text(
                "Profile Name",
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "TAG LINE",
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column menulist() {
    return Column(
      children: [
        ProfileMenu(
          img: "assets/EditProfile.png",
          text: ('Edit Profile'),
          press: () {},
        ),
        const SizedBox(
          height: 9,
        ),
        ProfileMenu(
          img: "assets/Address.png",
          text: ('Address'),
          press: () {},
        ),
        const SizedBox(
          height: 9,
        ),
        ProfileMenu(
          img: "assets/Bookings.png",
          text: ('Bookings'),
          press: () {},
        ),
        const SizedBox(
          height: 9,
        ),
        ProfileMenu(
          img: "assets/MyProducts.png",
          text: ('My Products'),
          press: () {},
        ),
        const SizedBox(
          height: 9,
        ),
        ProfileMenu(
          img: "assets/Notification.png",
          text: ('Notification'),
          press: () {},
        ),
        const SizedBox(
          height: 9,
        ),
        ProfileMenu(
          img: "assets/payment.png",
          text: ('Payment Settings'),
          press: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: BackgrounsColor,
        title: Text(
          'Profile',
          style: GoogleFonts.workSans(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: SecondfontColor,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Row(
                children: [
                  profilepic(),
                  const SizedBox(
                    width: 10,
                  ),
                  name(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Your Details",
                  style: GoogleFonts.workSans(
                    textStyle: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: SecondfontColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              menulist(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    required this.text,
    required this.img,
    required this.press,
    Key? key,
  }) : super(key: key);

  final String text;
  final String img;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63,
      width: MediaQuery.of(context).size.width - 30,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.only(left: 2, right: 5),
        child: MaterialButton(
          onPressed: press,
          child: Row(
            children: [
              Image.asset(
                img,
                width: 50,
                height: 50,
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                text,
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: SecondfontColor,
                  ),
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                color: MainColor,
                size: 19,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
