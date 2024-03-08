import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:physio_mobile/main.dart';
import 'package:physio_mobile/service/prefs_service.dart';

class UserService {
  Future<void> onLoginPressed(
      String email, String password, BuildContext context) async {
    bool isAuthenticated = true;
    String adminEmail = 'admin';
    String adminPassword = '123';

    if (isAuthenticated) {
      final String apiUrl = 'https://reqres.in/api/users?page=2';

      final Map<String, dynamic> requestBody = {
        'email': email,
        'password': password,
      };
      print('SALVOU');
      try {
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(requestBody),
        );

        if (response.statusCode == 200 ||
            (email == adminEmail && password == adminPassword)) {
          print("ENTROU");
          // Login bem-sucedido
          //final Map<String, dynamic> responseData = jsonDecode(response.body);
          final String token = '123';
          print('Token: $token');

          PrefsService.setString('token', token);
          // Navegar para a tela principal (NavigationExample)
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => NavigationExample()),
          );
        } else {
          // Tratar o caso de falha na autenticação
          print('Falha na autenticação: ${response.statusCode}');
          print('Resposta: ${response.body}');
          // Exibir uma mensagem de erro ou tome outras medidas necessárias
        }
      } catch (e) {
        // Tratar exceções durante a solicitação HTTP
        print('Erro durante a solicitação HTTP: $e');
        // Exibir uma mensagem de erro ou tome outras medidas necessárias
      }
    } else {
      // Tratar o caso de autenticação falhada conforme necessário
    }
  }

  Future<void> onSignUpPressed(
      String name, String email, String password, BuildContext context) async {
    final String apiUrl = 'http://seu-servidor/api/v1/auth/register';

    final Map<String, dynamic> requestBody = {
      'name': name,
      'email': email,
      'password': password,
    };

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 201) {
        // Registro bem-sucedido
        print('Registro bem-sucedido');

        // Você pode adicionar lógica adicional aqui, se necessário
      } else {
        // Tratar o caso de falha no registro
        print('Falha no registro: ${response.statusCode}');
        print('Resposta: ${response.body}');
        // Exibir uma mensagem de erro ou tomar outras medidas necessárias
      }
    } catch (e) {
      // Tratar exceções durante a solicitação HTTP
      print('Erro durante a solicitação HTTP: $e');
      // Exibir uma mensagem de erro ou tomar outras medidas necessárias
    }
  }
}
