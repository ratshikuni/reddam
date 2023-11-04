import 'package:app/screens/Detail.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //form key for validation of the form
  final _formKey = GlobalKey<FormState>();

  /// Variables to store country state city data in onChanged method.
  String? countryValue;
  String? provinceValue;
  String? cityValue;

  //editing controllers
  //To control the text boxes for:
  // Name, Surname,Username,Password,
  //Email,Confirm Password,Suburb & City

  final TextEditingController nameEditingController =
      new TextEditingController();
  final TextEditingController surnameEditingController =
      new TextEditingController();
  final TextEditingController usernameEditingController =
      new TextEditingController();
  final TextEditingController passwordEditingController =
      new TextEditingController();
  final TextEditingController emailEditingController =
      new TextEditingController();
  final TextEditingController confirmPasswordEditingController =
      new TextEditingController();
  final TextEditingController suburbEditingController =
      new TextEditingController();
  final TextEditingController cityEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Name field
    //validation : must be filled in
    //validation : must be 3 Characters Minimum
    final nameField = TextFormField(
      autofocus: false,
      controller: nameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Name Cannot be Empty");
        }

        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Name (3 Characters Min)");
        }
        return null;
      },
      onSaved: (value) {
        nameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          filled: true, //<-- SEE HERE
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //Surname field
    //validation : must be filled in
    //validation : must be 3 Characters Minimum
    final surnameField = TextFormField(
      autofocus: false,
      controller: surnameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Surname Cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        surnameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          filled: true, //<-- SEE HERE
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Last Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //Username field
    //validation : must be filled in
    final usernameField = TextFormField(
      autofocus: false,
      controller: usernameEditingController,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Username Cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        usernameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          filled: true, //<-- SEE HERE
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Username",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //Email field
    //validation : must be filled in
    //validation : must be valid Email
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        //reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          filled: true, //<-- SEE HERE
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //Password field
    //validation : must be filled in
    //validation : must be 6 Characters Minimum
    final passwordField = TextFormField(
      obscureText: true,
      autofocus: false,
      controller: passwordEditingController,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return "Password Required";
        }

        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Password (6 Characters Min)");
        }
      },
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          filled: true, //<-- SEE HERE
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //Confirm Password field
    //validation : must be filled in
    //validation : must be 6 Characters Minimum
    //Validation: Must match Password
    final confirmPasswordField = TextFormField(
      obscureText: true,
      autofocus: false,
      controller: confirmPasswordEditingController,
      validator: (value) {
        if (confirmPasswordEditingController.text !=
            passwordEditingController.text) {
          return "Passwords don't match";
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          filled: true, //<-- SEE HERE
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //Sign Up Button
    //Calls SignUp Method with email and password
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFFA78E3C),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DetailScreen())); //
          showSnackBar("we have signed in", Duration(seconds: 3));

          //signup
        },
        child: Text(
          "Sign Up",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    //designing the screen
    //consists of text fields for user input
    //and a sign up button
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 7, 41, 69),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 30,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFFA78E3C),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
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
                    height: 100,
                    child: Image.asset(
                      'assets/logo.jpeg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  nameField,
                  SizedBox(
                    height: 10,
                  ),
                  surnameField,
                  SizedBox(
                    height: 10,
                  ),
                  usernameField,
                  SizedBox(
                    height: 10,
                  ),
                  emailField,
                  SizedBox(
                    height: 10,
                  ),
                  passwordField,
                  SizedBox(
                    height: 10,
                  ),
                  confirmPasswordField,
                  SizedBox(
                    height: 10,
                  ),

                  ///Adding CSC Picker Widget in app

                  SizedBox(
                    height: 20,
                  ),
                  signUpButton,
                ]),
          ),
        ),
      ))),
    );
  }

  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(
      content: Text(snackText),
      duration: d,
      backgroundColor: Colors.amber,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  //this methos is used to post the values
  //entered\
}
