import 'package:cashflow/data/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';

final formatCurrency = NumberFormat.currency(locale: 'pt_BR', symbol: '\$');

class ProfissaoCard extends StatefulWidget {
  const ProfissaoCard({super.key});

  @override
  State<ProfissaoCard> createState() => _ProfissaoCardState();
}

class _ProfissaoCardState extends State<ProfissaoCard> {
  int _atual = 0;

  dynamic _profissaoSelecionada = {};

  @override
  Widget build(BuildContext context) {
    final _profissoes = DUMMY_PROFISSOES.toList();

    return Container(
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 450,
          aspectRatio: 16 / 9,
          viewportFraction: 0.70,
          enlargeCenterPage: true,
        ),
        items: _profissoes.map((prof) {
          return Builder(builder: (context) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (_profissaoSelecionada == prof)
                    _profissaoSelecionada = {};
                  else
                    _profissaoSelecionada = prof;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: _profissaoSelecionada == prof
                      ? Border.all(color: Colors.amber, width: 3)
                      : null,
                  boxShadow: _profissaoSelecionada == prof
                      ? [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 10,
                              offset: Offset(0, 10))
                        ]
                      : [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 20,
                            offset: const Offset(0, 5),
                          )
                        ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 320,
                        clipBehavior: Clip.hardEdge,
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.network(
                          prof.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        prof.nome,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Salário: ${formatCurrency.format(prof.salario)}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          Text(
                            'Despesas: ${formatCurrency.format(prof.calcularTotalDespesas())}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'CashFlow: ${formatCurrency.format(prof.calcularFluxoDeCaixa())}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          Text(
                            'Dívidas: ${formatCurrency.format(prof.calcularTotalDividas())}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          });
        }).toList(),
      ),
    );
  }
}
