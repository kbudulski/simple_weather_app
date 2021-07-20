import 'package:hive/hive.dart';

part 'enums.g.dart';

@HiveType(typeId: 1, adapterName: 'EnumsAdapter')
enum WeatherCondition {
  @HiveField(0)
  thunderstorm,
  @HiveField(1)
  drizzle,
  @HiveField(2)
  rain,
  @HiveField(3)
  snow,
  @HiveField(4)
  clear,
  @HiveField(5)
  clouds,
  @HiveField(6)
  other,
}

extension ParseToString on WeatherCondition {
  String toShortString() {
    return toString().split('.').last;
  }
}
