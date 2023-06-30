import 'package:animated_icon/animated_icon.dart';
import 'package:bmi_cal/bmi/controller/bmi__controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  BmiController controller = Get.put(BmiController());
  AnimationController? aniController;
  Animation? leftTween;
  Animation? rightTween;
  Animation? topTween;
  Animation? botomTween;

  @override
  void initState() {
    aniController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    leftTween = Tween<Offset>(begin: Offset(-200, 0), end: Offset(0, 0))
        .animate(aniController!);
    rightTween = Tween<Offset>(begin: Offset(200, 0), end: Offset(0, 0))
        .animate(aniController!);
    topTween = Tween<Offset>(begin: Offset(0, 500), end: Offset(0, 0))
        .animate(aniController!);
    botomTween = Tween<Offset>(begin: Offset(0, -500), end: Offset(0, 0))
        .animate(aniController!);
    aniController!.forward();
    aniController!.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff0F1537),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff0F1537),
        centerTitle: true,
        title: Text(
          "BMI CALCULATOR",
          style: GoogleFonts.poppins(
              color: Colors.white, letterSpacing: 1, fontSize: 20),
        ),
        leading: Center(
          child: Hero(
            tag: "bmi",
            child: Image.asset(
              "assets/images/heartbeat.png",
              height: 30,
              width: 30,
            ),
          ),
        ),
        actions: [
          AnimateIcon(
          key: UniqueKey(),
          onTap: () {
            controller.sliderValue.value=150.0;
            controller.weightValue.value=55;
            controller.ageValue.value=22;
            controller.forMale.value=0;
            controller.forFemale.value=0;
          },
          iconType: IconType.continueAnimation,
          height: 25,
          width: 25,
          color: Colors.white,
          animateIcon: AnimateIcons.refresh,
        ),
          SizedBox(width: 15)
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.translate(
                    offset: leftTween!.value,
                    child: InkWell(
                      onTap: () {
                        controller.changemale();
                      },
                      child: Container(
                        height: 160,
                        width: 170,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade900.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Obx(
                              () => Icon(
                                Icons.male_outlined,
                                size: 80,
                                color: controller.forMale.value == 0
                                    ? Colors.white
                                    : Colors.pink,
                              ),
                            ),
                            Text(
                              "MALE",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  letterSpacing: 1,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Transform.translate(
                    offset: rightTween!.value,
                    child: InkWell(
                      onTap: () {
                        controller.changefemale();
                      },
                      child: Container(
                        height: 160,
                        width: 170,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade900.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => Icon(
                                Icons.female_outlined,
                                size: 80,
                                color: controller.forFemale.value == 0
                                    ? Colors.white
                                    : Colors.pink,
                              ),
                            ),
                            Text(
                              "FEMALE",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  letterSpacing: 1,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Transform.translate(
                offset: topTween!.value,
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade900.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "HEIGHT",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            letterSpacing: 1,
                            fontSize: 20),
                      ),
                      Obx(
                        () => Text(
                          "${controller.sliderValue.toInt()}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1,
                              fontSize: 50),
                        ),
                      ),
                      Obx(
                        () => Slider(
                          min: 20.0,
                          max: 220.0,
                          activeColor: Colors.pink,
                          value: controller.sliderValue.value,
                          onChanged: (value) {
                            controller.chnage(value);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.translate(
                    offset: leftTween!.value,
                    child: Container(
                      height: 160,
                      width: 170,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade900.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "WEIGHT",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                letterSpacing: 1,
                                fontSize: 20),
                          ),
                          SizedBox(height: 10),
                          Obx(
                            () => Text(
                              "${controller.weightValue}",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  controller.weightValueadd();
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.black54,
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  controller.weightValueminus();
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.black54,
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Icon(
                                      Icons.remove,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Transform.translate(
                    offset: rightTween!.value,
                    child: Container(
                      height: 160,
                      width: 170,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade900.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "AGE",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                letterSpacing: 1,
                                fontSize: 20),
                          ),
                          SizedBox(height: 10),
                          Obx(
                            () => Text(
                              "${controller.ageValue}",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  controller.ageValueadd();
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.black54,
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  controller.ageValueminus();
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.black54,
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Icon(
                                      Icons.remove,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Transform.translate(
                offset: botomTween!.value,
                child: InkWell(
                  onTap: () {
                    controller.calBmi();
                    showModalBottomSheet(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(25))),
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 600,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 125,
                                        width: 125,
                                        child: Center(
                                          child: Image.asset(
                                            "assets/images/heartbeat.png",
                                            height: 120,
                                            width: 120,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Center(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  "Your BMI",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.blue.shade500,
                                                      letterSpacing: 1,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 30),
                                                ),

                                                Text(
                                                  "${controller.bmi.toInt()}",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.green,
                                                      letterSpacing: 1,
                                                      fontSize: 40),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Gender",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black38,
                                      letterSpacing: 1,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 5),
                                Obx(
                                  () => controller.forMale.value==1?Text(
                                    "Male",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        letterSpacing: 1,
                                        fontSize: 20),
                                  ):controller.forFemale.value==1?Text(
                                    "FeMale",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        letterSpacing: 1,
                                        fontSize: 20),
                                  ):Text(
                                    "Please Select Gender",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        letterSpacing: 1,
                                        fontSize: 20),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Height",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black38,
                                      letterSpacing: 1,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "${controller.sliderValue.value.toInt()}",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      letterSpacing: 1,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Weight",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black38,
                                      letterSpacing: 1,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "${controller.weightValue.value}",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      letterSpacing: 1,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Age",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black38,
                                      letterSpacing: 1,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "${controller.ageValue}",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      letterSpacing: 1,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                    ),
                    child: Center(
                      child: Text(
                        "CALCULATOR YOUR BMI",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            letterSpacing: 1,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
