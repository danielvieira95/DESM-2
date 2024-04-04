import 'package:flutter/material.dart';
class Telaproduto extends StatelessWidget {
  const Telaproduto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
    title: Text("App Ecommerce - Cadastro produtos"),
     ),
     body: Column(
      children: [
        Produto("Videogame", "https://m.media-amazon.com/images/I/71YBU9c7qlL._AC_SX679_.jpg", 10, 5000),
      ],
     ),
    );
  }
}

class Produto extends StatefulWidget {
  String? nomeproduto;
  String? img;
  int? qtde;
  double? valor;

   Produto(this.nomeproduto, this.img, this.qtde,this.valor );

  @override
  State<Produto> createState() => _ProdutoState();
}

class _ProdutoState extends State<Produto> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(width: 300,height: 300,color: Colors.grey,
        child: Image.network("${widget.img}"),
        ),
        Text("${widget.nomeproduto}"),
      ],
    );

    
  }
}