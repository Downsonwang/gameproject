/*
 * @Descripttion: 
 * @Author: 
 * @Date: 2024-04-26 22:21:28
 * @LastEditTime: 2024-04-26 23:20:07
 */
import 'package:chat/src/models/user.dart';
import 'package:chat/src/services/user/user_service_contract.dart';
import 'package:rethink_db_ns/rethink_db_ns.dart';

class UserService implements IUserService {
  final Connection _connection;
  final RethinkDb r;


  UserService(this.r, this._connection);

  @override
  Future<User> connect(User user) async {
    Map<String, dynamic> data = user.toJson();
    if (user.id != null) {
      data['id'] = user.id;
    }
    final result = await r.table('users').insert(data, {
      'conflict': 'update',
      'return_changes': true,
    }).run(_connection);

    // 获取新值json对象 并从中创建一个用户
    return User.fromJson(result['changes'].first['new_val']);
  }

  @override
  Future<void> disconnect(User user) async {
    await r.table('users').update({
      'id': user.id,
      'active': false,
      'last_seen': DateTime.now(),
    }).run(_connection);
    _connection.close();
  }

  @override
  Future<List<User>> online() async {
    Cursor users = await r.table('users').filter({'active': true}).run(_connection);
    final userList = await users.toList();
    return userList.map((item) => User.fromJson(item)).toList();
  }
}
