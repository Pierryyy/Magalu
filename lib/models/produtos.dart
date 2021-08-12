class Produto {
  final String nome;
  final String subnome;
  final String photo;
  final String valor;
  final String parcelamento;
  final String desc;

  bool isFavorite;

  Produto({
    required this.nome,
    required this.subnome,
    required this.photo,
    required this.valor,
    required this.parcelamento,
    required this.desc,
    this.isFavorite = false,
  });
}
