import 'package:flutter/material.dart';

class Telacliente extends StatefulWidget {
  String mensagem;
  Telacliente(this.mensagem,{super.key});

  @override
  State<Telacliente> createState() => _TelaclienteState();
}

class _TelaclienteState extends State<Telacliente> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compras"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          Text("Passagem de parametros teste ${widget.mensagem}",style: TextStyle(fontSize: 20),),
          
          Produtos(nomeprod: "PS5", img: "https://m.media-amazon.com/images/I/71YBU9c7qlL._AC_SX679_.jpg",qtde: 1, valorprod: 5000.00),
          Produtos(nomeprod: "Iphone", img: "https://m.media-amazon.com/images/I/81YSmKnlijL.__AC_SY445_SX342_QL70_ML2_.jpg",qtde: 1, valorprod: 8000),
          Produtos(nomeprod: "TV", img: "https://m.media-amazon.com/images/I/61oiiGulDPL.__AC_SX300_SY300_QL70_ML2_.jpg",qtde: 1, valorprod: 6500),
        ],
      ),
    );
  }
}

class Produtos extends StatefulWidget {
   
  final String nomeprod;
  final String img;
  double valorprod;
  int qtde;
  Produtos({required this.nomeprod, required this.img,required this.qtde, required this.valorprod});
  @override
  State<Produtos> createState() => _ProdutosState();
}
double? total;
class _ProdutosState extends State<Produtos> {
  
  int cont =0;
  
   _calculartotal(){

    
    setState(() {
      total = cont * widget.valorprod;
      
    });   
    
  }
  _limpar(){
    setState(() {
      
      cont =0;
      total =0;

    });
  }
  @override
  Widget build(BuildContext context) {
    return        
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(width: 150,height: 150,decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.grey,
              
            
              ),
              child: Image.network(widget.img,fit: BoxFit.fill,),),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${widget.nomeprod} ",style: TextStyle(fontSize: 18),),
                Text("Quantidade $cont",style: TextStyle(fontSize: 18),),
                Text("Valor R\$ ${widget.valorprod} ",style: TextStyle(fontSize: 18),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
              
                  children: [
                    Text("Qtde:",style: TextStyle(fontSize: 18),),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(onPressed: (){
                        
                        setState(() {
                          cont++;
                        });
                      }, child: Icon(Icons.add)),)
                    
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(onPressed: _calculartotal, child: Text("Calcular")),
                    ),
                    ElevatedButton(onPressed: _limpar, child: Text("Limpar")),
                  ],
                ),
                
                Text("Valor total ${total}"),

              ],
              
              
            ),
            
            
            
          ],
        );
      
    
    
  }
}