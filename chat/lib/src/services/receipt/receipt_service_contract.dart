/*
 * @Descripttion: 
 * @Author: 
 * @Date: 2024-04-29 10:01:12
 * @LastEditTime: 2024-04-29 10:02:36
 */


import 'package:chat/src/models/receipt.dart';
import 'package:chat/src/models/user.dart';

abstract class IReceiptService {
  Future<bool> send(Receipt receipt);
  Stream<Receipt> receipts(User user);
  void dispose();
}

