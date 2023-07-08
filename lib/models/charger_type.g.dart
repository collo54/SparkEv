// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charger_type.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class ChargerTypeModel extends _ChargerTypeModel
    with RealmEntity, RealmObjectBase, RealmObject {
  ChargerTypeModel(
    ObjectId id,
    int tesla,
    int swap,
    int j1772,
    int ccsCombo1,
    int type2,
    int ccsCombo2,
    int cHAdeMo,
    int wallOutlet,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'tesla', tesla);
    RealmObjectBase.set(this, 'swap', swap);
    RealmObjectBase.set(this, 'j1772', j1772);
    RealmObjectBase.set(this, 'ccsCombo1', ccsCombo1);
    RealmObjectBase.set(this, 'type2', type2);
    RealmObjectBase.set(this, 'ccsCombo2', ccsCombo2);
    RealmObjectBase.set(this, 'cHAdeMo', cHAdeMo);
    RealmObjectBase.set(this, 'wallOutlet', wallOutlet);
  }

  ChargerTypeModel._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  int get tesla => RealmObjectBase.get<int>(this, 'tesla') as int;
  @override
  set tesla(int value) => RealmObjectBase.set(this, 'tesla', value);

  @override
  int get swap => RealmObjectBase.get<int>(this, 'swap') as int;
  @override
  set swap(int value) => RealmObjectBase.set(this, 'swap', value);

  @override
  int get j1772 => RealmObjectBase.get<int>(this, 'j1772') as int;
  @override
  set j1772(int value) => RealmObjectBase.set(this, 'j1772', value);

  @override
  int get ccsCombo1 => RealmObjectBase.get<int>(this, 'ccsCombo1') as int;
  @override
  set ccsCombo1(int value) => RealmObjectBase.set(this, 'ccsCombo1', value);

  @override
  int get type2 => RealmObjectBase.get<int>(this, 'type2') as int;
  @override
  set type2(int value) => RealmObjectBase.set(this, 'type2', value);

  @override
  int get ccsCombo2 => RealmObjectBase.get<int>(this, 'ccsCombo2') as int;
  @override
  set ccsCombo2(int value) => RealmObjectBase.set(this, 'ccsCombo2', value);

  @override
  int get cHAdeMo => RealmObjectBase.get<int>(this, 'cHAdeMo') as int;
  @override
  set cHAdeMo(int value) => RealmObjectBase.set(this, 'cHAdeMo', value);

  @override
  int get wallOutlet => RealmObjectBase.get<int>(this, 'wallOutlet') as int;
  @override
  set wallOutlet(int value) => RealmObjectBase.set(this, 'wallOutlet', value);

  @override
  Stream<RealmObjectChanges<ChargerTypeModel>> get changes =>
      RealmObjectBase.getChanges<ChargerTypeModel>(this);

  @override
  ChargerTypeModel freeze() =>
      RealmObjectBase.freezeObject<ChargerTypeModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ChargerTypeModel._);
    return const SchemaObject(
        ObjectType.realmObject, ChargerTypeModel, 'ChargerTypeModel', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('tesla', RealmPropertyType.int),
      SchemaProperty('swap', RealmPropertyType.int),
      SchemaProperty('j1772', RealmPropertyType.int),
      SchemaProperty('ccsCombo1', RealmPropertyType.int),
      SchemaProperty('type2', RealmPropertyType.int),
      SchemaProperty('ccsCombo2', RealmPropertyType.int),
      SchemaProperty('cHAdeMo', RealmPropertyType.int),
      SchemaProperty('wallOutlet', RealmPropertyType.int),
    ]);
  }
}
