import 'package:app_aula14_2/data/userdao.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nome = TextEditingController();
  TextEditingController idade = TextEditingController();
  TextEditingController hobbie = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App com banco de dados"),
      ),
      body: Column(
        children: [
          Text("App banco de dados"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.name,
              controller: nome,
              decoration: InputDecoration(hintText: "Digite seu nome"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: idade,
              decoration: InputDecoration(hintText: "Digite sua idade"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.name,
              controller: hobbie,
              decoration: InputDecoration(hintText: "Digite seu hobbie"),
            ),
          ),
          ElevatedButton(onPressed: (){
            Map<String, dynamic> dados = {
                  "id": 0,
                  "nome": nome,
                  "idade": idade,
                  "hobbie": hobbie
                };
                print("${nome.text} ${idade.text} ${hobbie.text}");
                UsersDao().salvar(Users('0', nome.text, idade.text, hobbie.text));
          }, child: Text('Salvar')),
        ],
      ),

    );
  }
}



class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  static Database? _db;

  DatabaseHelper.internal();

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  Future<Database> initDb() async {
    var directory = await getDatabasesPath();
    var path = join(directory, "my_database.db");
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE Person(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)");
  }

  Future<int> savePerson(Map<String, dynamic> person) async {
    var dbClient = await db;
    int res = await dbClient!.insert("Person", person);
    return res;
  }

  Future<List<Map<String, dynamic>>> getPersons() async {
    var dbClient = await db;
    List<Map<String, dynamic>> list = await dbClient!.query("Person");
    return list;
  }
}
