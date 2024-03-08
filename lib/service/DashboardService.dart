import 'dart:convert';

import 'package:http/http.dart' as http;

class DashboardService {
  Future<Map<String, dynamic>> getStatistics() async {
    final String apiUrl = 'http://seu-servidor/api/v1/dashboard';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return responseData['data'];
      } else {
        print('Falha ao obter estatísticas: ${response.statusCode}');
        print('Resposta: ${response.body}');
        return {};
      }
    } catch (e) {
      print('Erro durante a solicitação HTTP: $e');
      return {};
    }
  }
}
