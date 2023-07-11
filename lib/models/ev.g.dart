// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ev.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class EvTripModel extends _EvTripModel
    with RealmEntity, RealmObjectBase, RealmObject {
  EvTripModel(
    ObjectId id,
    String owner_id,
    String countryChargingStation,
    double latOrigin,
    double langOrigin,
    double latChargingStattion,
    double langChargingStation,
    double latDestination,
    double langDestination,
    double totalCost,
    double oneKWhPrice,
    double distanceMiles,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'owner_id', owner_id);
    RealmObjectBase.set(this, 'countryChargingStation', countryChargingStation);
    RealmObjectBase.set(this, 'latOrigin', latOrigin);
    RealmObjectBase.set(this, 'langOrigin', langOrigin);
    RealmObjectBase.set(this, 'latChargingStattion', latChargingStattion);
    RealmObjectBase.set(this, 'langChargingStation', langChargingStation);
    RealmObjectBase.set(this, 'latDestination', latDestination);
    RealmObjectBase.set(this, 'langDestination', langDestination);
    RealmObjectBase.set(this, 'totalCost', totalCost);
    RealmObjectBase.set(this, 'oneKWhPrice', oneKWhPrice);
    RealmObjectBase.set(this, 'distanceMiles', distanceMiles);
  }

  EvTripModel._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get owner_id =>
      RealmObjectBase.get<String>(this, 'owner_id') as String;
  @override
  set owner_id(String value) => RealmObjectBase.set(this, 'owner_id', value);

  @override
  String get countryChargingStation =>
      RealmObjectBase.get<String>(this, 'countryChargingStation') as String;
  @override
  set countryChargingStation(String value) =>
      RealmObjectBase.set(this, 'countryChargingStation', value);

  @override
  double get latOrigin =>
      RealmObjectBase.get<double>(this, 'latOrigin') as double;
  @override
  set latOrigin(double value) => RealmObjectBase.set(this, 'latOrigin', value);

  @override
  double get langOrigin =>
      RealmObjectBase.get<double>(this, 'langOrigin') as double;
  @override
  set langOrigin(double value) =>
      RealmObjectBase.set(this, 'langOrigin', value);

  @override
  double get latChargingStattion =>
      RealmObjectBase.get<double>(this, 'latChargingStattion') as double;
  @override
  set latChargingStattion(double value) =>
      RealmObjectBase.set(this, 'latChargingStattion', value);

  @override
  double get langChargingStation =>
      RealmObjectBase.get<double>(this, 'langChargingStation') as double;
  @override
  set langChargingStation(double value) =>
      RealmObjectBase.set(this, 'langChargingStation', value);

  @override
  double get latDestination =>
      RealmObjectBase.get<double>(this, 'latDestination') as double;
  @override
  set latDestination(double value) =>
      RealmObjectBase.set(this, 'latDestination', value);

  @override
  double get langDestination =>
      RealmObjectBase.get<double>(this, 'langDestination') as double;
  @override
  set langDestination(double value) =>
      RealmObjectBase.set(this, 'langDestination', value);

  @override
  double get totalCost =>
      RealmObjectBase.get<double>(this, 'totalCost') as double;
  @override
  set totalCost(double value) => RealmObjectBase.set(this, 'totalCost', value);

  @override
  double get oneKWhPrice =>
      RealmObjectBase.get<double>(this, 'oneKWhPrice') as double;
  @override
  set oneKWhPrice(double value) =>
      RealmObjectBase.set(this, 'oneKWhPrice', value);

  @override
  double get distanceMiles =>
      RealmObjectBase.get<double>(this, 'distanceMiles') as double;
  @override
  set distanceMiles(double value) =>
      RealmObjectBase.set(this, 'distanceMiles', value);

  @override
  Stream<RealmObjectChanges<EvTripModel>> get changes =>
      RealmObjectBase.getChanges<EvTripModel>(this);

  @override
  EvTripModel freeze() => RealmObjectBase.freezeObject<EvTripModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(EvTripModel._);
    return const SchemaObject(
        ObjectType.realmObject, EvTripModel, 'EvTripModel', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('owner_id', RealmPropertyType.string),
      SchemaProperty('countryChargingStation', RealmPropertyType.string),
      SchemaProperty('latOrigin', RealmPropertyType.double),
      SchemaProperty('langOrigin', RealmPropertyType.double),
      SchemaProperty('latChargingStattion', RealmPropertyType.double),
      SchemaProperty('langChargingStation', RealmPropertyType.double),
      SchemaProperty('latDestination', RealmPropertyType.double),
      SchemaProperty('langDestination', RealmPropertyType.double),
      SchemaProperty('totalCost', RealmPropertyType.double),
      SchemaProperty('oneKWhPrice', RealmPropertyType.double),
      SchemaProperty('distanceMiles', RealmPropertyType.double),
    ]);
  }
}
