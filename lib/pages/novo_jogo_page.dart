import 'package:cashflow/components/profissao_card.dart';
import 'package:cashflow/utils/app_routes.dart';
import 'package:flutter/material.dart';

class NovoJogoPage extends StatefulWidget {
  const NovoJogoPage({super.key});

  @override
  State<NovoJogoPage> createState() => _NovoJogoPageState();
}

class _NovoJogoPageState extends State<NovoJogoPage> {
  final TextEditingController _nomeController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose(); // Liberar recursos ao fechar a página
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Jogo'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100, bottom: 50),
              child: Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: TextField(
                  controller: _nomeController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    floatingLabelStyle: TextStyle(color: Colors.white),
                    labelText: 'Nome do Jogador',
                    border: OutlineInputBorder(),
                    hintText: 'Digite seu nome',
                  ),
                ),
              ),
            ),
            const ProfissaoCard(),
            const SizedBox(height: 30),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Sortear Profissão'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
