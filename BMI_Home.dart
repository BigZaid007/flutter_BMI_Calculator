import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:the_bmi_calculator/bmiModel.dart';
import 'ResultScreen.dart';

class BMI_Home extends StatefulWidget {
  @override
  _BMI_HomeState createState() => _BMI_HomeState();
}

class _BMI_HomeState extends State<BMI_Home> {

  bmiModel _bmiModel;

  double bmi;
  Color maleActiveColor=Colors.grey;
  Color femaleActiveColor=Colors.grey;
double userHeight=80.0;
double userWeight=50;
int gender ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'BMI ',
                      style: TextStyle(fontSize: 30, color: Colors.yellow),
                    ),
                    Text(
                      'Calculator',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 45),
                alignment: Alignment.center,
                child: Text(
                    'Body Mass Index (BMI) is a person’s weight in kilograms divided by the square of height in meters.',
                    style: TextStyle(color: Colors.yellow)),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: (){
                          setState(() {
                            maleActiveColor=Colors.yellow;
                            femaleActiveColor=Colors.grey;
                            gender=1;

                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: maleActiveColor
                          ),
                          child: Image.asset(
                            'images/male.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(

                        onTap:(){
                        setState(() {
                          femaleActiveColor=Colors.yellow;
                          maleActiveColor=Colors.grey;
                          gender=2;
                        });
                      } ,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: femaleActiveColor),
                          child: Image.asset(
                            'images/female.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(10),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: Column(
                  children: [
                    Text(
                      'Height (cm)',
                      style: TextStyle(fontSize: 40, color: Colors.yellow),
                    ),
                    Container(padding: EdgeInsets.only(left: 20,right: 20),
                      child: Slider(
                      min: 80.0,
                       max: 250.0,
                        value: userHeight,
                        onChanged: (height)
                        {
                          setState(() {
                            userHeight=height;
                          });

                        },
                        divisions: 150,
                        label: '$userHeight cm',
                        activeColor: Colors.yellow,
                      ),
                      
                    ),
                    Text('${userHeight.round()} cm',style: TextStyle(fontSize: 20,color: Colors.yellow,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Text(
                'Weight',
                style: TextStyle(fontSize: 40, color: Colors.yellow),
              ),
              Container(
                padding: EdgeInsets.only(left: 20,right: 20),

                child: Slider(
                  min: 40.0,
                  max: 200,
                  value: userWeight,
                  onChanged: (weight){
                    setState(() {
                      userWeight=weight;
                    });
                  },
                  divisions: 100,
                  activeColor: Colors.yellow,
                  label: '$userWeight kg',
                ),


              ),
              Text('${userWeight.round()} kg',style: TextStyle(
              fontSize: 20,fontWeight: FontWeight.bold,color: Colors.yellow
              ),
              ),
              SizedBox(height: 30,),
              FlatButton(
                padding: EdgeInsets.all(0),



                onPressed: (){
                  setState(() {

                    bmi=userWeight/((userHeight/100)*(userHeight/100));


                    if(gender==1)
                      {

                        if(bmi <=18.0)
                        {
                          _bmiModel=bmiModel(bmI: bmi,isNormal: false,status: 'You Are Underweight');
                        }
                          //underWeight
                          else if (bmi > 18.0 && bmi <=24.9)
                          {
                            _bmiModel=bmiModel(bmI: bmi,isNormal: true,status: 'WOW,You Are Fit');
                          }
                          //normal

                        else if (bmi >=25.0 && bmi <=29.9)
                        {
                          _bmiModel=bmiModel(bmI: bmi,isNormal: false,status: 'You Are Overweight,You Should Go On Diet');
                        }
                        //overweight

                        else if (bmi >= 30.0)
                        {
                          _bmiModel=bmiModel(bmI: bmi,isNormal: false,status: 'You Are Obese,You Must Go On Diet');
                        }
                        //obese

                      } //if it is male

                    else {

                               if(bmi <=18.5){
                                 _bmiModel=bmiModel(bmI: bmi,isNormal: false,status: 'You Are Underweight');
                               }
                            //underWeight
                            else if (bmi > 18.5 && bmi <=24.9){
                                 _bmiModel=bmiModel(bmI: bmi,isNormal: true,status: 'WOW,You Are Fit');
                               }
                            //normal

                            else if (bmi >=25.0 && bmi <=29.9){
                                 _bmiModel=bmiModel(bmI: bmi,isNormal: false,status: 'You Are Overweight,You Should Go On Diet');
                               }
                            //overweight

                            else if (bmi >= 30.0) {
                                 _bmiModel=bmiModel(bmI: bmi,isNormal: false,status: 'You Are Obese,You Must Go On Diet');

                               }
                            //obese

                        } //if it is female





                  });
                  Navigator.push(context, MaterialPageRoute
                    ( builder: (context) => ResultScreen(bmiModel: _bmiModel,gender: gender,)
                  ));
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 75,
                  decoration: BoxDecoration(
                    color: Colors.yellow,borderRadius: BorderRadius.circular(20)

                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.workspaces_outline,size: 40,color: Colors.black,),
                      Text(' Calculate',style: TextStyle(
                        fontSize: 40,color: Colors.black,fontWeight: FontWeight.w700
                      ),)
                    ],
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
