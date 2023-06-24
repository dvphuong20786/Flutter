import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i18n_extension/default.i18n.dart';
import 'package:prod_mobile/src/app/app.module.dart';
import 'package:prod_mobile/src/app/components/text-field/text-field.component.dart';
import 'package:prod_mobile/src/app/login/login.cubit.dart';
import 'package:prod_mobile/src/repositories/authentication/authentication.repository.dart';
import 'package:prod_mobile/src/routers/application.dart';
import 'package:prod_mobile/src/utils/api.dart';
import 'package:prod_mobile/src/utils/screen_config.dart';
import 'package:email_otp/email_otp.dart';
class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final LoginCubit _cubit = LoginCubit(AuthenticationRepository());
  EmailOTP myauth = EmailOTP();

  var otp;
//  final LocalAuthenticationService _localAuth = locator<LocalAuthenticationService>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: SizeConfig.screenHeight = 200,
              //expandedHeight: SizeConfig.safeBlockVertical * 22,
              primary: true,
              flexibleSpace: Center(
                child: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Image.asset('assets/images/login/img_main.png',
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ];
        },
        body: Container(
          color: Colors.black,
          child: Container(
            decoration: const BoxDecoration(
              //image: DecorationImage(image: AssetImage("assets/images/login/bg_screen.png"), fit: BoxFit.fill),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 2,
                        bottom: SizeConfig.blockSizeVertical * 1),
                    child: Image.asset('assets/images/login/logo_login.png',
                        height: SizeConfig.screenHeight = 120),
                  ),
                  Divider(
                    color: Colors.black,
                    endIndent: SizeConfig.safeBlockHorizontal * 30,
                    indent: SizeConfig.safeBlockHorizontal * 30,
                  ),
                  const Text("PRODUCTION SUPPORTING APPLICATION",
                      style: TextStyle(fontFamily: "HelveticaNeue")),
                  SizedBox(height: SizeConfig.safeBlockVertical),
                  Center(
                      child: Text('Version ${API.version}',
                          style: const TextStyle(
                              fontSize: 13, color: Colors.grey))),
                  SizedBox(height: SizeConfig.safeBlockVertical),
                  buildLoginWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildLoginWidget() {
    return Container(
      width: SizeConfig.screenWidth = 350,
      child: FormBuilder(
        key: _fbKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: SizeConfig.screenHeight = 35),
            const TextFieldView(
              attribute: 'user_name',
              title: "User name",
               //initialValue: Application.sharePreference!.getStringList("credentialData")!.elementAt(0)
            ),
            SizedBox(height: SizeConfig.screenHeight = 10),
            const TextFieldView(
              attribute: 'password',
              title: "Password",
              // initialValue: Application.sharePreference!.getStringList("credentialData")!.length == 4
              //  ? Application.sharePreference!.getStringList("credentialData")!.elementAt(2)
              //  : "",
            ),

            SizedBox(height: SizeConfig.screenHeight = 40),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ButtonTheme(
                    height: 45.0,
                    child: BlocBuilder<LoginCubit, LoginState>(
                      bloc: _cubit,
                      builder: (context, state) {
                        return AbsorbPointer(
                          absorbing: (state is Signing),
                          child: ElevatedButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              backgroundColor: Colors.red,
                              minimumSize: const Size(200, 50),
                            ),
                            onPressed: () async {
                              // myauth.setConfig(
                              //     appEmail: "lehuydau231200@gmail.com",
                              //     appName: "Email OTP",
                              //     userEmail: "lehuydau231200@gmail.com",
                              //     otpLength: 6,
                              //     otpType: OTPType.digitsOnly
                              // );
                              // if(await myauth.sendOTP() == true){
                              //   ScaffoldMessenger.of(context)
                              //       .showSnackBar(const SnackBar(
                              //     content: Text("OTP đã được gửi đến Gmail của bạn"),
                              //   ));
                              //
                              // }else{
                              //   ScaffoldMessenger.of(context)
                              //       .showSnackBar(const SnackBar(
                              //     content: Text("Oops, OTP send failed"),
                              //   ));
                              // }

                              if (_fbKey.currentState!.saveAndValidate()) {
                                if (await _cubit
                                    .login(_fbKey.currentState!.value)) {
                                  if (Application.sharePreference!
                                      .hasKey("token")) {
                                    Modular.to
                                        .pushReplacementNamed(AppModule.home);
                                  } else {
                                    Modular.to
                                        .pushReplacementNamed(AppModule.home);
                                  }
                                } else {
                                  Application.toastify.showToastNotification("Wrong User Name or Password");
                                }
                              } else {
                                Application.toastify.showToastNotification("Invalid Value");
                              }
                            },
                            child: !(state is Signing)? Text("Đăng nhập".i18n,style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                    ))
                                : Theme(
                                    data: ThemeData(
                                        cupertinoOverrideTheme:
                                            const CupertinoThemeData(
                                                brightness: Brightness.dark)),
                                    child: const CupertinoActivityIndicator(),
                                  ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


