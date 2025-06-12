



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
