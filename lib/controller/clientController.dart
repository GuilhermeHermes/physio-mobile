// client_controller.dart

import 'package:physio_mobile/model/client.dart';

class ClientController {
  List<Client> clients = [];

  // Adicionar cliente
  void addClient(Client client) {
    clients.add(client);
  }

  // Atualizar cliente
  void updateClient(int id, Client newClient) {
    int index = clients.indexWhere((client) => client.id == id);
    if (index != -1) {
      clients[index] = newClient;
    }
  }

  // Remover cliente
  void removeClient(int id) {
    clients.removeWhere((client) => client.id == id);
  }

  // Obter todos os clientes
  List<Client> getAllClients() {
    return clients;
  }

  // Obter cliente por ID
  Client getClientById(int id) {
    return clients.firstWhere((client) => client.id == id,
        orElse: () => Client(id: -1, name: "", email: "", photoUrl: ""));
  }
}
