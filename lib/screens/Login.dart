import 'package:app/screens/Home.dart';
import 'package:app/screens/Registration.dart';
import 'package:flutter/material.dart';

class EmailFieldValidator {
  static String? validate(String? value) {
    //static becuase we won't have to create an instance
    if (value!.isEmpty) {
      return "Please Enter Your Email";
    }
    //reg expression for email validation
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      return "Please enter a valid email";
    }
    return null;
  }
}

class PasswordFieldValidator {
  static String? validate(String? value) {
    RegExp regex = new RegExp(r'^.{6,}$');
    if (value!.isEmpty) {
      return "Password Required";
    }

    if (!regex.hasMatch(value)) {
      return "Please Enter Valid Password (6 Characters Min)";
    }
    return null;
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //form key

  final _formKey = GlobalKey<FormState>();

  //editing controllers
  //for email and password
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  //firebase

  @override
  Widget build(BuildContext context) {
    //email field
    //validation : must be filled in
    //validation : must be valid
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: EmailFieldValidator.validate,
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          filled: true, //<-- SEE HERE
          fillColor: Colors.white,
          // prefixIconColor: Colors.white,
          // hintStyle: TextStyle(color: Colors.white),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //password field
    //validation : must be filled in
    //validation : must be minimum 6 characters
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: PasswordFieldValidator.validate,
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          filled: true, //<-- SEE HERE
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //login Buttong
    //On Pressed : sends email and password
    //to Sign In method
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFFA78E3C),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          showSnackBar("we have signed in", Duration(seconds: 3));
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        child: const Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    //designing the screen
    //consists of two text fields
    //login button and forgot password button
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 7, 41, 69),
        body: Center(
            child: SingleChildScrollView(
                child: Container(
          color: Color.fromARGB(255, 7, 41, 69),
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 400,
                      child: Image.asset(
                        'assets/logo.jpeg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    emailField,
                    const SizedBox(
                      height: 30,
                    ),
                    passwordField,
                    const SizedBox(
                      height: 30,
                    ),
                    loginButton,
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            //to be added for future
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: Color(0xFFA78E3C),
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            color: Color(0xFFA78E3C),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("now going to registration page");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegistrationScreen()),
                            );
                          },
                          child: const Text(
                            "Sign Up ",
                            style: TextStyle(
                                color: Color(0xFFA78E3C),
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        )
                      ],
                    )
                  ]),
            ),
          ),
        ))));
  }

  //sign in method
  //sends email and password to firebase
  //authenticates the email and password
  //if details are valid,proceed to home screen
  // else error message is displayed in snack bar

  // snack bar method for displaying errors during Login
  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(
      content: Text(snackText),
      duration: d,
      backgroundColor: Color(0xFFA78E3C),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
