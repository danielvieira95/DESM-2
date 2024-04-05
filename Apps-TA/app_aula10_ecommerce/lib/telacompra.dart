import 'package:app_aula10_ecommerce/telaproduto.dart';
import 'package:flutter/material.dart';



class TelaCliente extends StatefulWidget {
   
 

  @override
  State<TelaCliente> createState() => _TelaClienteState();
}

class _TelaClienteState extends State<TelaCliente> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compra"),
      ),
      body: ListView(
       scrollDirection: Axis.vertical,
        children: [
           
          Produto("Videogame", "https://m.media-amazon.com/images/I/71YBU9c7qlL._AC_SX679_.jpg", 0, 5000),
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
  double valor =0;
  double total =0;
  int cont =0;
  

   Produto(this.nomeproduto, this.img, this.qtde,this.valor );
  

  @override
  State<Produto> createState() => _ProdutoState();
}

class _ProdutoState extends State<Produto> {
  
  double? v;
   List<Produto> telas=[
 Produto("Videogame", "https://m.media-amazon.com/images/I/71YBU9c7qlL._AC_SX679_.jpg", 0, 5000),
          Produto("Telefone", "https://m.media-amazon.com/images/I/81YSmKnlijL.__AC_SY445_SX342_QL70_ML2_.jpg", 10, 8000),
          Produto("TV", "https://m.media-amazon.com/images/I/61oiiGulDPL.__AC_SX300_SY300_QL70_ML2_.jpg", 10, 6500),
  ];

  double calctotalcompra(){
  double total =0;
  for(Produto telas in telas){
    total+=telas.total;

  }
  return total;
  }
  _exibircalc(){
    setState(() {
      v= calctotalcompra();
      print(v);
    });
  
}
  _incrementprod(){
    setState(() {
      widget.cont ++;
      widget.total = widget.cont *widget.valor;
      print(widget.total);
    });
    

  }
  _decrementprod(){
    setState(() {
      widget.cont--;
      widget.total = widget.cont *widget.valor;
      print(widget.total);
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
                                 
                Text("Quantidade ${widget.cont}",style: TextStyle(fontSize: 18)),
                  
                  
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
       
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed:_exibircalc, child: Text("Calcular")),
              ),
                  ElevatedButton(onPressed: (){}, child: Text("Limpar")),
                  Text("Valor total R\$ ${v}",style: TextStyle(fontSize: 18),),
                ],
              ),
         Text("${calctotalcompra()}",)  
      ],
    );

    
  }
}

