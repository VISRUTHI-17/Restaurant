import 'package:flutter/material.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
// import 'package:food/home.dart';
import 'package:food/rest.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SafeArea(
        child: Container(


          // constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              
              opacity: 0.5,
                image: AssetImage("assets/pexels-pixabay-315755.jpg"),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 250,
                ),

                BlurryContainer(
                  blur: 2,
                  // width: 200,
                  // height: 200,
                  elevation: 0,
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(8),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Column(
                    children: [
                      const Text(
                        "LOGIN",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const SizedBox(
                        width: 250,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Name',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        width: 250,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Phone No',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent)
                        ),
                        child: const Text('LOGIN', style: TextStyle(fontSize: 20.0),),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Restaurant()),
                          );
                        },
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
