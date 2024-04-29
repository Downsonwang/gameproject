
import '../../models/user.dart';

abstract class IUserService {
  Future<User> connect(User user);
  // online people
  Future<List<User>> online();
  Future<void> disconnect(User user);
  Future<List<User>> fetch(List<String?> ids);
}
