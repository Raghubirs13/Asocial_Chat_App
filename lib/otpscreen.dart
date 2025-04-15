import 'package:asocial_app/namescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';

class Otpscreen extends StatefulWidget {
  const Otpscreen({super.key});

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFFFF4D83), Color(0xFFD57DF1)],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 55,bottom: 40),
                        height: 43.22999954223633,
                        width: 43.22999954223633,
                        decoration:BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Icon(Icons.arrow_back,
                        size: 18,
                        ),

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("Verification code",style:
                    TextStyle(fontSize: 30,fontFamily: 'Poppins-Light',
                        color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("Please enter verfication code sent to \nMobile number.",
                      style: TextStyle(fontFamily: 'Poppins-Light',color: Colors.white,fontSize: 18),),
                  ),
                  SizedBox(height: 18,),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60))
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 100),
                              child: SvgPicture.asset('assets/icons/roundtick.svg',semanticsLabel: 'roundtick',
                                height: 165,
                              width: 197,)
                            ),
                            SizedBox(height: 79),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,right: 20),
                              child: Pinput(
                                length: 6,
                                showCursor: true,
                                defaultPinTheme: PinTheme(
                                  width: 54,
                                  height: 53,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),

                                    border: Border.all(color: Color(0xFFA8A8A8),width: 1)
                                  )

                                  ),
                                focusedPinTheme: PinTheme(
                                  width: 54,
                                  height: 53,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(color: Color(0xFFD57DF1).withOpacity(0.1),width: 1),
                                    color: Color(0xFFD57DF1).withOpacity(0.1)
                                  )
                                ),
                                ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 20,left: 20,right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(" Didn't received code?",
                                  style: TextStyle(color: Color(0xFFA8A8A8),fontSize: 14,fontFamily: 'Poppins-Light'),

                                ),
                                GestureDetector(
                                  child: Text("Resend  ",
                                    style: TextStyle(color: Color(0xFFD67AEA),fontSize: 14,fontFamily: 'Poppins-Light',
                                    decoration: TextDecoration.underline,decorationThickness: 1.5,decorationColor: Color(0xFFD67AEA)),

                                ),
                                  onTap: () {},

                                )
                              ],
                            ) ),
                            SizedBox(height: 80),
                            Container(
                                height: 60,
                                width: double.infinity,
                                margin: EdgeInsets.only(left: 20,right: 20),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [Color(0xFFFF4D83),Color(0xFFD57DF1)]),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child:ElevatedButton(onPressed: () {
                                  Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Namescreen()));
                                },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      )
                                  ),
                                  child: Text("Submit",style: TextStyle(color: Colors.white,fontFamily: 'Poppins-Light'),),
                                )),





                          ],
                        ),
                      ),
                    ),
                  )

                ],
              ) ,
          )),
    );
  }
}
