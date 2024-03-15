import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController valor = TextEditingController();
  int? selectop , selectop1;
  double vdolar =0;
  double veuro =0;
  double vreais =0;
  String preco = "0";
  _consultaBitCoin() async{
    String url = "https://blockchain.info/ticker"; // url com a api 
    http.Response response = await http.get(Uri.parse(url)) ; // espera o retorno da api
    Map<String, dynamic> dados = json.decode(response.body); // decodifica o dado da api
    setState(() {
       preco = dados["BRL"]["buy"].toString(); // faz o parse da informação
    });  
  
    print("Resultado api ${response.statusCode.toString()}");
    print("Valores BitCoin ${dados}");
    print("Valor do bitcoin em R\$ ${preco}");
  }
    _calcularreais_todolar(){
      setState(() {
        vdolar = double.parse(valor.text) /4.99;     
        
      });
    }
    _calcularreais_toeuro(){
      setState(() {
        veuro = double.parse(valor.text) /5.43;     
        
      });
    }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App consulta preço BitCoin"),

      ),
      body: 
         Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(width: 250,height: 150,color: Colors.amber,child: Image.asset('imagens/bitcoin.png'),),
           Text("Valor BitCoin R\$: $preco ",style: TextStyle(fontSize: 20),),
           TextField(
           keyboardType: TextInputType.number,
           decoration:  InputDecoration(labelText: "Digite o valor a ser convertido"),
           controller: valor,
           ),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
            ElevatedButton(onPressed: _consultaBitCoin, child: Text("Verificar")),
           ElevatedButton(onPressed: _calcularreais_todolar, child: Text("Calcular")),
           ElevatedButton(onPressed: _calcularreais_toeuro, child: Text("Calcular")),
            
            ],
           ),
           
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Origem",style: TextStyle(fontSize: 15),),
              

               
              Text("Destino",style: TextStyle(fontSize: 15),),
            ],
           ),
          

           Text("Valor a ser convertido ${valor.text}",style: TextStyle(fontSize: 20),),
            Text("Valor a  convertido  \$ ${vdolar.toStringAsFixed(2)}",style: TextStyle(fontSize: 20),),
            Text("Valor a  convertido  ${veuro.toStringAsFixed(2)}€",style: TextStyle(fontSize: 20),), 
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
             children: [
              
               Container(width: 50,height: 50,color: Colors.blue,),
               Container(width: 50,height: 50,color: Colors.red,),
                Container(width: 50,height: 50,color: Colors.green,),
             ],
           ),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Container(width: 50,height: 50,color: Colors.blue,),
               Container(width: 50,height: 50,color: Colors.red,),
                Container(width: 50,height: 50,color: Colors.green,),
             ],
           ),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Container(width: 50,height: 50,color: Colors.blue,),
               Container(width: 50,height: 50,color: Colors.red,),
                Container(width: 50,height: 50,color: Colors.green,),
             ],
           ),
                
            
             
               
          ],
        ),
        
      
    );
  }
}

