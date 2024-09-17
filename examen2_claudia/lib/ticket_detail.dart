import 'package:flutter/material.dart';
import 'main.dart';

class TicketDetailScreen extends StatefulWidget {
  final Ticket ticket;
  final Function(Ticket) onUpdate;

  const TicketDetailScreen(
      {super.key, required this.ticket, required this.onUpdate});

  @override
  TicketDetailScreenState createState() => TicketDetailScreenState();
}

class TicketDetailScreenState extends State<TicketDetailScreen> {
  late TextEditingController _numeroVueloController;
  late TextEditingController _aerolineaController;
  late TextEditingController _pasajeroController;
  late TextEditingController _origenController;
  late TextEditingController _destinoController;

  @override
  void initState() {
    super.initState();
    _numeroVueloController =
        TextEditingController(text: widget.ticket.numeroVuelo);
    _aerolineaController = TextEditingController(text: widget.ticket.aerolinea);
    _pasajeroController = TextEditingController(text: widget.ticket.pasajero);
    _origenController = TextEditingController(text: widget.ticket.origen);
    _destinoController = TextEditingController(text: widget.ticket.destino);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del Ticket'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _numeroVueloController,
              decoration: const InputDecoration(labelText: 'Número de Vuelo'),
            ),
            TextField(
              controller: _aerolineaController,
              decoration: const InputDecoration(labelText: 'Aerolínea'),
            ),
            TextField(
              controller: _pasajeroController,
              decoration: const InputDecoration(labelText: 'Pasajero'),
            ),
            TextField(
              controller: _origenController,
              decoration: const InputDecoration(labelText: 'Origen'),
            ),
            TextField(
              controller: _destinoController,
              decoration: const InputDecoration(labelText: 'Destino'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedTicket = Ticket(
                  numeroVuelo: _numeroVueloController.text,
                  aerolinea: _aerolineaController.text,
                  pasajero: _pasajeroController.text,
                  origen: _origenController.text,
                  destino: _destinoController.text,
                );
                widget.onUpdate(updatedTicket);
                Navigator.pop(context);
              },
              child: const Text('Actualizar Ticket'),
            ),
          ],
        ),
      ),
    );
  }
}
