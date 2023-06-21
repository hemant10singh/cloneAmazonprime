import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Signup extends StatefulWidget {
  @override

  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<Signup> {
  
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 4, 32, 56),
        centerTitle: false,
        title: Text('Create account',
        style: TextStyle(
          color: Colors.white,
        ),),
         automaticallyImplyLeading: false,    //to remove the back button
      ),

      backgroundColor: Color.fromARGB(255, 4, 32, 56),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
              TextFormField(
                controller: _nameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'First and last name',     
                   hintStyle: TextStyle(
                  color: const Color.fromARGB(255, 210, 233, 252), // Set the hint text color to white
          ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 2, 18, 32),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(           //Email textfield
                    vertical: 15.0,
                    horizontal: 20.0,
                  ),
                ),
              ),
              SizedBox(height: 4),
              TextFormField(
                controller: _emailController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(                       
                  hintText: 'Mobile number or email',
                   hintStyle: TextStyle(
                 color: const Color.fromARGB(255, 210, 233, 252), // Set the hint text color to white
          ),
                  filled: true,
                  fillColor:  Color.fromARGB(255, 2, 18, 32),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 20.0,
                  ),
                ),
              ),
               SizedBox(height: 4),
              TextFormField(
                controller: _passwordController,
                style: TextStyle(color: Colors.white),
                obscureText: true,
                decoration: InputDecoration(                       //password textfield
                  hintText: 'Create a password',
                   hintStyle: TextStyle(
                 color: const Color.fromARGB(255, 210, 233, 252), // Set the hint text color to white
          ),
                  filled: true,
                  fillColor:  Color.fromARGB(255, 2, 18, 32),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 20.0,
                  ),
                ),
              ),

               SizedBox(height: 60),
        
              Container(
                 width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your login logic here  
                    FirebaseAuth.instance.createUserWithEmailAndPassword(               //aunthentication logic
                      email: _emailController.text,
                      password: _passwordController.text).then((value){
                        print("Created new Account");
                        Navigator.push(context,MaterialPageRoute(builder: (context) => Login()));
                    }).onError((error, stackTrace){
                      print("Error ${error.toString()}");
                    });
                  
                  },
                  child: Text('Continue',                     //continue button
                   style: TextStyle(
                  color: Colors.white,
                      ),),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal:100),
                     
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
                 SizedBox(height: 10),
               Align(
              alignment: Alignment.center,                         //Forget button in the right corner
               child: TextButton(
                  onPressed: () {
                    
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text(
                    'Already have an account',
                    style: TextStyle(
                      color: Color.fromARGB(255, 13, 138, 240),
                    ),
                  ),
                ),
             ),
              SizedBox(height: 10),
                 Align(
                  alignment: Alignment.center,
                   child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                     child: Text(
                      "By creating an account, you agree to the Prime Video Terms of Use and license agreements which can be found on the Amazon website.",
                      style: TextStyle(
                        color: Colors.grey,
                      
                      ),
                                 ),
                   ),
                 ),
                
              SizedBox(height: 60),
        
            Align(
                  alignment: Alignment.center,
                   child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                     child: Text(
                      "© 1996-2023, Amazon.com, Inc. or its affilates",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                                 ),
                   ),
                 ), 
            ],
          ),
        ),
      ),
    );
  }  
}
