import 'package:app_aula10_ecommerce/telacompra.dart';
import 'package:flutter/material.dart';
class Telaproduto extends StatelessWidget {
  const Telaproduto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
    title: Text(" Cadastro produtos"),
     ),
     body: Column(
      children: [
        Produto("Videogame", "https://m.media-amazon.com/images/I/71YBU9c7qlL._AC_SX679_.jpg", 10, 5000),
        Produto("Telefone", "https://m.media-amazon.com/images/I/81YSmKnlijL.__AC_SY445_SX342_QL70_ML2_.jpg", 10, 8000),
        Produto("TV", "https://m.media-amazon.com/images/I/61oiiGulDPL.__AC_SX300_SY300_QL70_ML2_.jpg", 10, 6500),
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
  int cont=0;
  _incrementprod(){
    setState(() {
      cont ++;
    });
    

  }
  _decrementprod(){
    setState(() {
      cont--;
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(width: 150,height: 100,color: Colors.grey,
            child: Image.network("${widget.img}",fit: BoxFit.fill,),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
               
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            
                Text("${widget.nomeproduto}",style: TextStyle(fontSize: 18),),
                                 
                Text("Quantidade $cont",style: TextStyle(fontSize: 18)),
                  
                  
                  Text("Valor ${widget.valor}",style: TextStyle(fontSize: 18)),
                  
                  Row(
                      children: [
              Text("Qtde: ",style: TextStyle(fontSize: 18),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: _incrementprod, child: Icon(Icons.add)),
              ),
              ElevatedButton(onPressed: _decrementprod, child: Icon(Icons.restore)),
                      ],
                    ),
                ],
                
              ),
            ),
           
          ],
        ),
        
        
      ],
    );

    
  }
}