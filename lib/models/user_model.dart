import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String userName;

  @HiveField(1)
  String email;

  @HiveField(2)
  String password;

  UserModel({required this.userName, required this.email, required this.password});
}
