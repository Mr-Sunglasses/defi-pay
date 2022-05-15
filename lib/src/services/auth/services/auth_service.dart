import '../../../models/user.dart';

abstract class AuthService {
  factory AuthService() => _MockService();
  Future<void> signInWithGoogle();

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    String name = '',
  });

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> forgotPassword({required String email});

  Future<void> signOut();

  Future<bool> get isSignedIn;

  UserModel? get currentUser;
}

class _MockService implements AuthService {
  _MockService() : _isSignedIn = false;
  bool _isSignedIn;
  UserModel? _user;

  @override
  Future<void> signInWithGoogle() async {
    await Future.delayed(const Duration(milliseconds: 500), () {
      _isSignedIn = true;
      _user = UserModel(email: 'dummy@dummy.com', id: 'dummy123');
    });
  }

  @override
  Future<void> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      String name = ''}) async {
    await Future.delayed(const Duration(milliseconds: 3000), () {
      _isSignedIn = true;
      _user = UserModel(email: email, id: password);
    });
  }

  @override
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500), () {
      _isSignedIn = true;
      _user = UserModel(email: email, id: password);
    });
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    await Future.delayed(const Duration(milliseconds: 500), () {});
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 500), () {
      _isSignedIn = false;
      _user = null;
    });
  }

  @override
  Future<bool> get isSignedIn async {
    await Future.delayed(const Duration(milliseconds: 500), () {});
    return _isSignedIn;
  }

  @override
  UserModel? get currentUser {
    return _user;
  }
}

class AuthException implements Exception {
  final String message;
  AuthException({
    required this.message,
  });

  @override
  String toString() => message;
}
