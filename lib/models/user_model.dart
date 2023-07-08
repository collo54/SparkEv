import 'package:realm/realm.dart';

part 'user_model.g.dart';

@RealmModel()
class _UserModel {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late int number;
  late String userName;
  late String profession;
  late String profileImage;
  late String location;
  late String time;
}
