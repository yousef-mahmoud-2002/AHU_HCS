import 'package:ahu_hcs/constants.dart';
import 'package:flutter/material.dart';
import 'widgets/card_title.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import 'widgets/login_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              padding: const EdgeInsets.only(right: 12, top: 8),
              width: 250,
              child: Image.asset(kAhuLogo),
            ),
            Center(
              child: Form(
                key: formKey,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 36,
                  ),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: kShadowColor,
                        offset: Offset(8, 8),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(kAppLogo, height: 80),
                      const SizedBox(height: 12),
                      const CardTitle(),
                      const SizedBox(height: 24),
                      CustomTextFormField(controller: numberController),
                      const SizedBox(height: 16),
                      CustomSecureTextFormField(controller: passwordController),
                      const SizedBox(height: 36),
                      LoginButton(formKey: formKey),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
