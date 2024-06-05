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
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "App Music"),
        ),
        body: Column(
          children: [
            PlayerWidget(player: player),
          ],

        ),
      );
    
  }
}

class PlayerWidget extends StatefulWidget {
  
  final AudioPlayer player; // variavel player
  // construtor classe player widget
  const PlayerWidget({required this.player,super.key});

  @override
  State<PlayerWidget> createState () => _PlayerWidgetState();
  
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
    final color = Theme.of(context).primaryColor;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              key: const Key('play_button'),
              onPressed: _isPlaying ? null : _play,
              iconSize: 48.0,
              icon: const Icon(Icons.play_arrow),
              color: color,
            ),
            IconButton(
              key: const Key('pause_button'),
              onPressed: _isPlaying ? _pause : null,
              iconSize: 48.0,
              icon: const Icon(Icons.pause),
              color: color,
            ),
            IconButton(
              key: const Key('stop_button'),
              onPressed: _isPlaying || _isPaused ? _stop : null,
              iconSize: 48.0,
              icon: const Icon(Icons.stop),
              color: color,
            ),
          ],
        ),
        Slider(
          onChanged: (value) {
            final duration = _duration;
            if (duration == null) {
              return;
            }
            final position = value * duration.inMilliseconds;
            player.seek(Duration(milliseconds: position.round()));
          },
          value: (_position != null &&
                  _duration != null &&
                  _position!.inMilliseconds > 0 &&
                  _position!.inMilliseconds < _duration!.inMilliseconds)
              ? _position!.inMilliseconds / _duration!.inMilliseconds
              : 0.0,
        ),
        Text(
          _position != null
              ? '$_positionText / $_durationText'
              : _duration != null
                  ? _durationText
                  : '',
          style: const TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
    void _initStreams() {
    _durationSubscription = player.onDurationChanged.listen((duration) {
      setState(() => _duration = duration);
    });

    _positionSubscription = player.onPositionChanged.listen(
      (p) => setState(() => _position = p),
    );

    _playerCompleteSubscription = player.onPlayerComplete.listen((event) {
      setState(() {
        _playerState = PlayerState.stopped;
        _position = Duration.zero;
      });
    });

    _playerStateChangeSubscription =
        player.onPlayerStateChanged.listen((state) {
      setState(() {
        _playerState = state;
      });
    });
  }

  Future<void> _play() async {
    await player.resume();
    setState(() => _playerState = PlayerState.playing);
  }

  Future<void> _pause() async {
    await player.pause();
    setState(() => _playerState = PlayerState.paused);
  }

  Future<void> _stop() async {
    await player.stop();
    setState(() {
      _playerState = PlayerState.stopped;
      _position = Duration.zero;
    });
  }
}
 