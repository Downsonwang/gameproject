/*
 * @Descripttion: 
 * @Author: 
 * @Date: 2024-04-29 10:03:19
 * @LastEditTime: 2024-04-29 10:03:24
 */
import 'package:chat/src/models/typing_event.dart';
import 'package:chat/src/models/user.dart';

abstract class ITypingNotification {
  Future<bool?> send({required List<TypingEvent> events});
  Stream<TypingEvent> subscribe(User user, List<String> userIds);
  void dispose();
}

