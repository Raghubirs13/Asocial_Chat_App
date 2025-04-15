import 'package:asocial_app/otpscreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

        body: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xFFFF4D83),Color(0xFFD57DF1)],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 68),
            child: Stack(
              children: [
                SvgPicture.asset(
                  'assets/images/dots.svg',
                  semanticsLabel: 'dots',
                  height: 185.22488403320312,
                  width:295.271728515625 ,
                ),
                Positioned(
                    top: 20,
                    left: 20,


                    child: Padding(
                        padding: EdgeInsets.all(8),
                        child: SvgPicture.asset('assets/icons/adots.svg',
                        semanticsLabel: 'Asocial',
                        height: 142.75,
                        width: 236,),
                    ))
              ],
            )
          ),

          Expanded(
              child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(98)
              )
            ),
            child: SingleChildScrollView(

            child: Column(
              children: [
                Container(

                  alignment: Alignment.topLeft,
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 60, left: 20),

                  child: Image.asset('assets/images/Welcome.png'),

                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 20,top: 15),
                  child: Text('A new and exciting way to meet\npeople',

                      style: TextStyle(fontSize: 18,
                          color: Color(0xFFA8A8A8),
                          fontFamily: 'Poppins-Light',
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.left),


                ),
                Container(
                  height: 50,
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 20, top: 30,right: 20),
                  child: TextField(
                    keyboardType: TextInputType.phone,

                    decoration: InputDecoration(

                      border: OutlineInputBorder(

                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFDEDEDE),width: 1),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFDEDEDE),width: 1),
                        borderRadius: BorderRadius.circular(20)
                      ),

                      labelText: "  Mobile Number",
                      hintText: "Enter your mobile number",
                      hintStyle: TextStyle(
                        color: Color(0xFFA8A8A8),
                        fontSize: 16,
                        fontFamily: 'Poppins-Light',
                        decoration: TextDecoration.none,

                      ),
                      labelStyle: TextStyle(
                        color: Color(0xFFE3E3E3),
                        fontSize: 16,
                        fontFamily: 'Poppins-Light',
                        decoration: TextDecoration.none,


                      ),
                      prefixIcon: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,

                        children: [
                          Padding(padding:EdgeInsets.only(left: 14),
                              child: Image.asset('assets/icons/caller.png',height: 26,width: 26,matchTextDirection: true,)),
                          VerticalDivider(
                            color: Color(0xFFDEDEDE),
                            thickness: 1,
                            width: 20,
                            indent: 8,
                            endIndent: 8,


                          )


                    ]
                      )

                  ),
                ),

                ),
                Padding(padding: EdgeInsets.only(top: 15,left: 14) ,
                  child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(value: isChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            isChecked = newValue!;
                          });
                        },
                      activeColor: Colors.white,
                      
                      checkColor: Color(0xFF403C3E),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      side: WidgetStateBorderSide.resolveWith(
                        (states) => BorderSide(width: 1.0, color: Color(0xFF403C3E))

                      ),
                ),
                    Expanded(
                        child: RichText(text: TextSpan(
                            text: 'Agree to our',
                            style: TextStyle(color: Color(0xFFA8A8A8),fontSize: 14),
                            children: [

                              TextSpan(
                                  text: ' Terms',
                                  style: TextStyle(color: Color(0xFFD67AEA),fontSize: 14),
                                  recognizer: TapGestureRecognizer()
                              ),
                              TextSpan(
                                  text: ' and',
                                  style: TextStyle(color: Color(0xFFA8A8A8),fontSize: 14
                                  )
                              ),
                              TextSpan(
                                  text: ' Data Policy',
                                  style: TextStyle(color: Color(0xFFD67AEA),fontSize: 14),
                                  recognizer: TapGestureRecognizer()
                              )

                            ]
                        ),

                        ) ),

            ]
                )
                ),
                SizedBox(height: 25),
                Container(
                  height: 60,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 20,right: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Color(0xFFFF4D83),Color(0xFFD57DF1)]),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child:ElevatedButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Otpscreen()),  );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                  ),
                    child: Text("Get Verification Code",style: TextStyle(color: Colors.white,fontFamily: 'Poppins-Light'),),
                )),
                SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Expanded(
                      child: Padding(padding: EdgeInsets.only(left: 75),
                        child: Divider(color: Color(0xFFDADADA)))),
                    Text('Login With',style: TextStyle(color: Color(0xFFDADADA),fontSize: 17),),
                    Expanded(
                        child: Padding(padding: EdgeInsets.only(right: 75),
                        child: Divider(color: Color(0xFFDADADA)))
    ),
                  ]
                ),
                SizedBox(height:20),
                Container(
                  margin: EdgeInsets.only(left: 80,right: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [

                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(10),
                          backgroundColor: Colors.white,
                          shadowColor: Colors.grey,

                        ),

                        child:  SvgPicture.asset(
                          'assets/icons/apple.svg',
                          semanticsLabel: 'Apple',
                          height: 30,
                          width: 30,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(10),
                          backgroundColor: Colors.white,
                          shadowColor: Colors.grey,

                        ),

                        child:  Image.asset(
                          'assets/icons/facebook.jpg',

                          height: 30,
                          width: 30,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(10),
                          backgroundColor: Colors.white,
                          shadowColor: Colors.grey,

                        ),

                        child:  Image.asset(
                          'assets/icons/Google.jpg',
                          height: 30,
                          width: 30,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                    height: 60,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 20,right: 20),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child:ElevatedButton(onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Color(0xFFD67AEA),width: 1)
                          )
                      ),
                      child: Text("Skip Signup",style: TextStyle(color: Color(0xFFD67AEA),fontFamily: 'Poppins-Light'),),
                    )),




              ],
            ),)

          ))

        ]
      )


    ),


        );
  }
}