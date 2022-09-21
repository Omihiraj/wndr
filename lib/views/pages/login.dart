import 'package:flutter/material.dart';

import '../../constants/config.dart';
import '../../mainpage.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/3.png'))),
    );
  }

  Text name() {
    return const Text(
      'Login',
      style: TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.w700,
        fontFamily: 'WorkSans',
        color: MainColor,
      ),
    );
  }

  Container email() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Your Email',
          labelStyle: TextStyle(
            color: MainfontColor,
            fontFamily: 'WorkSans',
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
          labelStyle: const TextStyle(
            color: MainfontColor,
            fontFamily: 'WorkSans',
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

  Padding fPassword() {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          InkWell(
              child: Text(
            'Forgot Password?',
            style: TextStyle(
              fontSize: 15,
              color: MainfontColor,
              fontFamily: 'WorkSans',
            ),
          )),
        ],
      ),
    );
  }

  Center loginbtn() {
    return Center(
      child: SizedBox(
        width: 210,
        height: 50,
        child: MaterialButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MainPage()));
          },
          elevation: 5,
          color: MainColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: const Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
          ),
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
      child: const Text(
        'clicking here',
        style: TextStyle(
          color: MainColor,
          fontFamily: 'WorkSans',
          fontSize: 15,
        ),
      ),
    );
  }

  /* Widget glog() {
    return InkWell(
      onTap: (){},
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/google.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget tlog() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/twitter.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
*/
  Row slog() {
    return Row(
      children: [
        SocialLogin(
          image: const AssetImage('assets/facebook.png'),
          press: () {},
        ),
        SocialLogin(
          image: const AssetImage('assets/google.png'),
          press: () {},
        ),
        SocialLogin(
          image: const AssetImage('assets/twitter.png'),
          press: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgrounsColor,
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
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
                height: 12,
              ),
              loginbtn(),
              const SizedBox(
                height: 12,
              ),
              slog(),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Are you a ontent creator?',
                    style: TextStyle(
                      color: MainfontColor,
                      fontFamily: 'WorkSans',
                      fontSize: 15,
                    ),
                  ),
                  rlink(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    required this.image,
    required this.press,
    Key? key,
  }) : super(key: key);

  final AssetImage image;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: press,
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
