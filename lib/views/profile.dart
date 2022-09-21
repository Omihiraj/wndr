import 'package:flutter/material.dart';

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
            children: const [
              SizedBox(
                height: 5,
              ),
              Text(
                "Profile Name",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "TAG LINE",
                style: TextStyle(
                  color: Colors.white,
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
          icon: (Icons.person),
          text: ('Edit Profile'),
          press: () {},
        ),
        const SizedBox(
          height: 5,
        ),
        ProfileMenu(
          icon: (Icons.location_on),
          text: ('Address'),
          press: () {},
        ),
        const SizedBox(
          height: 5,
        ),
        ProfileMenu(
          icon: (Icons.home),
          text: ('Bookings'),
          press: () {},
        ),
        const SizedBox(
          height: 5,
        ),
        ProfileMenu(
          icon: (Icons.production_quantity_limits),
          text: ('My Products'),
          press: () {},
        ),
        const SizedBox(
          height: 5,
        ),
        ProfileMenu(
          icon: (Icons.notifications),
          text: ('Notification'),
          press: () {},
        ),
        const SizedBox(
          height: 5,
        ),
        ProfileMenu(
          icon: (Icons.payments),
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
        title: const Text(
          'Profile',
          style: TextStyle(
            color: SecondfontColor,
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
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Your Details",
                  style: TextStyle(
                    color: SecondfontColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
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
    required this.icon,
    required this.press,
    Key? key,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
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
              Icon(
                icon,
                color: MainColor,
                size: 27,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                text,
                style: const TextStyle(
                  color: SecondfontColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                color: MainColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
