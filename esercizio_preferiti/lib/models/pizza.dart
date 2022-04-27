class Pizza{
  final String nome;
  final String id;

  Pizza(this.nome, this.id);

  static List<Pizza> get listaPizze {
    return [
      Pizza('Marinara', '1'),
      Pizza('Margherita', '2'),
      Pizza('Prosciutto e funghi', '3'),
      Pizza('Diavola', '4'),
      Pizza('Quattro stagioni', '5'),
      Pizza('Quattro formaggi', '6'),
      Pizza('Vegetariana', '7'),
      Pizza('Capricciosa', '8'),
      Pizza('Viennese', '9'),
      Pizza('Sole', '10'),
    ];
  }
}