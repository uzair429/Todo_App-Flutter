import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:todoapp/config/palette.dart';
import 'package:todoapp/screens/list_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInUpScreen extends StatefulWidget {
  const SignInUpScreen({Key? key}) : super(key: key);

  @override
  _SignInUpScreenState createState() => _SignInUpScreenState();
}

class _SignInUpScreenState extends State<SignInUpScreen> {
  var nameController = TextEditingController();
  var emailCOntroller = TextEditingController();
  var passwordControler = TextEditingController();
  var conformPasswordController = TextEditingController();
  var logEmailController = TextEditingController();
  var logPasswordController = TextEditingController();


  bool isSignupScreen = true;
  bool isMale = true;
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.backgroundColor,
        body: Stack(
          children: [
          Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: Container(

            height: 280,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/background.jpg',),
                    fit: BoxFit.fill
                )
            ),
            child: Container(
              padding: const EdgeInsets.only(top: 90, left: 20),
              color: const Color(0xFF3b5999).withOpacity(.85),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(text: TextSpan(
                      text: "Welcome to ",
                      style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 2,
                          color: Colors.yellow[700]
                      ),
                      children: [
                        TextSpan(
                            text: "Uzair's APP",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow[700],
                            )
                        )
                      ]
                  )),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(isSignupScreen
                      ? "Signup to Continue"
                      : "Signin to Continue",
                    style: TextStyle(
                      letterSpacing: 1,
                      color: Colors.white,
                    ),)
                ],
              ),
            ),
          ),

        ),

        // Trick to add the shadow for the submit button
        // buildBottomHalfContainer(true),

        //Main Contianer for Login and Signup
        AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.bounceInOut,
            top: isSignupScreen ? 200 : 230,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.bounceInOut,
              height: isSignupScreen ? 380 : 250,
              padding: const EdgeInsets.all(20),
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: SingleChildScrollView(
                  child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSignupScreen = false;
                                });
                              },
                              child: Column(
                                children: [
                                  Text(
                                    "LOGIN",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: !isSignupScreen
                                            ? Palette.activeColor
                                            : Palette.textColor1),
                                  ),
                                  if (!isSignupScreen)
                                    Container(
                                      margin: const EdgeInsets.only(top: 3),
                                      height: 2,
                                      width: 55,
                                      color: Colors.orange,
                                    )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSignupScreen = true;
                                });
                              },
                              child: Column(
                                children: [
                                  Text(
                                    "SIGNUP",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: isSignupScreen
                                            ? Palette.activeColor
                                            : Palette.textColor1),
                                  ),
                                  if (isSignupScreen)
                                    Container(
                                      margin: const EdgeInsets.only(top: 3),
                                      height: 2,
                                      width: 55,
                                      color: Colors.orange,
                                    )
                                ],
                              ),
                            )
                          ],
                        ),
                    if (isSignupScreen) buildSignupSection(),
                    if (!isSignupScreen) buildSigninSection()
                  ],
                ),
              ),
            ),
          ),

            // Add the submit button
                buildBottomHalfContainer(),

              //  Bottom buttons of Facebook and Google
            Positioned(
              top: MediaQuery
                  .of(context)
                  .size
                  .height - 100,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Text(isSignupScreen ? "Or Signup with" : "Or Signin with"),
                  Container(
                    margin: const EdgeInsets.only(right: 20, left: 20, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                         buildTextButton(Icons.facebook, "Facebook", Palette.facebookColor),
                         buildTextButton(Icons.android, "Google", Palette.googleColor),
                      ],
                    ),
                  )
                ],
              )
            )
          ]
        )
    );

  }

  // SIGN UP CONTENTS
  Container buildSignupSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          TextField(
            controller: nameController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.person,
                color: Palette.iconColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Palette.textColor1),
                borderRadius: BorderRadius.all(Radius.circular(35.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Palette.textColor1),
                borderRadius: BorderRadius.all(Radius.circular(35.0)),
              ),
              contentPadding: EdgeInsets.all(10),
              hintText: "Full Name",
              hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
            ),
          ),
          const SizedBox(height: 5,),
          TextField(
            controller: emailCOntroller,
            //obscureText: isPassword,
            keyboardType: TextInputType.emailAddress ,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.email,
                color: Palette.iconColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Palette.textColor1),
                borderRadius: BorderRadius.all(Radius.circular(35.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Palette.textColor1),
                borderRadius: BorderRadius.all(Radius.circular(35.0)),
              ),
              contentPadding: EdgeInsets.all(10),
              hintText: "Email",
              hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
            ),
          ),
          const SizedBox(height: 5,),
          TextField(
            controller: passwordControler,
            //obscureText: isPassword,
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.password,
                color: Palette.iconColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Palette.textColor1),
                borderRadius: BorderRadius.all(Radius.circular(35.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Palette.textColor1),
                borderRadius: BorderRadius.all(Radius.circular(35.0)),
              ),
              contentPadding: EdgeInsets.all(10),
              hintText: "password",
              hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
            ),
          ),
          const SizedBox(height: 5,),
          TextField(
            controller: conformPasswordController,
            //obscureText: isPassword,
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.password,
                color: Palette.iconColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Palette.textColor1),
                borderRadius: BorderRadius.all(Radius.circular(35.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Palette.textColor1),
                borderRadius: BorderRadius.all(Radius.circular(35.0)),
              ),
              contentPadding: EdgeInsets.all(10),
              hintText: "COnform password",
              hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
            ),
          ),
          // buildTextField(MaterialCommunityIcons.account_outline, "User Name", false, false),
          // buildTextField(MaterialCommunityIcons.email_outline, "email", false, true),
          // buildTextField(MaterialCommunityIcons.lock_outline, "password", true, false),
          Container(
            width: 200,
            margin: const EdgeInsets.only(top: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                  text: "By pressing 'Submit' you agree to our ",
                  style: TextStyle(color: Palette.textColor2),
                  children: [
                    TextSpan(
                      //recognizer: ,
                      text: "term & conditions",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  // SIGN IN CONTENTS
  Container buildSigninSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          TextField(
            controller: logEmailController,
            //obscureText: isPassword,
            keyboardType: TextInputType.emailAddress ,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.email,
                color: Palette.iconColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Palette.textColor1),
                borderRadius: BorderRadius.all(Radius.circular(35.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Palette.textColor1),
                borderRadius: BorderRadius.all(Radius.circular(35.0)),
              ),
              contentPadding: EdgeInsets.all(10),
              hintText: "Email",
              hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
            ),
          ),
          const SizedBox(height: 5,),
          TextField(
            controller: logPasswordController,
            //obscureText: isPassword,
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.password,
                color: Palette.iconColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Palette.textColor1),
                borderRadius: BorderRadius.all(Radius.circular(35.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Palette.textColor1),
                borderRadius: BorderRadius.all(Radius.circular(35.0)),
              ),
              contentPadding: EdgeInsets.all(10),
              hintText: "password",
              hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
            ),
          ),

          // buildTextField(Icons.mail_outline, "info@demouri.com", false, true),
          // buildTextField(MaterialCommunityIcons.lock_outline, "**********", true, false),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    activeColor: Palette.textColor2,
                    onChanged: (value) {
                      setState(() {
                        isRememberMe = !isRememberMe;
                      });
                    },
                  ),
                  const Text("Remember me",
                      style: TextStyle(fontSize: 12, color: Palette.textColor1))
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Forgot Password?",
                    style: TextStyle(fontSize: 12, color: Palette.textColor1)),
              )
            ],
          )
        ],
      ),
    );
  }

  // BUTTON
  Widget buildBottomHalfContainer() {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 700),
      curve: Curves.bounceInOut,
      top: isSignupScreen ? 535 : 430,
      right: 0,
      left: 0,
      child: Center(
        child: GestureDetector(
          onTap: () async {
            if (!isSignupScreen) {
              var logEmail = logEmailController.text.trim();
              var logPassword = logPasswordController.text.trim();
              if (logEmail.isEmpty || logPassword.isEmpty){
                Fluttertoast.showToast(
                    msg: "InComplete info");
                return ;
              }
              try{
                FirebaseAuth auth = FirebaseAuth.instance;
                UserCredential userCredential =
                await auth.signInWithEmailAndPassword(email: logEmail, password: logPassword);
                if(userCredential != null){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const ListScreen()),
                  );
                }
              } on FirebaseAuthException catch(e){
                Fluttertoast.showToast(msg: e.message!);
              }
            }

            if(isSignupScreen){
              String name = nameController.text.trim();
              String email = emailCOntroller.text.trim();
              String password = passwordControler.text.trim();
              String conformPassword = conformPasswordController.text.trim();
              if(name.isEmpty || email.isEmpty || password.isEmpty || conformPassword.isEmpty){
                // show Toast
                return;
              };
              if(password != conformPassword){
                Fluttertoast.showToast(msg: "password no match");
                return ;
              }

              ProgressDialog progressdial = ProgressDialog(context, title: Text("Sign Up"), message: Text("Please Wait"));
              progressdial.show();
             try{
               FirebaseAuth auth = FirebaseAuth.instance;
               UserCredential userCridentails =
               await auth.createUserWithEmailAndPassword(email: email, password: password);
             }on FirebaseAuthException catch(e){
               Fluttertoast.showToast(msg: e.message!);
             }
             isSignupScreen = false;
             setState(() {
               Fluttertoast.showToast(msg: "$isSignupScreen");
             });
             progressdial.dismiss();


            }
          },
          child: Container(
            height: 90,
            width: 90,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                ),
            child: Container(
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Colors.red,Colors.orange ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.3),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 1))
                        ]),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  //  TEXT BUTTON
  TextButton buildTextButton(IconData icon, String title, Color backgroundColor) {
    return TextButton(
      onPressed: () {
      },
      style: TextButton.styleFrom(
          side: const BorderSide(width: 1, color: Colors.grey),
          minimumSize: const Size(145, 40),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: backgroundColor),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }
}

