/// city : "New York"
/// temperature : 20
/// condition : "Clear"
/// humidity : 60
/// windSpeed : 5.5

class Apihit3 {
  Apihit3({
      String? city, 
      num? temperature, 
      String? condition, 
      num? humidity, 
      num? windSpeed,}){
    _city = city;
    _temperature = temperature;
    _condition = condition;
    _humidity = humidity;
    _windSpeed = windSpeed;
}

  Apihit3.fromJson(dynamic json) {
    _city = json['city'];
    _temperature = json['temperature'];
    _condition = json['condition'];
    _humidity = json['humidity'];
    _windSpeed = json['windSpeed'];
  }
  String? _city;
  num? _temperature;
  String? _condition;
  num? _humidity;
  num? _windSpeed;
Apihit3 copyWith({  String? city,
  num? temperature,
  String? condition,
  num? humidity,
  num? windSpeed,
}) => Apihit3(  city: city ?? _city,
  temperature: temperature ?? _temperature,
  condition: condition ?? _condition,
  humidity: humidity ?? _humidity,
  windSpeed: windSpeed ?? _windSpeed,
);
  String? get city => _city;
  num? get temperature => _temperature;
  String? get condition => _condition;
  num? get humidity => _humidity;
  num? get windSpeed => _windSpeed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city'] = _city;
    map['temperature'] = _temperature;
    map['condition'] = _condition;
    map['humidity'] = _humidity;
    map['windSpeed'] = _windSpeed;
    return map;
  }

}