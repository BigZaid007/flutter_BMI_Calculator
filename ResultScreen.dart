import 'package:flutter/material.dart';
import 'package:the_bmi_calculator/bmiModel.dart';

class ResultScreen extends StatelessWidget {

  final bmiModel ;
  final gender;


  ResultScreen({this.bmiModel,this.gender});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[


              if(gender != 1 )
                Container(
                  child: bmiModel.isNormal ? Image.asset('images/femaleHappy.png'):Image.asset('images/femaleSad.png')

                ),


                if (gender==1)
                  Container(
                      child: bmiModel.isNormal ? Image.asset('images/maleHappy.png'):Image.asset('images/maleSad.png')
                  )


                //gender? bmiModel.isNormal ? Image.asset('images/maleHappy.png'):Image.asset('images/maleSad.png')





                 // "bmiModel.isNormal  ?  gender?Image.asset('images/maleHappy.png'):Image.asset('images/maleSad.png')"


              ,SizedBox(
                height: 8,
              ),
              Text("Your BMI is ${bmiModel.bmI.round()}", style: TextStyle(color: Colors.yellow, fontSize: 34, fontWeight: FontWeight.w700),),
              SizedBox(height: 20,),
              Text("${bmiModel.status}", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),),

              SizedBox(height: 16,),

              bmiModel.isNormal ?
              Text("Your BMI is Normal,Keep It Up !", style: TextStyle(color: Colors.yellow, fontSize: 18, fontWeight: FontWeight.w700),)
                  :
              Text("Your BMI is not Normal,You Must Work Harder", style: TextStyle(color: Colors.yellow, fontSize: 18, fontWeight: FontWeight.w700),),
              SizedBox(height: 16,),

              Container(
                decoration: BoxDecoration(
                  color: Colors.yellow,borderRadius: BorderRadius.circular(20)
                ),
                child: FlatButton(
                  onPressed: (){

                    Navigator.pop(context);
                  },

                  child: Text(
                    'Calculate Again?',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.black),
                  ),
                ),
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 16),
              )

            ],
          ),
        )
    );
  }
}
