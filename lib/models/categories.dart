class Categorias {
  final int id;
  final String categoriaNome;
  final String descricao;

  Categorias(
      {required this.id, required this.categoriaNome, required this.descricao});

  factory Categorias.toJson(Map<String, dynamic> json) {
    return Categorias(
      id: json['id'] as int,
      categoriaNome: json['categoria_nome'] as String,
      descricao: json['descricao'] as String,
    );
  }

  factory Categorias.showMessage(Categorias e) {
    return e;
  }
}
