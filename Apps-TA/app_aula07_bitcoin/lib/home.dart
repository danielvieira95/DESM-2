import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    _converter(){
     if(selectop ==0 && selectop1 ==1)
        {  setState(() {
            vdolar = double.parse(valor.text); 
        });
            
        }
          else if(selectop ==0 && selectop1 ==3)
        {
           setState(() {
             vdolar = double.parse(valor.text) /5.01; 
           });
            
        }  
        else if(selectop ==0 && selectop1 ==5)
        {
           setState(() {
             vdolar = double.parse(valor.text)/5.45;
           });
             
        } 
         else if(selectop ==2 && selectop1 ==1)
        {
           setState(() {
             vdolar = double.parse(valor.text)*5.01;
           });
             
        } 
         else if(selectop ==2 && selectop1 ==3)
        {
           setState(() {
             vdolar = double.parse(valor.text);
           });
             
        } 
        else if(selectop ==2 && selectop1 ==5)
        {
           setState(() {
             vdolar = double.parse(valor.text)*0.92;
           });
             
        } 
        else if(selectop ==3 && selectop1 ==1)
        {
           setState(() {
             vdolar = double.parse(valor.text)*0.18;
           });
             
        } 
        else if(selectop ==4 && selectop1 ==3)
        {
           setState(() {
             vdolar = double.parse(valor.text)*0.91;
           });
             
        } 
         else if(selectop ==4 && selectop1 ==5)
        {
           setState(() {
             vdolar = double.parse(valor.text);
           });
             
        } 
        else if(selectop ==4 && selectop1 ==1)
        {
           setState(() {
             vdolar = double.parse(valor.text)*5.45;
           });
             
        } 


        
    }
    _limpar(){
      setState(() {
        vdolar = 0;  
        valor.text = "";   
        
      });
    }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App consulta preço BitCoin"),
     
      ),
      body: 
         ListView(
          
          scrollDirection:Axis.vertical,
          children: [
            Container(width: 250,height: 150,color: Colors.amber,child: Image.asset('imagens/bitcoin.png'),),
           Padding(
             padding: const EdgeInsets.all(50.0),
             child: Text("Valor BitCoin R\$: $preco ",style: TextStyle(fontSize: 20),),
           ),
           
           TextField(
           keyboardType: TextInputType.number,
           decoration:  InputDecoration(labelText: "Digite o valor a ser convertido"),
           controller: valor,
           ),
           
           
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Origem",style: TextStyle(fontSize: 15),),
              
              
              Text("Destino",style: TextStyle(fontSize: 15),),
            ],
           ),
           Container(color: Colors.white,width: 450,height: 150,
           child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Radio(                
                          value: 0,
                           groupValue: selectop, 
                           onChanged: (value){
                            setState(() {
                              selectop = value;
                            });
                           }),
                           Text("R\$"),
                           Radio(                
                          value: 1,
                           groupValue: selectop1, 
                           onChanged: (value){
                            setState(() {
                              selectop1 = value;
                            });
                           }),
                           Text("R\$"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Radio(                
                          value: 2,
                           groupValue: selectop, 
                           onChanged: (value){
                            setState(() {
                              selectop = value;
                            });
                           }),
                           Text("Dólar"),
                           Radio(                
                          value: 3,
                           groupValue: selectop1, 
                           onChanged: (value){
                            setState(() {
                              selectop1 = value;
                            });
                           }),
                           Text("Dólar"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Radio(                
                          value: 4,
                           groupValue: selectop, 
                           onChanged: (value){
                            setState(() {
                              selectop = value;
                            });
                           }),
                           Text("Euro"),
                           Radio(                
                          value: 5,
                           groupValue: selectop1, 
                           onChanged: (value){
                            setState(() {
                              selectop1 = value;
                            });
                           }),
                           Text("Euro"),
                ],
              )
            ],
              
           ),),
          
                           
           
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 50),
             child: Text("Valor a ser convertido ${valor.text}",style: TextStyle(fontSize: 20),),
           ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:50 ),
              child: Text("Valor convertido  \$ ${vdolar.toStringAsFixed(2)}",style: TextStyle(fontSize: 20),),
            ),
            
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
            ElevatedButton(onPressed: _consultaBitCoin, child: Text("Verificar")),
           ElevatedButton(onPressed: _converter, child: Text("Calcular")),
           ElevatedButton(onPressed: _limpar, child: Text("limpar")),
            
            ],
           ),
           
            
            
                     
                    
               
                 
                   
         
             
           
          //Text("Opção: $selectop"),
           // Text("Opção: $selectop1"),
          ]),
          );
        
        
  
  }
}

