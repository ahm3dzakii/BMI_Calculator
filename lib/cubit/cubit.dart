import 'package:bmi/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit getObject(context) => BlocProvider.of(context);

  bool isMale = true;
  bool isFemale = true;
  double result = 0.0;
  double calculate;
  bool isVisible = false;
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  void selectMaleGender() {
    isMale = true;
    isFemale = false;
    emit(SelectMaleGender());
  }

  void selectFemaleGender() {
    isMale = false;
    isFemale = true;
    emit(SelectFemaleGender());
  }

  void calculateResult() {
    if (ageController.text == '' || (ageController.text).length < 2 ) {
      isVisible = !isVisible;
    }
    else {
      double heightResult = double.parse(heightController.text);
      double weightResult = double.parse(weightController.text);
      result = double.parse(
          ((weightResult / heightResult / heightResult) * 10000)
              .toStringAsExponential(2));
      isVisible = false;
    }
    ageController.clear();
    heightController.clear();
    weightController.clear();
    emit(CalculateResult());
  }

}
