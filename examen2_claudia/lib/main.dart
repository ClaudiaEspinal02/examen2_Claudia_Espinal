import 'package:examen2_claudia/firebase_options.dart';
import 'package:examen2_claudia/src/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:examen2_claudia/services/add_ticket.dart';
import 'package:examen2_claudia/services/ticket_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticket Avión CRUD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TicketListScreen(), // Añadir 'const'
    );
  }
}

class Ticket {
  String numeroVuelo;
  String aerolinea;
  String pasajero;
  String origen;
  String destino;

  Ticket({
    required this.numeroVuelo,
    required this.aerolinea,
    required this.pasajero,
    required this.origen,
    required this.destino,
  });
}

class TicketListScreen extends StatefulWidget {
  const TicketListScreen({super.key});

  @override
  TicketListScreenState createState() => TicketListScreenState();
}

class TicketListScreenState extends State<TicketListScreen> {
  List<Ticket> tickets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tickets'),
      ),
      body: tickets.isEmpty
          ? const Center(child: Text('No hay tickets aún.'))
          : ListView.builder(
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                final ticket = tickets[index];
                return ListTile(
                  title: Text('Vuelo: ${ticket.numeroVuelo}'),
                  subtitle: Text('Aerolínea: ${ticket.aerolinea}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        tickets.removeAt(index);
                      });
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TicketDetailScreen(
                          ticket: ticket,
                          onUpdate: (updatedTicket) {
                            setState(() {
                              tickets[index] = updatedTicket;
                            });
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTicketScreen(
                onAdd: (newTicket) {
                  setState(() {
                    tickets.add(newTicket);
                  });
                },
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
