int exec(int a, int b, int Function(int, int) fn) {
  return fn(a, b);
}

main() {
  var item = new Produto(nome: "Pen", preco: 1.50);
  //p1.nome = "Lapis";
  //p1.preco = 4.60;
  imprimirProduto(10, name: item.nome, price: item.preco);
}

class Produto {
  String nome;
  double preco;

  Produto({this.nome, this.preco});
}

imprimirProduto(int quant, {String name, double price}) {
  for (var i = 0; i < quant; i++) {
    print("$i - O produto ${name} tem preço R\$ ${price}");
  }
}
