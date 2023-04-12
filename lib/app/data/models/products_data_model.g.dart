// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductsDataModelAdapter extends TypeAdapter<ProductsDataModel> {
  @override
  final int typeId = 10;

  @override
  ProductsDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductsDataModel(
      id: fields[0] as String?,
      name: fields[1] as String?,
      barcode: fields[2] as String?,
      description: fields[3] as String?,
      subCategory: fields[4] as Brand?,
      brand: fields[5] as Brand?,
      quantity: fields[6] as Quantity?,
      productPrice: fields[7] as ProductPrice?,
      image: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductsDataModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.barcode)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.subCategory)
      ..writeByte(5)
      ..write(obj.brand)
      ..writeByte(6)
      ..write(obj.quantity)
      ..writeByte(7)
      ..write(obj.productPrice)
      ..writeByte(8)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductsDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BrandAdapter extends TypeAdapter<Brand> {
  @override
  final int typeId = 11;

  @override
  Brand read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Brand(
      id: fields[0] as String?,
      name: fields[1] as String?,
      description: fields[2] as String?,
      image: fields[3] as String?,
      category: fields[4] as Brand?,
    );
  }

  @override
  void write(BinaryWriter writer, Brand obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BrandAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductPriceAdapter extends TypeAdapter<ProductPrice> {
  @override
  final int typeId = 12;

  @override
  ProductPrice read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductPrice(
      id: fields[0] as String?,
      price: fields[1] as String?,
      unitPrice: fields[2] as String?,
      mrp: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductPrice obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.unitPrice)
      ..writeByte(3)
      ..write(obj.mrp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductPriceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class QuantityAdapter extends TypeAdapter<Quantity> {
  @override
  final int typeId = 13;

  @override
  Quantity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Quantity(
      id: fields[0] as String?,
      quantity: fields[1] as String?,
      unit: fields[2] as String?,
      unitValue: fields[3] as String?,
      pastQuantity: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Quantity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.unit)
      ..writeByte(3)
      ..write(obj.unitValue)
      ..writeByte(4)
      ..write(obj.pastQuantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuantityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
