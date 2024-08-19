abstract class AuthRepository {
  Future login(String username, String password);

  Future register(String username, String password);

  Future logout();
}
