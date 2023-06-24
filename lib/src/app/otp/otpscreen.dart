import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:prod_mobile/src/app/home/home.view.dart';
import 'package:prod_mobile/src/routers/application.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController email = new TextEditingController();
  TextEditingController otp = new TextEditingController();
  EmailOTP myauth = EmailOTP();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Security verification",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),

              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Email Verification Code",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: otp,
                        decoration: const InputDecoration(
                          hintText: "",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 10.0,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        myauth.setConfig(
                            appEmail: "lehuydau2312@gmail.com",
                            appName: "Email OTP",
                            userEmail: "lehuydau2312@gmail.com",
                            otpLength: 6,
                            otpType: OTPType.digitsOnly);
                        if (await myauth.sendOTP() == true) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content:
                            Text("OTP đã được gửi đến Gmail của bạn"),
                          ));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Oops, OTP send failed"),
                          ));
                        }
                      },
                        child: const Text("Get OTP"),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Enter the 6-digit code sent to le...@gmail.com",
                        style: TextStyle(fontSize: 13,color: Colors.grey),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Security verification unavailable?",
                        style: TextStyle(fontSize: 13,color: Colors.orange),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: 400,
                      height: 50,

                      child: ElevatedButton(
                          onPressed: () async {
                            if (await myauth.verifyOTP(otp: otp.text) == true) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("OTP is verified"),
                              ));
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()),
                              );
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Invalid OTP"),
                              ));
                            }

                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.yellow,
                            backgroundColor: Colors.red[600],
                          ),
                          child: const Text("Submit",style: TextStyle(fontSize: 16,color: Colors.white),)),

                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
