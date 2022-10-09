import 'package:flutter/material.dart';
import 'cc/cc_dashboard.dart';
import '../../constants/config.dart';
import '../../mainpage.dart';
import 'register.dart';

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
    return const Text(
      'Login',
      style: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w600,
        fontFamily: 'OpenSans',
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
        width: 250,
        height: 60,
        child: MaterialButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => widget.traveller!
                        ? const MainPage()
                        : const ContentCreator()));
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
        'SignIn',
        style: TextStyle(
          color: MainColor,
          fontFamily: 'WorkSans',
          fontSize: 15,
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
                height: 16,
              ),
              loginbtn(),
              const SizedBox(
                height: 24,
              ),
              slog(),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: MainfontColor,
                      fontFamily: 'WorkSans',
                      fontSize: 15,
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
          padding: EdgeInsets.all(10),
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(29, 158, 158, 158),
                offset: Offset(5, 5),
                blurRadius: 0.5,
                spreadRadius: 1,
              )
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
