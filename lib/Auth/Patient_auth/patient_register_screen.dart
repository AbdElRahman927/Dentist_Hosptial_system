import 'package:dentist_hospital_system/Auth/Patient_auth/patient_register_model.dart';
import 'package:dentist_hospital_system/Auth/Patient_auth/widgets/patient_register_button.dart';
import 'package:dentist_hospital_system/Auth/Patient_auth/widgets/patient_register_form.dart';
import 'package:dentist_hospital_system/Auth/Patient_auth/widgets/patient_register_header.dart';
import 'package:dentist_hospital_system/Auth/Patient_auth/widgets/patient_register_terms.dart';
import 'package:flutter/material.dart';

class PatientRegistrationScreen extends StatefulWidget {
  const PatientRegistrationScreen({super.key});

  @override
  State<PatientRegistrationScreen> createState() =>
      _PatientRegistrationScreenState();
}

class _PatientRegistrationScreenState extends State<PatientRegistrationScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  bool isPasswordVisible = true;
  bool isLoading = false;
  bool agreeToTerms = false;

  void register() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        phoneController.text.isEmpty) {
      _showError("Please fill all the fields");
      return;
    }

    if (!agreeToTerms) {
      _showError("You must agree to terms");
      return;
    }
    final patient = PatientauthModel(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      phone: phoneController.text.trim(),
    );

    /// 🔥 You will handle API here
    print(patient.toJson());

    Navigator.pop(context); // back to login
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/t-6.jpg'),
            fit: BoxFit.cover,
            opacity: 0.6,
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withValues(alpha: 0.2),
                ),
              ],
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                const RegisterHeader(),

                const SizedBox(height: 20),

                RegisterInputField(
                  label: "Full Name",
                  icon: Icons.person,
                  controller: nameController,
                ),

                const SizedBox(height: 15),

                RegisterInputField(
                  label: "Email",
                  icon: Icons.email,
                  controller: emailController,
                ),

                const SizedBox(height: 15),

                RegisterInputField(
                  label: "Phone",
                  icon: Icons.phone,
                  controller: phoneController,
                ),

                const SizedBox(height: 15),

                RegisterInputField(
                  label: "Password",
                  icon: Icons.lock,
                  controller: passwordController,
                  obscure: isPasswordVisible,
                  suffix: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 10),

                RegisterTerms(
                  value: agreeToTerms,
                  onChanged: (v) => setState(() => agreeToTerms = v ?? false),
                ),

                const SizedBox(height: 10),

                RegisterButton(onPressed: register, isLoading: isLoading),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
