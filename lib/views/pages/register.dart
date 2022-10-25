import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/config.dart';
import 'accout_type.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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

  Widget register() {
    return Text(
      'Register',
      style: GoogleFonts.workSans(
        textStyle: const TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.w600,
          color: MainColor,
        ),
      ),
    );
  }

  Widget name() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: 'Your Name',
          labelStyle: GoogleFonts.workSans(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: MainfontColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget email() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: 'Your Email',
          labelStyle: GoogleFonts.workSans(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: MainfontColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget password() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        obscureText: !isPassVisivible,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: 'Password',
          labelStyle: GoogleFonts.workSans(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: MainfontColor,
            ),
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

  Widget cpassword() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        obscureText: !isPassVisivible,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: 'Confirm Password',
          labelStyle: GoogleFonts.workSans(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: MainfontColor,
            ),
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

  Widget loginbtn() {
    return Center(
      child: SizedBox(
        width: 270,
        height: 60,
        child: MaterialButton(
          onPressed: () {},
          elevation: 5,
          color: MainColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Text(
            "Register",
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget loglink() {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AccountType()));
      },
      child: Text(
        'Login',
        style: GoogleFonts.workSans(
          textStyle: const TextStyle(
            color: MainColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 25,
                ),
                logo(),
                register(),
                const SizedBox(
                  height: 10,
                ),
                name(),
                const SizedBox(
                  height: 10,
                ),
                email(),
                const SizedBox(
                  height: 10,
                ),
                password(),
                const SizedBox(
                  height: 10,
                ),
                cpassword(),
                const SizedBox(
                  height: 30,
                ),
                loginbtn(),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have an Account? ',
                      style: GoogleFonts.workSans(
                        textStyle: const TextStyle(
                          color: MainfontColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    loglink(),
                    const SizedBox(
                      height: 30,
                    )
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
