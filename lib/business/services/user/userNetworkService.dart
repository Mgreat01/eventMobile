import '../../models/user/authentication.dart';
import '../../models/user/interet.dart';
import '../../models/user/user.dart';

abstract class UserNetworkService {
  Future<User> seConnecter(Authentication authentication);
  Future<User> recupererInfoUtilisateur();
  Future<User> creerCompte(User user);
  Future<User> seDeconnecter();
  Future<List<Interet>> getInterets();
  Future<bool> verifierOtp({required String email, required String otp});
}
