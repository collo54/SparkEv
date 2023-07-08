// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ev.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class EvModel extends _EvModel with RealmEntity, RealmObjectBase, RealmObject {
  EvModel(
    ObjectId id,
    int count,
    String continent,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'count', count);
    RealmObjectBase.set(this, 'continent', continent);
  }

  EvModel._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  int get count => RealmObjectBase.get<int>(this, 'count') as int;
  @override
  set count(int value) => RealmObjectBase.set(this, 'count', value);

  @override
  String get continent =>
      RealmObjectBase.get<String>(this, 'continent') as String;
  @override
  set continent(String value) => RealmObjectBase.set(this, 'continent', value);

  @override
  Stream<RealmObjectChanges<EvModel>> get changes =>
      RealmObjectBase.getChanges<EvModel>(this);

  @override
  EvModel freeze() => RealmObjectBase.freezeObject<EvModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(EvModel._);
    return const SchemaObject(ObjectType.realmObject, EvModel, 'EvModel', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('count', RealmPropertyType.int),
      SchemaProperty('continent', RealmPropertyType.string),
    ]);
  }
}
