import 'package:bmi/cubit/cubit.dart';
import 'package:bmi/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bmi/shared/components/components.dart';
import 'package:bmi/shared/styles/colors.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer <AppCubit, AppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          return Scaffold(

            //Scrolling whole screen
            body: SingleChildScrollView(
              child: Container(
                color: TextColors.textColorDeepOrange,
                width: double.infinity,
                child: Column(
                  children: [

                    //Start of Header
                    Stack(
                      children: [
                        Image.asset('assets/images/home_bg_top.png'),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
                          child: Image.asset('assets/images/small_logo.png', width: 100,),
                        )
                      ],
                    ),
                    //End of Header

                    //Start of Gender
                    SingleChildScrollView(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: AppCubit.getObject(context).isMale ? TextColors.textColorBlack : TextColors.textColorWhite,
                                ),
                                width: 180,
                                height: 50,
                                child: TextButton(
                                  onPressed: () {
                                    AppCubit.getObject(context).selectMaleGender();
                                  },
                                  child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 25.0, left: 15.0),
                                          child: Image.asset('assets/images/male_icon.png',width: 20,),
                                        ),
                                        Text('Male', style: TextStyle(fontFamily: 'MISTRAL', fontSize: 25,
                                          color: AppCubit.getObject(context).isMale ? TextColors.textColorWhite : TextColors.textColorBlack,
                                        ),
                                        ),
                                      ]
                                  ),
                                  style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(TextColors.buttonOverLay),
                                    padding: MaterialStateProperty.all(const EdgeInsets.all(10.0)),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),),),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: !AppCubit.getObject(context).isMale ? TextColors.textColorBlack : TextColors.textColorWhite,
                                ),
                                width: 180,
                                height: 50,
                                child: TextButton(
                                  onPressed: () {
                                    AppCubit.getObject(context).selectFemaleGender();
                                  },
                                  child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 25.0, left: 15.0),
                                          child: Image.asset('assets/images/female_icon.png',width: 20,),
                                        ),
                                        Text('Female', style: TextStyle(fontFamily: 'MISTRAL', fontSize: 25,
                                          color: !AppCubit.getObject(context).isMale ? TextColors.textColorWhite : TextColors.textColorBlack,
                                        ),),
                                      ]
                                  ),
                                  style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(TextColors.buttonOverLay),
                                    padding: MaterialStateProperty.all(const EdgeInsets.all(10.0)),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),),),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //End of Gender

                    //Start of Age
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Your Age',style: TextStyle(fontFamily: 'MISTRAL', fontSize: 25, color: TextColors.textColorWhite),),
                            SizedBox(height: 10.0,),
                            //TextBox
                            Container(
                              decoration: BoxDecoration(
                                  color: TextColors.textColorWhite,
                                  borderRadius: BorderRadius.circular(10.0),

                              ),
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: textFormField(
                                        controller: AppCubit.getObject(context).ageController,
                                        textType: TextInputType.number,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 5.0,),
                            Visibility(
                                visible: AppCubit.getObject(context).isVisible,
                                child: Text('You must enter your age',
                                  style: TextStyle(fontFamily: 'ArialBlk', fontSize: 10, color: TextColors.textColorWhite, ), ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 35.0,),
                    //End of Age

                    //Start of Height
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text('Your Height', style: TextStyle(fontFamily: 'MISTRAL', fontSize: 25, color: TextColors.textColorWhite),),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 50.0, top: 20.0),
                                  child: Container(
                                    width: 180,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: TextColors.textColorWhite,
                                        borderRadius: BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: TextColors.textColorWhite,
                                          width: 0.0,
                                        )
                                    ),

                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 0.0),
                                            child: textFormField(
                                              controller: AppCubit.getObject(context).heightController,
                                              textType: TextInputType.number,
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 50.0, top: 20.0),
                                  child: Container(
                                    width: 180,
                                    height: 50,
                                    child: heightTextButton(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //End of Height

                    //Start of Weight
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text('Your Weight', style: TextStyle(fontFamily: 'MISTRAL', fontSize: 25, color: TextColors.textColorWhite),),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 50.0, top: 20.0),
                                  child: Container(
                                    width: 180,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: TextColors.textColorWhite,
                                        borderRadius: BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: TextColors.textColorWhite,
                                          width: 0.0,
                                        )
                                    ),

                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 0.0),
                                            child: textFormField(
                                              controller: AppCubit.getObject(context).weightController,
                                              textType: TextInputType.number,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 50.0, top: 20.0),
                                  child: Container(
                                    width: 180,
                                    height: 50,
                                    child: weightTextButton(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //End of Weight

                    //Start of Calculation Button
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          width: 180,
                          height: 50,
                          child: TextButton(
                            onPressed: () {
                              AppCubit.getObject(context).calculateResult();
                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Start Calculation',
                                    style: TextStyle(fontFamily: 'MISTRAL', fontSize: 25, color: TextColors.textColorWhite),),
                                ]
                            ),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                              overlayColor: MaterialStateProperty.all(TextColors.buttonOverLay),
                              padding: MaterialStateProperty.all(const EdgeInsets.all(10.0)),
                              backgroundColor: MaterialStateProperty.all(TextColors.textColorBlack),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    //End of Calculation Button

                    //Start of Footer
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget> [
                          Stack(
                              children: [
                                Image.asset('assets/images/home_bg_bottom.png'),
                                Container(
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 80.0),
                                          child: Text('${AppCubit.getObject(context).result}', style: TextStyle(color: TextColors.textColorDeepOrange, fontSize: 35, fontFamily: 'ArialBlk', fontWeight: FontWeight.bold),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 20.0),
                                          child: Text('Your Result', style: TextStyle(color: TextColors.textColorDeepOrange, fontSize: 50, fontFamily: 'AmostelySignature'),),
                                        ),

                                      ],
                                    ),),
                              ]
                          ),
                        ],
                      ),
                    ),
                    //End of Footer

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
