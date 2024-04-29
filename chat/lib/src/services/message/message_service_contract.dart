/*
 * @Descripttion: 
 * @Author: 
 * @Date: 2024-04-26 23:57:08
 * @LastEditTime: 2024-04-27 11:29:23
 */
import '../../models/message.dart';
import '../../models/user.dart';

abstract class IMessageService {
  Future<Message> send(List<Message> messages);
  Stream<Message> messages({required User activeUser,});
  dispose();
}