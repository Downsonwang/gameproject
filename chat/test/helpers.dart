/*
 * @Descripttion: 
 * @Author: 
 * @Date: 2024-04-26 21:59:26
 * @LastEditTime: 2024-04-27 09:36:57
 */
import 'package:rethink_db_ns/rethink_db_ns.dart';

Future<void> createDb(RethinkDb r,Connection connection) async{
 await r.dbCreate('test').run(connection).catchError((err)=>{});
 await r.tableCreate('users').run(connection).catchError((err)=>{});
 await r.tableCreate('messages').run(connection).catchError((err)=>{});
}

Future<void> cleanDb(RethinkDb r,Connection connection) async {
  await r.table('users').delete().run(connection);
  await r.table('messages').delete().run(connection);


}

