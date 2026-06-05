import 'package:dentist_hospital_system/Auth/Patient_auth/patient_register_screen.dart';
import 'package:dentist_hospital_system/Users/Admin/Screens/Admin_Dashboard.dart';
import 'package:dentist_hospital_system/Users/Doctor/screens/Doctor_Dashboard.dart';
import 'package:dentist_hospital_system/Users/Patient/screens/Patient_main_screen/Patient_main_screen.dart';
import 'package:dentist_hospital_system/Users/Student/screens/Student_Dashboard.dart';
import 'package:dentist_hospital_system/Auth/main_auth/app_session.dart';
import 'package:dentist_hospital_system/Auth/main_auth/session_manager.dart';
import 'package:dentist_hospital_system/Auth/main_auth/user_role.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordVisible = true;
  bool isLoading = false;

  /// ================= LOGIN LOGIC =================
  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showError("Please enter email and password");
      return;
    }

    setState(() => isLoading = true);

    await Future.delayed(const Duration(milliseconds: 500)); // simulate delay

    UserRole? role;

    if (email == "admin@gmail.com" && password == "12345678") {
      role = UserRole.admin;
    } else if (email == "doctor@gmail.com" && password == "12345678") {
      role = UserRole.doctor;
    } else if (email == "student@gmail.com" && password == "12345678") {
      role = UserRole.student;
    } else if (email == "patient@gmail.com" && password == "12345678") {
      role = UserRole.patient;
    } else {
      setState(() => isLoading = false);
      _showError("Wrong Email Or Password");
    }
    

    // if (role == null) {
    //   setState(() => isLoading = false);
    //   _showError("Invalid credentials");
    //   return;
    // }

    /// Save session
    await SessionManager.saveSession(role!);
    AppSession.currentRole = role;

    /// Navigate
    _navigateToDashboard(role);
  }

  /// ================= NAVIGATION =================
  void _navigateToDashboard(UserRole role) {
    Widget screen;

    switch (role) {
      case UserRole.admin:
        screen = const Admin_DashBoard();
        break;
      case UserRole.doctor:
        screen = const Doctor_DashBoard();
        break;
      case UserRole.student:
        screen = const Student_DashBoard();
        break;
      case UserRole.patient:
        screen = PatientHomeScreen();
        break;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  /// ================= ERROR =================
  void _showError(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  /// ================= UI =================
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
                Image.asset("images/New_Mansoura_University.png", height: 80),

                const SizedBox(height: 10),

                const Text(
                  "NMU Dentistry Hospital",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 25),

                /// EMAIL
                TextField(
                  controller: emailController,
                  decoration: _inputDecoration("Email", Icons.email_outlined),
                ),

                const SizedBox(height: 15),

                /// PASSWORD
                TextField(
                  controller: passwordController,
                  obscureText: isPasswordVisible,
                  decoration: _inputDecoration(
                    "Password",
                    Icons.lock_outline,
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
                ),

                const SizedBox(height: 20),

                /// LOGIN BUTTON
                ElevatedButton(
                  onPressed: /*isLoading ? null*/ login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff941419),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child:
                      isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                ),

                const SizedBox(height: 10),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PatientRegistrationScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.black),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PatientRegistrationScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Register as a patient",
                    style: TextStyle(color: Color(0xff941419)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(
    String label,
    IconData icon, {
    Widget? suffix,
  }) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      suffixIcon: suffix,
      filled: true,
      fillColor: Colors.grey[100],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    );
  }
}
