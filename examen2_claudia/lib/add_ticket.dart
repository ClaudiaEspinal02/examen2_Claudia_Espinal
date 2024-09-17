import 'package:flutter/material.dart';
import 'main.dart';

class AddTicketScreen extends StatefulWidget {
  final Function(Ticket) onAdd;

  // Añadir 'const' y 'key'
  const AddTicketScreen({super.key, required this.onAdd});

  @override
  AddTicketScreenState createState() => AddTicketScreenState(); // Clase pública
}

class AddTicketScreenState extends State<AddTicketScreen> {
  // Clase State pública
  final TextEditingController _numeroVueloController = TextEditingController();
  final TextEditingController _aerolineaController = TextEditingController();
  final TextEditingController _pasajeroController = TextEditingController();
  final TextEditingController _origenController = TextEditingController();
  final TextEditingController _destinoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Ticket'), // Añadir 'const' al título
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Añadir 'const' al padding
        child: Column(
          children: [
            TextField(
              controller: _numeroVueloController,
              decoration: const InputDecoration(
                  labelText: 'Número de Vuelo'), // Añadir 'const'
            ),
            TextField(
              controller: _aerolineaController,
              decoration: const InputDecoration(
                  labelText: 'Aerolínea'), // Añadir 'const'
            ),
            TextField(
              controller: _pasajeroController,
              decoration: const InputDecoration(
                  labelText: 'Pasajero'), // Añadir 'const'
            ),
            TextField(
              controller: _origenController,
              decoration:
                  const InputDecoration(labelText: 'Origen'), // Añadir 'const'
            ),
            TextField(
              controller: _destinoController,
              decoration:
                  const InputDecoration(labelText: 'Destino'), // Añadir 'const'
            ),
            const SizedBox(height: 20), // Añadir 'const' al SizedBox
            ElevatedButton(
              onPressed: () {
                final newTicket = Ticket(
                  numeroVuelo: _numeroVueloController.text,
                  aerolinea: _aerolineaController.text,
                  pasajero: _pasajeroController.text,
                  origen: _origenController.text,
                  destino: _destinoController.text,
                );
                widget.onAdd(newTicket);
                Navigator.pop(context);
              },
              child: const Text(
                  'Agregar Ticket'), // Añadir 'const' al texto del botón
            ),
          ],
        ),
      ),
    );
  }
}
