import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:food/Backend/loginb.dart';
import 'package:food/home.dart';
// import 'package:food/home.dart';
// import 'package:food/rest.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


 final Loginb log = Loginb();
 final TextEditingController _name = TextEditingController();
 final TextEditingController _ph = TextEditingController();
 @override


  @override
  Widget build(BuildContext context) {

    _name.text="venkat";
    _ph.text="78685757857";

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
                      SizedBox(
                        width: 250,
                        child: TextField(
                          controller: _name,
                          decoration: const InputDecoration(
                            hintText: 'Name',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 250,
                        child: TextField(
                          controller: _ph,
                          decoration: const InputDecoration(
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
                        onPressed: () async{
                         final res = await log.login(_name.text, _ph.text);
                         print(res);
                         if(res['msg']=="Data received"){
                           print("Login Success");
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => const Homepage()),
                           );
                         }
                         else{
                           print("Login Failed");
                         }
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
