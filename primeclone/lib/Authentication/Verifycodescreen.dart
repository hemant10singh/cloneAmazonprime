import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class Verifycodescreen extends StatefulWidget {
  final String verificationId;
   final String phoneNumber;
  const Verifycodescreen({super.key, required this.verificationId,required this.phoneNumber});

  @override
  State<Verifycodescreen> createState() => _VerifycodescreenState();
}

class _VerifycodescreenState extends State<Verifycodescreen> {
  bool loading =false;
  final TextEditingController _verifycodeController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 4, 32, 56),
        centerTitle: false,
        title: Text('Verify mobile number',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 35
        ),),
         automaticallyImplyLeading: false,    //to remove the back button
      ),
      backgroundColor: Color.fromARGB(255, 4, 32, 56),
      
      body: Column(
           children: [
             SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                  widget.phoneNumber,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                            ),
                ),
              ),
             SizedBox(height: 10),
              Align(
                  alignment: Alignment.topLeft,
                   child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                     child: Text(
                      "A text with a One Time Password(OTP) has been sent to the number above.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15
                      ),
                                 ),
                   ),
                 ), 
                 SizedBox(height: 15),
             TextFormField(
              controller: _verifycodeController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter OTP',     
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
              SizedBox(height: 15),
            Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async{
                    // Add your login logic here
                    setState(() {
                      loading=true;
                    });
                    final Credential=PhoneAuthProvider.credential(
                      verificationId: widget.verificationId, 
                      smsCode: _verifycodeController.text.toString());

                    try {
                      await FirebaseAuth.instance.signInWithCredential(Credential);
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Login()));
                    } catch (e) {
                      setState(() {
                      loading=false;
                    });
                      print("Error ${e.toString()}");
                    }
    
                  },
                  child: Text(
                    'Create your Amazon account', //sign in button
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
               Align(
                  alignment: Alignment.topLeft,
                   child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                     child: Text(
                      "By creating an account, you agree to the Amazon's Conditions of Use and Privacy Notice.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15
                      ),
                                 ),
                   ),
                 ), 
                 SizedBox(height: 90),
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
        
      )
    );
  }
}