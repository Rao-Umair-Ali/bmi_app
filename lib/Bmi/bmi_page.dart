import 'package:bmi_app/Bmi/Bmi_Component/bmi_textfield.dart';
import 'package:bmi_app/Bmi/Bmi_Component/buttonBmi.dart';
import 'package:flutter/material.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightFtController = TextEditingController();
  TextEditingController heightIncController = TextEditingController();

  double bmi = 0;
  Color bgColors = Colors.white;
  String texts = "";

  void calculateBmi() {
    double weight = double.tryParse(weightController.text) ?? 0;
    double heightFeet = double.tryParse(heightFtController.text) ?? 0;
    double heightInches = double.tryParse(heightIncController.text) ?? 0;

    double totalHeightInMeters = ((heightFeet * 12) + heightInches) * 0.0254;

    setState(() {
      bmi = weight / (totalHeightInMeters * totalHeightInMeters);
      if (bmi > 25) {
        bgColors = Colors.red;
        texts = "You are overWeight ";
      } else if (bmi < 18) {
        bgColors = Colors.yellow;
        texts = "You are UnderWeight ";
      } else {
        bgColors = Colors.green;
        texts = "You are Healthy ";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Container(
        color: bgColors,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              bmiTextField("Enter your weight (kg)", 200, weightController),
              bmiTextField(
                  "Enter your height in feet", 200, heightFtController),
              bmiTextField(
                  "Enter your height in inches", 200, heightIncController),
              bmiButton(calculateBmi),
              Text("Your BMI is: ${bmi.toStringAsFixed(2)} \n $texts"),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    weightController.dispose();
    heightFtController.dispose();
    heightIncController.dispose();
    super.dispose();
  }
}
