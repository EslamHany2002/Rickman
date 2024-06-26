import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rickman/auth/authenticationServices.dart';
import 'package:rickman/presentation/UI/Login/Login.dart';
import 'package:rickman/presentation/UI/Widgets/CustomPasswordTextFormField.dart';
import 'package:rickman/presentation/UI/Widgets/CustomTextFormField.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final List<String> genderOptions = ['Male', 'Female'];
  String? selectedGender = 'Male'; // Initialize the selected gender value

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 75),
                child: Image.asset(
                  "Assets/Images/Horizontal_Brain_Cancer_Logo.png",
                  height: 100,
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              label: "First name",
                              controller: firstNameController,
                              inputType: TextInputType.name,
                              icon: EvaIcons.person,
                              validator: nameValidation,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: CustomTextFormField(
                              label: "Last name",
                              controller: lastNameController,
                              inputType: TextInputType.name,
                              icon: EvaIcons.person,
                              validator: nameValidation,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              label: "Age",
                              controller: ageController,
                              inputType: TextInputType.number,
                              icon: Icons.cake_outlined,
                              validator: nameValidation,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              focusColor: Colors.black,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(20),
                                labelText: 'Gender',
                                prefixIcon: Icon(
                                  Icons.people_alt_outlined,
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      width: 2,
                                      color: Colors.black,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      width: 2,
                                      color: Colors.black,
                                    )),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      width: 2,
                                      color: Colors.red,
                                    )),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      width: 2,
                                      color: Colors.red,
                                    )),
                              ),
                              // **Bind the controller to the selected value:**
                              value: selectedGender,
                              items: genderOptions.map((String gender) {
                                return DropdownMenuItem<String>(
                                  value: gender,
                                  child: Text(gender),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                // **Update the controller when a new value is selected:**
                                setState(() {
                                  selectedGender = value;
                                  genderController.text = value!;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select gender';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      CustomTextFormField(
                        label: "Email",
                        controller: emailController,
                        inputType: TextInputType.emailAddress,
                        icon: EvaIcons.email,
                        validator: emailValidation,
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      CustomTextFormField(
                        label: "Phone",
                        controller: phoneController,
                        inputType: TextInputType.phone,
                        icon: EvaIcons.phone,
                        validator: phoneValidation,
                      ),

                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      CustomPasswordTextFormField(
                        label: "Password",
                        controller: passwordController,
                        inputType: TextInputType.visiblePassword,
                        icon: EvaIcons.lock,
                        validator: passwordValidation,
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      CustomPasswordTextFormField(
                        label: "Confirm password",
                        controller: passwordConfirmationController,
                        inputType: TextInputType.visiblePassword,
                        icon: EvaIcons.lock,
                        validator: passwordConfirmationValidation,
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      // Register Button
                      ElevatedButton(
                          style: ButtonStyle(
                            foregroundColor:
                            MaterialStateProperty.all(Colors.black),
                            backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            textStyle: MaterialStateProperty.all(
                                const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white)),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              AuthenticationServices().register(
                                  context,
                                  firstNameController.text,
                                  lastNameController.text,
                                  ageController.text,
                                  genderController.text,
                                  emailController.text,
                                  phoneController.text,
                                  passwordController.text,
                                  passwordConfirmationController.text);
                            }
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              ),
                            ],
                          )),

                      // Login Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already Have Account?",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const Login()));
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  String? nameValidation(String name) {
    if (name.isEmpty) {
      return "Name can't be empty";
    } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%-]').hasMatch(name)) {
      return "Invalid name";
    } else {
      return null;
    }
  }

  // validate on the email form
  String? emailValidation(String input) {
    if (input.isEmpty) {
      return "Email can't be empty";
    } else if (!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+"
    r"@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(input)) {
      return "Enter a valid email";
    }
    return null;
  }

  String? passwordValidation(String input) {
    if (input.isEmpty) {
      return "Password can't be empty";
    } else if (input.length < 8) {
      return "Invalid password length";
    }
    return null;
  }

  // validate the password confirmation is not empty and the same as the password
  String? passwordConfirmationValidation(String input) {
    if (input.isEmpty) {
      return "Password can't be empty";
    } else if (input != passwordController.text) {
      return "Password does not match";
    }
    return null;
  }

  String? phoneValidation(String value) {
    if (value.isEmpty) {
      return "Enter phone number";
    } else if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)) {
      return "Enter valid mobile number";
    }
    return null;
  }
}
