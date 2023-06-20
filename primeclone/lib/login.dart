import 'package:flutter/material.dart';
import 'package:primeclone/signup.dart';

class Login extends StatefulWidget {
  @override

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 4, 32, 56),
        centerTitle: false,
        title: Text('Sign in',
        style: TextStyle(
          color: Colors.white,
        ),),
         automaticallyImplyLeading: false, 
      ),

      backgroundColor: Color.fromARGB(255, 4, 32, 56),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Align(
              alignment: Alignment.topRight,                         //Forget button in the right corner
               child: TextButton(
                  onPressed: () {
                    //forgot password logic here
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color.fromARGB(255, 13, 138, 240),
                    ),
                  ),
                ),
             ),
              
              TextFormField(
                controller: _emailController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Email or phone number',     
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
              SizedBox(height: 2),
              TextFormField(
                controller: _passwordController,
                style: TextStyle(color: Colors.white),
                obscureText: true,
                decoration: InputDecoration(                       //password textfield
                  hintText: 'Amazon password',
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
                  },
                  child: Text('Sign in',                     //sign in button
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
                  alignment: Alignment.center,
                   child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                     child: Text(
                      "By signing in, you agree to the Prime Video Terms of Use and license agreements which can be found on the Amazon website.",
                      style: TextStyle(
                        color: Colors.grey,
                      
                      ),
                                 ),
                   ),
                 ),
                 SizedBox(height: 20),
                Text(
                  "New to Amazon?",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
        
                 ElevatedButton(
                onPressed: () {
                  //  login logic here
                   Navigator.push(context,MaterialPageRoute(builder: (context) => Signup()),);
              
                },
                child: Text('Create a new Amazon account',
                 style: TextStyle(
            color: Colors.white,
          ),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  padding: EdgeInsets.symmetric(horizontal:100),
                   
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
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
