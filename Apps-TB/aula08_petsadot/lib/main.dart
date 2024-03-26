import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // biblioteca para requisições http.get
import 'dart:convert'; // biblioteca para conversao de json
void main() {
  runApp(Home());

}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Pets", // o campo title do Material app é do tipo String
      // Então nao precisa do Text como no Scaffold
      home: PetsScreen(), // classe que constroi a tela do aplicativo
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
    );
  }
}

class PetsScreen extends StatefulWidget {
  const PetsScreen({super.key});

  @override
  State<PetsScreen> createState() => _PetsScreenState();
}

class _PetsScreenState extends State<PetsScreen> {
  late Future<List<Pet>> futurePet; // late controla o estado futuro dos dados a partir da api
void initState() {
    // TODO: implement initState
    super.initState();
    futurePet = consultaPet(); // variavel para armazenar os dados vindos da api
  }
  // Função do tipo Future que vai receber atualização de dados a partir da api
   Future<List<Pet>> consultaPet() async{
   final response = await http.get(Uri.parse('https://raw.githubusercontent.com/giovannamoeller/pets-api/main/db.json'));
   print(response.body);
   
   if(response.statusCode == 200)
   {
        final parsed = jsonDecode(response.body);
        print(parsed); // realiza o parse do json da api
        
        List<dynamic> petjson = parsed(['pets']);
        return petjson.map((json)=> Pet.fromJson(json)).toList();
        
   }
   else{
    print(response.statusCode);
    throw Exception("Falha ao consumir api");
   }
   

  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Pet"),
      ),
      body: Center(
        child: FutureBuilder<List<Pet>>(
          future: futurePet,
          builder: (context,snapshot){
           if(snapshot.hasData){
            return ListView.builder(
              itemBuilder: (context,index){
              return PetListItem(pet:snapshot.data![index]);
              });
           }else if(snapshot.hasError){
            return Text("${snapshot.error}");
           }
           return CircularProgressIndicator();
          },

            

      ),
    ));
  }
}

class Pet{
  // Variaveis para consumir os dados da api
  final String nome; 
  final String imageurl;
  final String idade;
  final String comportamento;
  final String porte;
  final String location;
  final String tel;

  // Criar construtor
  Pet({required this.nome,required this.imageurl, required this.idade,
   required this.comportamento, required this.porte, required this.location, 
   required this.tel} );

   // funçao para separar os dados da api em cada campo da classe
   factory Pet.fromJson(Map<String, dynamic> json){
    return Pet(
      nome: json['name'], 
      imageurl: json['imageUrl'], 
      idade: json['age'],
       comportamento: json['behavior'], 
       porte: json['size'], 
       location: json['location'],
        tel: json['phoneNumber']);
   }

}

class PetListItem extends StatelessWidget {
  final Pet pet ; //variavel do tipo pet 
  // construtor da classe pet
  const PetListItem({Key? key, required this.pet}):super(key:key);

  @override
  Widget build(BuildContext context) {
    // ListTile lista de elementos
    return ListTile(
    leading: CircleAvatar(
      backgroundImage: NetworkImage(pet.imageurl),
    ),
    title: Text(pet.nome),
    subtitle: Text("${pet.idade}, ${pet.comportamento},${pet.porte}, ${pet.location}"),
    // on tap transforma qualquer parte do app em botao
    onTap: (){
      // implementa ação quando clicar no pet
      showDialog(
        context: context,
         builder: (BuildContext context) {
           return AlertDialog(
            title: Text(pet.nome),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Image.network(pet.imageurl),
                  Text('Idade: ${pet.idade}'),
                  Text('Comportamento: ${pet.comportamento}'),
                  Text('Porte: ${pet.porte}'),
                  Text('Localizaçao: ${pet.location}'),
                  Text('Telefone: ${pet.tel}'),
                ],

              ),
            ),
            actions: [
              TextButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: Text("Close"))
            ],

           );
         },);
         
         

    
    
  });
  
  }
}
