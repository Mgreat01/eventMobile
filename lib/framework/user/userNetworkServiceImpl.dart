
import 'dart:convert';

import '../../business/models/user/authentication.dart';

import '../../business/models/user/loginReponse.dart';
import '../../business/models/user/user.dart';

import '../../business/services/user/userNetworkService.dart';
import '../../utils/http/HttpUtils.dart';
// import '../utils/http/remoteHttpUtils.dart';




class UserNetworkServiceImpl extends UserNetworkService {
  final String baseUrl;
  final HttpUtils httpUtils;

  UserNetworkServiceImpl({required this.baseUrl, required this.httpUtils});

  @override
  Future<User> recupererInfoUtilisateur() {
    // TODO: implement recupererInfoUtilisateur
    throw UnimplementedError();
  }


  @override
  Future<User> seConnecter(Authentication authentication) async {
    final url = '$baseUrl/login';
    final req = authentication.toJson();

    print(' Données envoyées au backend : $req');

    try {
      final String responseBody = await httpUtils.postData(
        url,
        body: req,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      print(' Réponse brute : $responseBody');

      final decodedJson = jsonDecode(responseBody);


      if (decodedJson is Map<String, dynamic> &&
          decodedJson.containsKey('message') &&
          decodedJson.containsKey('errors')) {
        final errorMessage = decodedJson['message'];
        final errors = decodedJson['errors'];

        print(' Erreur du backend : $errorMessage');

        if (errors is Map<String, dynamic>) {
          errors.forEach((key, value) {
            print(' [$key] : ${(value as List).join(", ")}');
          });
        }

        throw Exception(errorMessage);
      }


      final loginResponse = LoginResponse.fromJson(decodedJson);
      print(' Utilisateur connecté : ${loginResponse.user.toJson()}');

      return loginResponse.user;
    } catch (e) {
      print(' Erreur lors de la connexion : $e');
      throw Exception('Connexion échouée : ${e.toString()}');
    }
  }
  
  @override
  Future<User> creerCompte(User user) { 


    }
  
  @override
  Future<User> seDeconnecter() {
    // TODO: implement seDeconnecter
    throw UnimplementedError();
  }
}





/*
void main() async {
  final userService = UserNetworkServiceImpl(
   // baseUrl: 'http://10.252.252.55:8000/api',
    // baseUrl: 'http://10.252.252.24:8000/api',
   // baseUrl: 'http://localhost:8000/api',
   baseUrl:'http://10.0.2.2:8000',
    httpUtils: RemoteHttpUtils(),
  );

  try {
    final auth = Authentication(email: 'ephraimmnga40000@gmail.com', password: 'crpo jupt juwm zbvq');
    final user = await userService.seConnecter(auth);
    print(' Connexion réussie! Utilisateur: ${user.toJson()}');
  } catch (e) {
    print(' Erreur de connexion: $e');
  }
}
*/
