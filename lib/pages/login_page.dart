import 'package:flutter/material.dart';
import 'package:login_page/model/user.dart';
import 'package:login_page/pages/home_page.dart';
import 'package:login_page/services/shared_pref.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final parolController = TextEditingController();

 _login(){


  String email = emailController.text;
  String parol = parolController.text;

  User user = User(email: email, password: parol);

   SharedPref.setUser(user);

   SharedPref.setLogin(true);

 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 242, 242),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              width: double.infinity,
              image: AssetImage("assets/images/login_img.jpg"),
            ),
            const Text(
              "Welcome Back",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Login in to your existant account of Q Allure",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: TextField(
                
                controller: emailController,
                style: const TextStyle(fontSize: 18, color: Colors.blue,fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: const Icon(Icons.person_outline_rounded),
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.blue,width: 1.5))),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: parolController,
                style: const TextStyle(fontSize: 18, color: Colors.blue,fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  hintText: "parol",
                  prefixIcon: const Icon(Icons.person_outline_rounded),
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.blue,width: 1.5))),
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){

              _login();

              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
            }, child: const Text("Login In"))
          ],
        ),
      ),
    );
  }
}
