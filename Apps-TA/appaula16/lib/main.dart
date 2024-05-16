import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // pacote que permite a utilização
// do pacote de audio
import 'dart:async'; // pacote para dados assincronos 
void main() {
  runApp(MaterialApp(
    home:  Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late AudioPlayer player = AudioPlayer(); // variavel que armazena o objeto audio player
  @override
  void initState(){
    super.initState();
    player = AudioPlayer(); // armazena em player o objeto audio 
     player.setReleaseMode(ReleaseMode.stop); // para o audio
    // carrega o app antes de iniciar o audio
     WidgetsBinding.instance.addPostFrameCallback((_) async {
      await player.resume();
      await player.setSource(UrlSource('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'));
      //await player.setSource(UrlSource('https://music.youtube.com/playlist?list=RDCLAK5uy_lJJ_tIQ2KklmnTSpQ2dWTcARr2jR6YBE4'));
     // await player.setSourceAsset(path); pegar audio do diretorio do projeto
      
     
    });

  }
   @override
   // função para limpar o player
  void dispose() {
    // Release all sources and dispose the player.
    player.dispose();    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('App bar'),
    ),
    body: Column(
      children: [

      ],
    ),
    );
  }
}

class PlayerWidget extends StatefulWidget{
   final AudioPlayer player; // variavel player
  // construtor classe player widget
  const PlayerWidget({required this.player,super.key}); // construtor 

  @override
  State<PlayerWidget> createState () => _PlayerWidgetState();
}
  class _PlayerWidgetState extends State<PlayerWidget>{
     PlayerState? _playerState;
  Duration? _duration;
  Duration? _position;

  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playerCompleteSubscription;
  StreamSubscription? _playerStateChangeSubscription;
  // funções para o audio player
   bool get _isPlaying => _playerState == PlayerState.playing;

  bool get _isPaused => _playerState == PlayerState.paused;

  String get _durationText => _duration?.toString().split('.').first ?? '';

  String get _positionText => _position?.toString().split('.').first ?? '';

  AudioPlayer get player => widget.player;

   @override
  void initState() {
    super.initState();
    // Use initial values from player
    _playerState = player.state;
    player.getDuration().then(
          (value) => setState(() {
            _duration = value;
          }),
        );
    player.getCurrentPosition().then(
          (value) => setState(() {
            _position = value;
          }),
        );
    _initStreams();
  }
   @override
  void setState(VoidCallback fn) {
    // Subscriptions only can be closed asynchronously,
    // therefore events can occur after widget has been disposed.
    if (mounted) {
      super.setState(fn);
    }
  }


  }
  


