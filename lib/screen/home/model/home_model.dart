class HomeModel {
  String? base, name;
  int? visibility, dt, timezone, id, cod;
  CoordModel? coordModel;
  List<WeatherModel>? weather = [];
  MainModel? mainModel;
  WindModel? windModel;
  CloudsModel? cloudsModel;
  SysModel? sysModel;

  HomeModel(
      {this.base,
      this.name,
      this.visibility,
      this.dt,
      this.timezone,
      this.id,
      this.cod,
      this.coordModel,
      this.weather,
      this.mainModel,
      this.windModel,
      this.cloudsModel,
      this.sysModel});

  factory HomeModel.mapToModel(Map m1) {
    List l1 = m1['weather'];
    return HomeModel(
        id: m1['id'],
        name: m1['name'],
        base: m1['base'],
        cod: m1['cod'],
        dt: m1['dt'],
        timezone: m1['timezone'],
        visibility: m1['visibility'],
        cloudsModel: CloudsModel.mapToModel(m1['clouds']),
        coordModel: CoordModel.mapToModel(m1['coord']),
        mainModel: MainModel.mapToModel(m1['main']),
        sysModel: SysModel.mapToModel(m1['sys']),
        windModel: WindModel.mapToModel(m1['wind']),
        weather: l1
            .map(
              (e) => WeatherModel.mapToModel(e),
            )
            .toList());
  }
}

class CoordModel {
  dynamic lon, lat;

  CoordModel({this.lon, this.lat});

  factory CoordModel.mapToModel(Map m1) {
    return CoordModel(lat: m1['lat'], lon: m1['lon']);
  }
}

class WeatherModel {
  int? id;
  String? main, description, icon;

  WeatherModel({this.id, this.main, this.description, this.icon});

  factory WeatherModel.mapToModel(Map m1) {
    return WeatherModel(
        description: m1['description'],
        icon: m1['icon'],
        id: m1['id'],
        main: m1['main']);
  }
}

class MainModel {
  double? temp, feels_like, temp_min, temp_max;
  int? pressure, humidity, sea_level, grnd_level;

  MainModel(
      {this.temp,
      this.feels_like,
      this.temp_min,
      this.temp_max,
      this.pressure,
      this.humidity,
      this.sea_level,
      this.grnd_level});

  factory MainModel.mapToModel(Map m1) {
    return MainModel(
        feels_like: m1['feels_like'],
        grnd_level: m1['grnd_level'],
        humidity: m1['humidity'],
        pressure: m1['pressure'],
        sea_level: m1['sea_level'],
        temp: m1['temp'],
        temp_max: m1['temp_max'],
        temp_min: m1['temp_min']);
  }
}

class WindModel {
  double? speed, gust;
  int? deg;

  WindModel({this.speed, this.gust, this.deg});

  factory WindModel.mapToModel(Map m1) {
    return WindModel(deg: m1['deg'], gust: m1['gust'], speed: m1['speed']);
  }
}

class CloudsModel {
  int? all;

  CloudsModel({this.all});

  factory CloudsModel.mapToModel(Map m1) {
    return CloudsModel(all: m1['all']);
  }
}

class SysModel {
  String? country;
  int? sunrise, sunset;

  SysModel({this.country, this.sunrise, this.sunset});

  factory SysModel.mapToModel(Map m1) {
    return SysModel(
      country: m1['country'],
      sunrise: m1['sunrise'],
      sunset: m1['sunset'],
    );
  }
}
