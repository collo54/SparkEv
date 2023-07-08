// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charging_station.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class ChargingStationModel extends _ChargingStationModel
    with RealmEntity, RealmObjectBase, RealmObject {
  ChargingStationModel(
    ObjectId id,
    int lat,
    int lang,
    int type,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'lat', lat);
    RealmObjectBase.set(this, 'lang', lang);
    RealmObjectBase.set(this, 'type', type);
  }

  ChargingStationModel._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  int get lat => RealmObjectBase.get<int>(this, 'lat') as int;
  @override
  set lat(int value) => RealmObjectBase.set(this, 'lat', value);

  @override
  int get lang => RealmObjectBase.get<int>(this, 'lang') as int;
  @override
  set lang(int value) => RealmObjectBase.set(this, 'lang', value);

  @override
  int get type => RealmObjectBase.get<int>(this, 'type') as int;
  @override
  set type(int value) => RealmObjectBase.set(this, 'type', value);

  @override
  Stream<RealmObjectChanges<ChargingStationModel>> get changes =>
      RealmObjectBase.getChanges<ChargingStationModel>(this);

  @override
  ChargingStationModel freeze() =>
      RealmObjectBase.freezeObject<ChargingStationModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ChargingStationModel._);
    return const SchemaObject(
        ObjectType.realmObject, ChargingStationModel, 'ChargingStationModel', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('lat', RealmPropertyType.int),
      SchemaProperty('lang', RealmPropertyType.int),
      SchemaProperty('type', RealmPropertyType.int),
    ]);
  }
}
