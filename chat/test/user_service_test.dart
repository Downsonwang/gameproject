/*
 * @Descripttion: 
 * @Author: 
 * @Date: 2024-04-26 22:17:36
 * @LastEditTime: 2024-04-26 23:42:34
 */


import 'package:chat/src/models/user.dart';
import 'package:chat/src/services/user/user_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rethink_db_ns/rethink_db_ns.dart';

import 'helpers.dart';

void main() {
  RethinkDb r = RethinkDb();
   Connection? connection; // 使用late关键字表示该变量稍后会被初始化
  late UserService sut; // 使用late关键字表示该变量稍后会被初始化

  setUp(() async {
    connection = await r.connect(host: "127.0.0.1", port: 28015);
    await createDb(r, connection!);
    sut = UserService(r, connection!);
  });

  tearDown(() async {
    await cleanDb(r, connection!);
  });

test('creates a new user document in database', () async {
    final user = User(
      username: 'test',
      photoUrl: 'url',
      active: true,
      lastseen: DateTime.now(),
    );
    final userWithId = await sut.connect(user);
    expect(userWithId.id, isNotEmpty);
  });

   test('get online users', () async {
    final user = User(
      username: 'test',
      photoUrl: 'url',
      active: true,
      lastseen: DateTime.now(),
    );
    //arrange
    await sut.connect(user);
    //act
    final users = await sut.online();
    //assert
    expect(users.length, 1);
  });
}
