// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherLocationsAdapter extends TypeAdapter<Weather> {
  @override
  final int typeId = 0;

  @override
  Weather read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Weather(
      location: fields[0] as String,
      weatherCondition: fields[1] as WeatherCondition,
      temp: fields[2] as double,
      tempFeelsLike: fields[3] as double,
      tempMin: fields[4] as double,
      tempMax: fields[5] as double,
      humidity: fields[6] as int,
      pressure: fields[7] as int,
      latitude: fields[8] as double,
      longitude: fields[9] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Weather obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.location)
      ..writeByte(1)
      ..write(obj.weatherCondition)
      ..writeByte(2)
      ..write(obj.temp)
      ..writeByte(3)
      ..write(obj.tempFeelsLike)
      ..writeByte(4)
      ..write(obj.tempMin)
      ..writeByte(5)
      ..write(obj.tempMax)
      ..writeByte(6)
      ..write(obj.humidity)
      ..writeByte(7)
      ..write(obj.pressure)
      ..writeByte(8)
      ..write(obj.latitude)
      ..writeByte(9)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherLocationsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
