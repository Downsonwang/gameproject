
import 'package:chat/src/services/encryption/encryption_contract.dart';
import 'package:encrypt/encrypt.dart';

class EncryptionService implements IEncryption {
  final Encrypter _encrypter;
  final _iv = IV.fromLength(16);
  EncryptionService(this._encrypter);
  // 用于解密给定的加密文本。
  // 它接受一个加密文本作为参数，并返回解密后的明文字符串。
  @override
  String decrypt(String encryptedText) {
     final encrypted = Encrypted.fromBase64(encryptedText);
     return _encrypter.decrypt(encrypted,iv: this._iv);
  }
  // 用于加密给定的明文字符串。它接受一个明文字符串作为参数，并返回加密后的密文字符串。
  @override
  String encrypt(String text) {
   return _encrypter.encrypt(text,iv: _iv).base64;
  }
  
}