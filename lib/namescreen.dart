import 'dart:io';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class Namescreen extends StatefulWidget {
  const Namescreen({super.key});

  @override
  State<Namescreen> createState() => _NamescreenState();
}

class _NamescreenState extends State<Namescreen> {

  int _currentStep = 0;

  void _nextStep() {
    if (_currentStep < 3) {
      setState(() {
        _currentStep++;
      });
    }
  }


  void _onStepTapped(int step) {
    setState(() {
      _currentStep = step;
    });
  }


  final TextEditingController _date = TextEditingController();

  Future<void> _selectDate() async {
    final DateTime?picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1901, 1),
      lastDate: DateTime(2100),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );
    if (picked != null) {
      setState(() {
        _date.text = picked.toString().split(" ")[0];
      });
    }
  }

  String selectedGender = "";
  List<String> genderName = ["Male", "Female", "Nonbinary"];
  List<Map<String, dynamic>> genderSigns = [
    {
      "icon": Icons.male,
      "label": "Male",
      "gender": "Male",
    },
    {
      "icon": Icons.female,
      "label": "Female",
      "gender": "Female",
    },
    {
      "icon": Icons.transgender_rounded,
      "label": "Non binary",
      "gender": "Non binary",
    }


  ];

  Image? selectedAvatar;
  int selectedAvatarIndex = 1;
  File? pickedImage;
  List<String> avatarPaths = [

       "assets/icons/avatar1.png",
       "assets/icons/avatar2.png",
       "assets/icons/avatar3.png",
       "assets/icons/avatar4.png",
       "assets/icons/avatar5.png",
       "assets/icons/avatar6.png",
       "assets/icons/avatar7.png",
       "assets/icons/avatar8.png",
       "assets/icons/avatar9.png",
       "assets/icons/avatar10.png",
       "assets/icons/avatar11.png",
       "assets/icons/avatar12.png",
       "assets/icons/avatar13.png",
       "assets/icons/avatar2.png",
       "assets/icons/avatar1.png",

  ];
  
  final ImagePicker _picker = ImagePicker();
  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
        context: context, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))
        ),
        builder: (context) {
          return SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Icon(Icons.camera_alt_outlined),
                    title: Text("Camera"),
                    onTap: () async {
                      Navigator.pop(context);
                      final picked = await  _picker.pickImage(source: ImageSource.camera);
                      if (picked != null) {
                        setState(() {
                          pickedImage = File(picked.path);
                          selectedAvatarIndex = 0;
                        });
                      }
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text("Gallery"),
                    onTap: () async {
                      Navigator.pop(context);
                      final picked = await _picker.pickImage(source: ImageSource.gallery);
                      if (picked != null) {
                        setState(() {
                          pickedImage = File(picked.path);
                          selectedAvatarIndex = 0;
                        });
                      }
                    },
                  )
                ],
              )
          );
        }
    );
  }

  List<String> interests = ["Creativity", "Sports", "Going Out", "Film and TV", "Own Interest"];
  final Map<String, List<String>> interestCategories = {
    'Creativity': [
      'Art','Design','Makeup','Photography','Writing','Singing','Dancing','Crafts'
    ],
    'Sports': [
      'Yoga', 'Running', 'Gym', 'Football', 'Cricket', 'Tennis'
    ],
    'Going Out': [
      'Pubs','Festivals','Makeup','Photography','Writing','Singing','Dancing'
    ],
    'Film & Tv': [
      'Art', 'Design', 'Comedy', 'Photography', 'Writing', 'Singing'
    ],
    'Own Interest': [
      'Reading', 'Racing'
    ],
  };
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFFFF4D83), Color(0xFFD57DF1)],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: 55, bottom: 40),
                          height: 43.22999954223633,
                          width: 43.22999954223633,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Icon(Icons.arrow_back,
                            size: 18,)
                      ),

                    )
                ),
                EasyStepper(
                  activeStep: _currentStep,
                  stepShape: StepShape.circle,
                  stepBorderRadius: 15,
                  borderThickness: 5,
                  activeStepBorderColor: Color(0xFFFFE1FF),
                  activeStepTextColor: Colors.white,
                  finishedStepBorderColor: Colors.white,
                  finishedStepTextColor: Colors.white,
                  finishedStepBackgroundColor: Colors.transparent,
                  activeStepBackgroundColor: Colors.white,
                  unreachedStepBorderColor: Colors.white,
                  unreachedStepBackgroundColor: Colors.transparent,
                  unreachedStepTextColor: Colors.white,
                  unreachedStepBorderType: BorderType.normal,
                  activeStepBorderType: BorderType.normal,
                  finishedStepBorderType: BorderType.normal,
                  showLoadingAnimation: false,
                  onStepReached: _onStepTapped,
                  lineStyle: LineStyle(
                    lineLength: 38,
                    defaultLineColor: Color(0xFFEAEAEA),
                    lineThickness: 2,
                    lineSpace: 1,
                    lineType: LineType.dashed,
                  ),

                  steps: [
                    EasyStep(
                        title: 'Name',
                        customStep: Text(
                          "1",
                          style: TextStyle(
                            color: _currentStep == 0
                                ? Color(0xFFD67AEA)
                                : (_currentStep > 0 ? Colors.white : Colors
                                .white),
                            fontFamily: 'Poppins-Light',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,

                          ),
                        )

                    ),
                    EasyStep(
                      title: 'Gender',
                      customStep: Text(
                        "2",
                        style: TextStyle(
                          color: _currentStep == 1
                              ? Color(0xFFD67AEA)
                              : (_currentStep > 1 ? Colors.white : Colors
                              .white),
                          fontFamily: 'Poppins-Light',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    EasyStep(
                        title: 'Avatar',
                        customStep: Text(

                          "3",
                          style: TextStyle(
                            color: _currentStep == 2
                                ? Color(0xFFD67AEA)
                                : (_currentStep > 2 ? Colors.white : Colors
                                .white),
                            fontFamily: 'Poppins-Light',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        )

                    ),
                    EasyStep(
                        title: 'Interests',
                        customStep: Text(
                          "4",
                          style: TextStyle(
                            color: _currentStep == 3
                                ? Color(0xFFD67AEA)
                                : (_currentStep > 3 ? Colors.white : Colors
                                .white),
                            fontFamily: 'Poppins-Light',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,

                          ),
                        )

                    ),
                  ],),
                Expanded(
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(60)
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (_currentStep == 0)
                                ...[Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 40, left: 20),
                                      child: Text("Your Screen Name",
                                        style: TextStyle(
                                            fontFamily: "Poppins-Light",
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF403C3E)
                                        ),),
                                    ),
                                    Padding(padding: EdgeInsets.only(
                                        left: 20, top: 10),
                                      child: Text("Enter your Name.",
                                        style:
                                        TextStyle(
                                          color: Color(0xFFA8A8A8),
                                          fontFamily: "Poppins-Light",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,

                                        ),),
                                    ),
                                    Padding(padding: EdgeInsets.only(
                                        left: 20, right: 20, top: 30
                                    ),
                                      child:
                                      TextFormField(
                                        keyboardType: TextInputType.name,

                                        decoration: InputDecoration(

                                            border: OutlineInputBorder(

                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFFDEDEDE),
                                                    width: 1),
                                                borderRadius: BorderRadius
                                                    .circular(20)
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFFDEDEDE),
                                                    width: 1),
                                                borderRadius: BorderRadius
                                                    .circular(20)
                                            ),

                                            labelText: "  Screen Name/nickname",
                                            hintText: "Enter your screen name",
                                            hintStyle: TextStyle(
                                              color: Color(0xFFE3E3E3),
                                              fontSize: 18,
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
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceEvenly,
                                                mainAxisSize: MainAxisSize.min,

                                                children: [
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 14),
                                                      child: Image.asset(
                                                        'assets/icons/person.png',
                                                        height: 26,
                                                        width: 26,
                                                        matchTextDirection: true,)),
                                                  SizedBox(
                                                    height: 55,
                                                    child: VerticalDivider(
                                                      color: Color(0xFFDEDEDE),
                                                      thickness: 1,
                                                      width: 30,
                                                      endIndent: 8,
                                                      indent: 8,
                                                    ),
                                                  )


                                                ]
                                            )

                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 20, top: 30),
                                      child: Text("Date of Birth",
                                        style: TextStyle(
                                            color: Color(0xFF403C3E),
                                            fontFamily: "Poppins-Light",
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold
                                        ),),

                                    ),
                                    Padding(padding: EdgeInsets.only(
                                        left: 20, top: 10),
                                      child: Text(
                                        "You must be 18 or older to use Asocial",
                                        style:
                                        TextStyle(
                                          color: Color(0xFFA8A8A8),
                                          fontFamily: "Poppins-Light",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,

                                        ),),
                                    ),
                                    Padding(padding: EdgeInsets.only(
                                        left: 20, top: 30, right: 20),
                                      child:
                                      TextFormField(
                                        controller: _date,
                                        readOnly: true,
                                        onTap: () => _selectDate(),
                                        keyboardType: TextInputType.phone,

                                        decoration: InputDecoration(

                                            border: OutlineInputBorder(

                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFFDEDEDE),
                                                    width: 1),
                                                borderRadius: BorderRadius
                                                    .circular(20)
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFFDEDEDE),
                                                    width: 1),
                                                borderRadius: BorderRadius
                                                    .circular(20)
                                            ),


                                            hintText: "  DD/MM/YYYY",
                                            hintStyle: TextStyle(
                                              color: Color(0xFFE3E3E3),
                                              fontSize: 18,
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
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceEvenly,
                                                mainAxisSize: MainAxisSize.min,

                                                children: [
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 14),
                                                      child: Image.asset(
                                                        'assets/icons/calender.png',
                                                        height: 26,
                                                        width: 26,
                                                        matchTextDirection: true,)),
                                                  SizedBox(
                                                    height: 55,
                                                    child: VerticalDivider(
                                                      color: Color(0xFFDEDEDE),
                                                      thickness: 1,
                                                      width: 30,
                                                      endIndent: 8,
                                                      indent: 8,
                                                    ),
                                                  )


                                                ]
                                            )

                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 85,
                                    ),
                                    Container(
                                        height: 60,
                                        width: double.infinity,
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20),
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              Color(0xFFFF4D83),
                                              Color(0xFFD57DF1)
                                            ]),
                                            borderRadius: BorderRadius.circular(
                                                20)
                                        ),
                                        child: ElevatedButton(onPressed: () {
                                          _nextStep();
                                        },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors
                                                  .transparent,
                                              shadowColor: Colors.transparent,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius
                                                    .circular(20),
                                              )
                                          ),
                                          child: Text("Submit",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Poppins-Light'),),
                                        )),


                                  ],
                                )
                                ] else
                                if (_currentStep == 1)
                                  ...[
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 40, left: 20),
                                          child: Text("Gender",
                                            style: TextStyle(
                                                fontFamily: "Poppins-Light",
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF403C3E)
                                            ),),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 20, top: 10),
                                          child: Text(
                                            "Only One Chance to choose.",
                                            style: TextStyle(
                                              color: Color(0xFFA8A8A8),
                                              fontFamily: "Poppins-Light",
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            ),),
                                        ),
                                        GridView.builder(
                                          shrinkWrap: true,
                                          itemCount: 3,
                                          itemBuilder: (context, index) {
                                            return buildGenderOption(
                                              icon: genderSigns[index]["icon"],
                                              label: genderSigns[index]["label"],
                                              gender: genderSigns[index]["gender"],
                                              color: genderSigns[index]["color"],


                                            );
                                          },
                                          physics: NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 0,
                                              mainAxisExtent: 170,
                                              mainAxisSpacing: 2),
                                        ),
                                        Container(
                                            height: 60,
                                            width: double.infinity,
                                            margin: EdgeInsets.only(
                                                left: 20, right: 20),
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFFF4D83),
                                                      Color(0xFFD57DF1)
                                                    ]),
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    20)
                                            ),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                _nextStep();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors
                                                      .transparent,
                                                  shadowColor: Colors
                                                      .transparent,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(20),
                                                  )
                                              ),
                                              child: Text("Submit",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Poppins-Light'),),
                                            )),


                                      ],
                                    )

                                  ]
                                else
                                  if (_currentStep == 2)
                                    ...[
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 20, top: 40),
                                            child: Text("Avatar",
                                              style: TextStyle(
                                                  fontFamily: "Poppins-Light",
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF403C3E)

                                              ),),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 20, top: 10),
                                            child: Text(
                                              "Select the avatar you like",
                                              style: TextStyle(
                                                color: Color(0xFFA8A8A8),
                                                fontFamily: "Poppins-Light",
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                              ),),
                                          ),
                                          SingleChildScrollView(
                                            padding: EdgeInsets.only(left: 20, right: 20),
                                            child: Column(
                                              children: [
                                                GridView.builder(
                                                    gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 3,
                                                        crossAxisSpacing: 10,
                                                        mainAxisSpacing: 10,
                                                        mainAxisExtent: 140,
                                                    ),
                                                    shrinkWrap: true,
                                                    physics: NeverScrollableScrollPhysics(),
                                                    itemCount: avatarPaths.length ,
                                                    itemBuilder: (context, index) {
                                                      if (index ==0) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              selectedAvatarIndex = 0;

                                                            });
                                                            _showImageSourceActionSheet(context);

                                                          },
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Color(0xFFFDF8FD),
                                                              border: Border.all(
                                                                color: selectedAvatarIndex == 0 ? Color(0xFFDB74DC) : Colors.transparent,
                                                                width: 1,
                                                              ),
                                                              borderRadius: BorderRadius.circular(30),
                                                            ),
                                                            child: Center(
                                                              child: pickedImage != null
                                                                  ? ClipRRect(
                                                                borderRadius: BorderRadius.circular(30),
                                                                child: Image.file(
                                                                  pickedImage!,
                                                                  fit: BoxFit.cover,
                                                                  width: double.infinity,
                                                                  height: double.infinity,
                                                                ),
                                                              )
                                                              : Image.asset('assets/icons/camera.png'),

                                                            ),
                                                          ),
                                                        );

                                                      } else{
                                                        final avatar = avatarPaths[index - 1];
                                                      return GestureDetector(
                                                        onTap: () {
                                                            setState(() {
                                                              selectedAvatarIndex = index ;
                                                              pickedImage = null;
                                                            });
                                                        },
                                                        child:  Container(

                                                          padding: EdgeInsets.only(left: 18,right: 18,top: 26),
                                                          decoration: BoxDecoration(
                                                            color: selectedAvatarIndex == index ? Color(0xFFFDF8FD): Color(0xFFF8F8F8),
                                                            border: Border.all(
                                                              color: selectedAvatarIndex == index
                                                                  ? Color(0xFFDB74DC)// Highlight selected avatar
                                                                  : Colors.transparent,
                                                              width: 1,
                                                            ),
                                                            borderRadius: BorderRadius.circular(30),
                                                          ),
                                                          child: Image.asset(avatarPaths[index]),
                                                        ),



                                                      );
                                                      }
                                                    }
                                                    ),
                                                SizedBox(height: 20),
                                                Container(
                                                    height: 60,
                                                    width: double.infinity,
                                                    margin: EdgeInsets.only(
                                                        left: 20, right: 20),
                                                    decoration: BoxDecoration(
                                                        gradient: LinearGradient(colors: [
                                                          Color(0xFFFF4D83),
                                                          Color(0xFFD57DF1)
                                                        ]),
                                                        borderRadius: BorderRadius.circular(
                                                            20)
                                                    ),
                                                    child: ElevatedButton(onPressed: () {
                                                      _nextStep();
                                                    },
                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor: Colors
                                                              .transparent,
                                                          shadowColor: Colors.transparent,
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(20),
                                                          )
                                                      ),
                                                      child: Text("Submit",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily: 'Poppins-Light'),),
                                                    )),
                                                SizedBox(height: 30,)
                                              ],
                                            ),




                                          )
                                        ],
                                      )
                                    ]
                              else
                                 if   (_currentStep == 3)
                              ...[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 20, top: 40),
                                      child: Text("Your Interests",
                                        style: TextStyle(
                                            fontFamily: "Poppins-Light",
                                            fontSize: 30,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF403C3E)

                                        ),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 20, top: 10),
                                      child: Text(
                                        "Pick up to 5 things you Love.",
                                        style: TextStyle(
                                          color: Color(0xFFA8A8A8),
                                          fontFamily: "Poppins-Light",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        ),),
                                    ),
                                    SingleChildScrollView(
                                      padding: EdgeInsets.only(left: 20, right: 20),
                                      child: Column(
                                        children: [
                                              
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ]

                            ],
                          ),

                        )
                    )
                )
              ],
            )
        )
    );
  }

  Widget buildGenderOption({
    required icon,
    required label,
    required gender,
    required color,
  }) {
    bool isSelected = gender == selectedGender;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Column(
        children: [
          Container(
            width: 170,
            height: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: selectedGender == gender ? Color(0xFFDB74DC) : Color(
                      0xFFF8F8F8),
                  width: 1,
                ),
                color: Colors.grey.shade50
            ),
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: isSelected
                      ? [Color(0xFFFC4F88), Color(0xFFD67AEA)]
                      : [Color(0xFFA8A8A8), Color(0xFFA8A8A8)],
                ).createShader(bounds);
              },
              child: Icon(icon,
                  size: 70,
                  color: Colors.white
              ),
            ),

          ),
          SizedBox(height: 8,),
          Text(label,
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'Poppins-Light',
              fontWeight: FontWeight.w400,
              color: isSelected ? Color(0xFFDB74DC) : Color(0xFFA8A8A8),
            ),)
        ],
      ),
    );
  }


}