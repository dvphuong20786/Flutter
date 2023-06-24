import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:prod_mobile/src/app/components/text-field/text-field.cubit.dart';


class TextFieldView extends StatefulWidget {
  //final List<String Function(dynamic)> validators;
  final String title;
  final String attribute;
 // final String initialValue;
 // final String validators;

  const TextFieldView({super.key,
    required this.attribute,
    required this.title,
   // required this.validators,
    //required this.initialValue
  });
  @override
  State<StatefulWidget> createState() => TextFieldState();
}

class TextFieldState extends State<TextFieldView> {
  final TextFieldCubit _cubit = TextFieldCubit();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 4,
      shadowColor: const Color(0xFFD0DCE3),
      child: Builder(
        builder: (context) {
          switch (widget.attribute) {
            case "password":
              return BlocBuilder<TextFieldCubit, bool>(
                bloc: _cubit,
                builder: (context, hasShowPassword) {
                  return FormBuilderTextField(
                    maxLines: 1,
                    name: widget.attribute,
                    //initialValue: widget.initialValue,
                    style: const TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                      hintText: widget.title,
                      hintStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Color(0xFF7A7A7A)),
                      border: const OutlineInputBorder(borderSide: BorderSide.none),
                      suffixIcon: IconButton(
                        icon: hasShowPassword  ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                        onPressed: () => _cubit.toggleIconPassword(),
                      ),
                      prefixIcon: Image.asset("assets/images/login/ic_input_login_pass.png", scale: 3),
                    ),
                    obscureText:  !hasShowPassword,
                    keyboardType: TextInputType.text,
                    //validator: widget.validators,
                  );
                },
              );
            case "user_name":
              return FormBuilderTextField(
                maxLines: 1,
               //initialValue: widget.initialValue,
                name: widget.attribute,
                style: const TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  hintText: widget.title,
                  hintStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Color(0xFF7A7A7A)),
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  prefixIcon: Image.asset("assets/images/login/ic_input_login_name.png", scale: 3),
                ),
                keyboardType: TextInputType.text,

               // validators: widget.validators, name: '',
              );
            default:
              return BlocBuilder<TextFieldCubit, bool>(
                bloc: _cubit,
                builder: (context, hasShowPassword) {
                  return FormBuilderTextField(
                    maxLines: 1,
                    name: widget.attribute,
                    //initialValue: widget.initialValue,
                    style: const TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      contentPadding:const EdgeInsets.symmetric(horizontal: 10),
                      hintText: widget.title,
                      hintStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Color(0xFF7A7A7A)),
                      border:const OutlineInputBorder(borderSide: BorderSide.none),
                      suffixIcon: IconButton(
                        icon: hasShowPassword ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                        onPressed: () => _cubit.toggleIconPassword(),
                      ),
                      prefixIcon: Image.asset("assets/images/login/ic_input_login_pass.png", scale: 3),
                    ),
                    obscureText: !hasShowPassword,
                    keyboardType: TextInputType.text,
                    //validator: widget.validators,
                  );
                },
              );
          }
        },
      ),
    );
  }
}
