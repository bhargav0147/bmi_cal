import 'package:get/get.dart';

class BmiController extends GetxController
{
  RxDouble sliderValue=150.0.obs;

  void chnage(double a)
  {
    sliderValue.value=a;
  }

  RxInt weightValue = 55.obs;
  void weightValueadd()
  {
    weightValue.value++;
  }
  void weightValueminus()
  {
    if(weightValue.value>=1)
    {
      weightValue.value--;
    }
  }

  RxInt ageValue = 22.obs;
  void ageValueadd()
  {
    ageValue.value++;
  }
  void ageValueminus()
  {
    if(ageValue.value>=1)
    {
      ageValue.value--;
    }
  }

  // 0=Male 1=Female
  RxInt forMale=0.obs;
  RxInt forFemale=0.obs;

  void changemale()
  {
    forMale.value=1;
    forFemale.value=0;
  }
  void changefemale()
  {

    forFemale.value=1;
    forMale.value=0;
  }

  double hiMeter=0.0;
  double bmi=0.0;

  void calBmi()
  {
    hiMeter=sliderValue.value/100;
    bmi=weightValue.value/(hiMeter*hiMeter);
  }
}