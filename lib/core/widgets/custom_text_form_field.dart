import 'package:ahu_hcs/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/presentation/manager/login/login_cubit.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.right,
      keyboardType: TextInputType.number,
      onFieldSubmitted: (value) => FocusScope.of(context).unfocus(),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      inputFormatters: [
        LengthLimitingTextInputFormatter(12),
        FilteringTextInputFormatter.digitsOnly,
      ],
      onChanged: (value) {
        BlocProvider.of<LoginCubit>(context).traineeId = controller.text.trim();
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'الحقل مطلوب';
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
        hintText: 'رقم الطالب',
        hintTextDirection: arabic,
        suffixIcon: Icon(Icons.person),
      ),
    );
  }
}

class CustomSecureTextFormField extends StatefulWidget {
  const CustomSecureTextFormField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<CustomSecureTextFormField> createState() =>
      _CustomSecureTextFormFieldState();
}

class _CustomSecureTextFormFieldState extends State<CustomSecureTextFormField> {
  bool secure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: secure,
      textAlign: TextAlign.right,
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      onFieldSubmitted: (value) => FocusScope.of(context).unfocus(),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      onChanged: (value) {
        BlocProvider.of<LoginCubit>(context).password = widget.controller.text;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'الحقل مطلوب';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: 'كلمة المرور',
        hintTextDirection: arabic,
        suffixIcon: const Icon(CupertinoIcons.lock_fill),
        prefixIcon: IconButton(
          icon: secure
              ? const Icon(Icons.remove_red_eye)
              : const Icon(Icons.visibility_off),
          onPressed: () {
            setState(() {
              secure = !secure;
            });
          },
        ),
      ),
    );
  }
}
