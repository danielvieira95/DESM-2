import 'package:flutter/material.dart';

class Cadastroproduto extends StatelessWidget {
  const Cadastroproduto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de produto"),
      ),
      body: Column(
        children: [
          Produto("PS5","https://m.media-amazon.com/images/I/71YBU9c7qlL._AC_SX679_.jpg",5000.00),
          Produto("Iphone","https://m.media-amazon.com/images/I/81YSmKnlijL.__AC_SY445_SX342_QL70_ML2_.jpg",8000.00),
          Produto("TV","https://m.media-amazon.com/images/I/61oiiGulDPL.__AC_SX300_SY300_QL70_ML2_.jpg",4000.00),
        ],
      ),
    );
  }
}

class Produto extends StatefulWidget {
  String nome; // nome do produto
  String img;
  double valor;
  Produto(this.nome, this.img, this.valor); // Construtor para passagem de parâmetros

  @override
  State<Produto> createState() => _ProdutoState();
}

class _ProdutoState extends State<Produto> {
  int cont=0;
  _incrementar(){
    
    setState(() {
      cont++;
    });
  }
  _decrementar(){
    
    setState(() {
      if(cont>0){
       cont--;
      }
      else{
        cont=0;
      }
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // widget.img é utilizado para acessar a variavel da classe produto
            Container(width: 150,height: 100,child: Image.network( widget.img,fit: BoxFit.fill,),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${widget.nome}",style: TextStyle(fontSize: 18),),
                  
                  Text("Qtde $cont",style: TextStyle(fontSize: 18),),
                      
                     
                  
                  
                  Text("Valor R\$ ${widget.valor}",style: TextStyle(fontSize: 18),),
                ],
              ),
            ),
        
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Qtde ",style: TextStyle(fontSize:18),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: _incrementar, child: Icon(Icons.add)),
            ), // botao para incrementar a quantidade de produtos
            ElevatedButton(onPressed: _decrementar, child: Icon(Icons.restore)), // botao para decrementar a quantidade de produtos
          ],
        ),
         
      ],
    );
  }
}