import 'package:flutter/material.dart';
import '../../main_nav_bar.dart';
import 'cc/cc_dashboard.dart';
import '../../constants/config.dart';

import 'register.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  final bool? traveller;
  const LoginPage({this.traveller, super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPassVisivible = false;
  Container logo() {
    return Container(
      margin: const EdgeInsets.only(
        top: 25,
      ),
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/3.png'))),
    );
  }

  Text name() {
    return Text(
      'Login',
      style: GoogleFonts.workSans(
        textStyle: const TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.w600,
          color: MainColor,
        ),
      ),
    );
  }

  Container email() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: 'Your Email',
          labelStyle: GoogleFonts.workSans(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: MainfontColor,
          ),
        ),
      ),
    );
  }

  Container password() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        obscureText: !isPassVisivible,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: 'Password',
          labelStyle: GoogleFonts.workSans(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: MainfontColor,
          ),
          suffixIcon: isPassVisivible
              ? InkWell(
                  onTap: () {
                    setState(() {
                      isPassVisivible = false;
                    });
                  },
                  child: const Icon(
                    Icons.visibility,
                    color: Colors.black,
                  ))
              : InkWell(
                  onTap: () {
                    setState(() {
                      isPassVisivible = true;
                    });
                  },
                  child: const Icon(Icons.visibility_off)),
        ),
      ),
    );
  }

  Padding fPassword() {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            child: Text(
              'Forgot Password?',
              style: GoogleFonts.workSans(
                textStyle: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: MainfontColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Center loginbtn() {
    return Center(
      child: SizedBox(
        width: 250,
        height: 60,
        child: MaterialButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => widget.traveller!
                        ? const CustomNavBar()
                        : const ContentCreator()));
          },
          elevation: 5,
          color: MainColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(19))),
          child: Text("Login",
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              )),
        ),
      ),
    );
  }

  InkWell rlink() {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const RegisterPage()));
      },
      child: Text(
        'Clickng here',
        style: GoogleFonts.workSans(
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: MainColor,
          ),
        ),
      ),
    );
  }

  Row slog() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialLogin(
          imageName: 'assets/facebook.png',
          press: () {},
        ),
        SocialLogin(
          imageName: 'assets/google.png',
          press: () {},
        ),
        SocialLogin(
          imageName: 'assets/twitter.png',
          press: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgrounsColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                logo(),
                name(),
                email(),
                const SizedBox(
                  height: 10,
                ),
                password(),
                const SizedBox(
                  height: 12,
                ),
                fPassword(),
                const SizedBox(
                  height: 16,
                ),
                loginbtn(),
                const SizedBox(
                  height: 24,
                ),
                slog(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Are you a content creator?",
                      style: GoogleFonts.workSans(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: MainfontColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    rlink(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    required this.imageName,
    required this.press,
    Key? key,
  }) : super(key: key);

  final String imageName;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: press,
      child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(29, 158, 158, 158),
                  offset: Offset(1, 7),
                  blurRadius: 0.1,
                  spreadRadius: 1,
                  blurStyle: BlurStyle.inner)
            ],
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image.asset(
              imageName,
              width: 35,
              height: 35,
            ),
          )),
    );
  }
}
