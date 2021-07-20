// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enums.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EnumsAdapter extends TypeAdapter<WeatherCondition> {
  @override
  final int typeId = 1;

  @override
  WeatherCondition read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return WeatherCondition.thunderstorm;
      case 1:
        return WeatherCondition.drizzle;
      case 2:
        return WeatherCondition.rain;
      case 3:
        return WeatherCondition.snow;
      case 4:
        return WeatherCondition.clear;
      case 5:
        return WeatherCondition.clouds;
      case 6:
        return WeatherCondition.other;
      default:
        return WeatherCondition.thunderstorm;
    }
  }

  @override
  void write(BinaryWriter writer, WeatherCondition obj) {
    switch (obj) {
      case WeatherCondition.thunderstorm:
        writer.writeByte(0);
        break;
      case WeatherCondition.drizzle:
        writer.writeByte(1);
        break;
      case WeatherCondition.rain:
        writer.writeByte(2);
        break;
      case WeatherCondition.snow:
        writer.writeByte(3);
        break;
      case WeatherCondition.clear:
        writer.writeByte(4);
        break;
      case WeatherCondition.clouds:
        writer.writeByte(5);
        break;
      case WeatherCondition.other:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnumsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
