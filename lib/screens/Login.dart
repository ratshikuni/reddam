import 'package:app/screens/Home.dart';
import 'package:app/screens/Registration.dart';
import 'package:app/screens/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

// models.dart

Future<http.Response> createAlbum(String email, String password) {
  return http.post(
    Uri.parse(
        'https://reddam.agreeableplant-3f520c83.southafricanorth.azurecontainerapps.io/studentsignin'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );
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
    // final loginButton = Material(
    //   elevation: 5,
    //   borderRadius: BorderRadius.circular(30),
    //   color: Color(0xFFA78E3C),
    //   child: MaterialButton(
    //     padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    //     minWidth: MediaQuery.of(context).size.width,
    //     onPressed: () {
    //       showSnackBar("we have signed in", Duration(seconds: 3));
    //       Navigator.of(context).pushReplacement(
    //           MaterialPageRoute(builder: (context) => HomeScreen()));
    //     },
    //     child: const Text(
    //       "Login",
    //       textAlign: TextAlign.center,
    //       style: TextStyle(
    //           fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
    //     ),
    //   ),
    // );
    // Replace your existing loginButton code with this
    // Replace your existing loginButton code with this
    final loginButton = Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () async {
          print("email" + emailController.text.toString());
          print("password" + passwordController.text.toString());

          if (emailController.text.isEmpty) {
            showSnackBar("Enter Your email", Duration(seconds: 3));
          }
          if (passwordController.text.isEmpty) {
            showSnackBar("Enter Your password", Duration(seconds: 3));
          } else if (emailController.text.isNotEmpty &&
              passwordController.text.isNotEmpty) {
            final response = await createAlbum(
                emailController.text, passwordController.text);

            print("clicked");

            Album album = Album.fromJson(jsonDecode(response.body));

            if (response.statusCode == 200) {
              print("it works" + jsonDecode(response.body).toString());

              // String message = album.message;
              // print("we got $message");
              // print("$album");

              String name = album.user.email;
              print("we got $name");
              print("$name");
              print("sd");

              // showSnackBar("we have signed in", Duration(seconds: 5));
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => HomeScreen(
                    objct: album,
                  ),
                ),
              );
            } else {
              print("it doens" + jsonDecode(response.body).toString());

              int code = response.statusCode;
              print("it 't work");
              // String message = album.message;
              // print("we got $message");
              // showSnackBar("$message", Duration(seconds: 3));
            }

            // showSnackBar("we have signed in", Duration(seconds: 3));
            // Navigator.of(context).pushReplacement(
            //   MaterialPageRoute(builder: (context) => HomeScreen()),
            // );
          }
        },
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFA78E3C), // Background color
          onPrimary: Colors.white, // Text color
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1D2A3B),
          ),
        ),
      ),
    );

    //designing the screen
    //consists of two text fields
    //login button and forgot password button
    return Scaffold(
        backgroundColor: Color(0xFF1D2A3B),
        body: Center(
            child: SingleChildScrollView(
                child: Container(
          color: Color(0xFF1D2A3B),
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 30),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/logo.jpeg',
                        // width: 250,
                        // height: 250,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 50),
                    Text(
                      'C C E',
                      style: const TextStyle(
                        color: Color(0xFFA78E3C),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Co-ordinate Community Engagement',
                      style: const TextStyle(
                        color: Color(0xFFA78E3C),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
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
                                  builder: (context) =>
                                      const RegistrationScreen()),
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
