class Profissao {
  final String id;
  final String nome;
  final double salario;
  final double juros;
  final double dividendos;
  final double bensMateriais;
  final double impostos;
  final double dividendoAluguel;
  final double pagColegio;
  final double pagAutomovel;
  final double pagCartaoCredito;
  final double pagMenores;
  final double outrosGastos;
  final int numeroDeFilhos;
  final double gastosPorFilho;
  final double economias;
  final double hipotecaCasa;
  final double dividasColegio;
  final double emprestimoAuto;
  final double cartoesCredito;
  final double dividasMenores;
  final String imageUrl;

  Profissao(
      {required this.id,
      required this.nome,
      required this.salario,
      required this.juros,
      required this.dividendos,
      required this.bensMateriais,
      required this.impostos,
      required this.dividendoAluguel,
      required this.pagColegio,
      required this.pagAutomovel,
      required this.pagCartaoCredito,
      required this.pagMenores,
      required this.outrosGastos,
      required this.numeroDeFilhos,
      required this.gastosPorFilho,
      required this.economias,
      required this.hipotecaCasa,
      required this.dividasColegio,
      required this.emprestimoAuto,
      required this.cartoesCredito,
      required this.dividasMenores,
      required this.imageUrl});

  // Método que calcula o fluxo de caixa mensal
  double calcularFluxoDeCaixa() {
    double despesas = impostos +
        dividendoAluguel +
        pagColegio +
        pagAutomovel +
        pagCartaoCredito +
        pagMenores +
        outrosGastos +
        (gastosPorFilho * numeroDeFilhos);
    return salario - despesas;
  }

  // Método que calcula o total de dívidas
  double calcularTotalDividas() {
    return hipotecaCasa +
        dividasColegio +
        emprestimoAuto +
        cartoesCredito +
        dividasMenores;
  }

  double calcularTotalDespesas() {
    double despesas = impostos +
        dividendoAluguel +
        pagColegio +
        pagAutomovel +
        pagCartaoCredito +
        pagMenores +
        outrosGastos +
        (gastosPorFilho * numeroDeFilhos);
    return despesas;
  }

  @override
  String toString() {
    return '''
Profissão: $nome
Salário: \$${salario.toStringAsFixed(2)}
Fluxo de Caixa Mensal: \$${calcularFluxoDeCaixa().toStringAsFixed(2)}
Total de Dívidas: \$${calcularTotalDividas().toStringAsFixed(2)}
Economias: \$${economias.toStringAsFixed(2)}
    ''';
  }
}
