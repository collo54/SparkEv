// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class UserModel extends _UserModel
    with RealmEntity, RealmObjectBase, RealmObject {
  UserModel(
    ObjectId id,
    int number,
    String userName,
    String profession,
    String profileImage,
    String location,
    String time,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'number', number);
    RealmObjectBase.set(this, 'userName', userName);
    RealmObjectBase.set(this, 'profession', profession);
    RealmObjectBase.set(this, 'profileImage', profileImage);
    RealmObjectBase.set(this, 'location', location);
    RealmObjectBase.set(this, 'time', time);
  }

  UserModel._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  int get number => RealmObjectBase.get<int>(this, 'number') as int;
  @override
  set number(int value) => RealmObjectBase.set(this, 'number', value);

  @override
  String get userName =>
      RealmObjectBase.get<String>(this, 'userName') as String;
  @override
  set userName(String value) => RealmObjectBase.set(this, 'userName', value);

  @override
  String get profession =>
      RealmObjectBase.get<String>(this, 'profession') as String;
  @override
  set profession(String value) =>
      RealmObjectBase.set(this, 'profession', value);

  @override
  String get profileImage =>
      RealmObjectBase.get<String>(this, 'profileImage') as String;
  @override
  set profileImage(String value) =>
      RealmObjectBase.set(this, 'profileImage', value);

  @override
  String get location =>
      RealmObjectBase.get<String>(this, 'location') as String;
  @override
  set location(String value) => RealmObjectBase.set(this, 'location', value);

  @override
  String get time => RealmObjectBase.get<String>(this, 'time') as String;
  @override
  set time(String value) => RealmObjectBase.set(this, 'time', value);

  @override
  Stream<RealmObjectChanges<UserModel>> get changes =>
      RealmObjectBase.getChanges<UserModel>(this);

  @override
  UserModel freeze() => RealmObjectBase.freezeObject<UserModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(UserModel._);
    return const SchemaObject(ObjectType.realmObject, UserModel, 'UserModel', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('number', RealmPropertyType.int),
      SchemaProperty('userName', RealmPropertyType.string),
      SchemaProperty('profession', RealmPropertyType.string),
      SchemaProperty('profileImage', RealmPropertyType.string),
      SchemaProperty('location', RealmPropertyType.string),
      SchemaProperty('time', RealmPropertyType.string),
    ]);
  }
}
