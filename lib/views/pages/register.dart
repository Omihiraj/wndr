import 'package:flutter/material.dart';

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
    return const Text(
      'Register',
      style: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w600,
        fontFamily: 'OpenSans',
        color: MainColor,
      ),
    );
  }

  Widget name() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Your Name',
          labelStyle: TextStyle(
            color: MainfontColor,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget email() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Your Email',
          labelStyle: TextStyle(
            color: MainfontColor,
            fontFamily: 'OpenSans',
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
          labelStyle: const TextStyle(
            color: MainfontColor,
            fontFamily: 'OpenSans',
          ),
          suffixIcon: isPassVisivible
              ? InkWell(
                  onTap: () {
                    setState(() {
                      isPassVisivible = false;
                    });
                  },
                  child: const Icon(Icons.visibility))
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
          labelStyle: const TextStyle(
            color: MainfontColor,
            fontFamily: 'OpenSans',
          ),
          suffixIcon: isPassVisivible
              ? InkWell(
                  onTap: () {
                    setState(() {
                      isPassVisivible = false;
                    });
                  },
                  child: const Icon(Icons.visibility))
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
          child: const Text(
            "Register",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
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
      child: const Text(
        'Login',
        style: TextStyle(
          color: MainColor,
          fontFamily: 'OpenSans',
          fontSize: 15,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgrounsColor,
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
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
                height: 25,
              ),
              loginbtn(),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Have an Account? ',
                    style: TextStyle(
                      color: MainfontColor,
                      fontFamily: 'OpenSans',
                      fontSize: 15,
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
    );
  }
}
