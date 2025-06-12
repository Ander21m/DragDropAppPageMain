
import 'package:flutter/material.dart';


String getImageForWeather(String weatherType){
    if(weatherType == "Clouds"){
      return "images/cloudy.png";
    }
    else if (weatherType == "Rain"){
      return "images/rain.png";
    }
    else if(weatherType == "Clear"){
      return "images/sun.png";
    }
    else{
      return "images/unidentify.png";
    }
  }
String getTypeForWeather(double tempCelsius){
  if (tempCelsius >= 30) {
    return "quite hot";
  } else if (tempCelsius >= 20 && tempCelsius < 30) {
    return "pretty normal";
  } else if (tempCelsius >= 10 && tempCelsius < 20) {
    return "a bit chilly";
  } else {
    return "cold!";
  }
  }






class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(8),
          )
          ),
    );
  }
}






class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String name;
  const MyButton({super.key, required this.onTap, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.black),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              name,
              style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),
            )
          ]),
        ));
  }
}
