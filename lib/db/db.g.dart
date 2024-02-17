// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemeModesAdapter extends TypeAdapter<ThemeModes> {
  @override
  final int typeId = 1;

  @override
  ThemeModes read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ThemeModes.system;
      case 1:
        return ThemeModes.light;
      case 2:
        return ThemeModes.dark;
      default:
        return ThemeModes.system;
    }
  }

  @override
  void write(BinaryWriter writer, ThemeModes obj) {
    switch (obj) {
      case ThemeModes.system:
        writer.writeByte(0);
        break;
      case ThemeModes.light:
        writer.writeByte(1);
        break;
      case ThemeModes.dark:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeModesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
