import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillconnect/common/constants.dart';
import 'package:skillconnect/common/custom_text_field.dart';
import 'package:skillconnect/features/auth/controllers/auth_controller.dart';
import 'package:skillconnect/features/auth/frontend/screens/login/login_screen.dart';
import 'package:skillconnect/features/auth/models/user.dart';

import '../../../../../common/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    _skillsController.dispose();
    _detailsController.dispose();
  }

  void signUp() {
    AuthController controller = AuthController();
    UserModel model = UserModel(
        uid: '',
        name: _nameController.text,
        email: _emailController.text,
        details: _detailsController.text,
        password: _passwordController.text,
        skills: _skillsController.text,
        profilePictureUrl: '');
    controller.register(context, model);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: makeAppBar(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Sign Up Time!! 🔥",
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "We are super excited to see you here! 😄",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Stack(
                children: [
                  imageFile != null
                      ? CircleAvatar(
                          radius: 40,
                          backgroundImage: FileImage(imageFile!),
                        )
                      : const CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage('assets/images/avatar.png'),
                        ),
                  Positioned(
                    left: 35,
                    //trial and error
                    top: 40,
                    child: IconButton(
                      onPressed: () {
                        pickImage(context);
                        setState(() {
                          //it will update the imageFile value;
                        });
                      },
                      icon: const Icon(
                        Icons.add_a_photo,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: size.height * 0.62,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              child: Card(
                elevation: 8.0,
                child: Container(
                  alignment: Alignment.center,
                  height: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextField(
                              controller: _nameController, hintText: 'Name'),
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'Email',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          CustomTextField(
                              controller: _passwordController,
                              isObscure: true,
                              hintText: 'Password'),
                          CustomTextField(
                              controller: _detailsController,
                              maxLength: null,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              hintText: 'Some Details about you! 😄'),
                          CustomTextField(
                              controller: _skillsController,
                              hintText: 'Your skills?👀'),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?\t",
                  style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
                ),
                InkWell(
                  onTap: () {
                    moveScreen(context, const LoginScreen(),
                        isPushReplacement: true);
                  },
                  child: Text(
                    "Login here!",
                    style: GoogleFonts.poppins(
                        color: Colors.purple,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 80),
              height: size.height * 0.06,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  signUp();
                },
                child: Text(
                  "Sign Up! 🔥",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
