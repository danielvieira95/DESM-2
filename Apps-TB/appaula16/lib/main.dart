import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // pacote que permite a
// utilização do pacote de audio
import 'dart:async'; // pacote para classes assincronas
void main() {
  runApp(MaterialApp(
    home: Appaudio(),
  ));
}

class Appaudio extends StatefulWidget {
  const Appaudio({super.key});

  @override
  State<Appaudio> createState() => _AppaudioState();
}

class _AppaudioState extends State<Appaudio> {
  late AudioPlayer player = AudioPlayer(); // variavel para armazenar o estado do audio player
  @override //polimorfismo para reescrita de função
  // função que pré carrega as informações no app
  void initState(){
    super.initState(); // inicia o app para carregar o audio
    // cria o player de audio
    player = AudioPlayer();
    
    player.setReleaseMode(ReleaseMode.stop); // para o audio
    // carrega o app antes de iniciar o audio
     WidgetsBinding.instance.addPostFrameCallback((_) async {
      await player.setSource(UrlSource('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'));
      //await player.setSource(UrlSource('https://music.youtube.com/playlist?list=RDCLAK5uy_lJJ_tIQ2KklmnTSpQ2dWTcARr2jR6YBE4'));
      await player.resume();
      
     
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
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "App Music"),
        ),
        body: Column(

        ),
      );
    
  }
}

class PlayerWidget extends StatefulWidget {
  
  final AudioPlayer player; // variavel player
  // construtor classe player widget
  const PlayerWidget({required this.player,super.key});

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
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

   @override
  void dispose() {
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerStateChangeSubscription?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}