import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:keep_screen_on/keep_screen_on.dart';

class PlayerScreen extends StatefulWidget {
  final String podcastUrl;
  final podcastItem;
  PlayerScreen({required this.podcastUrl, required this.podcastItem});

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late AudioPlayer _audioPlayer;
  double _playbackSpeed = 1.0;
  bool _isPlaying = true;

  @override
  void initState() {
    super.initState();
    // Keep the screen on.
    KeepScreenOn.turnOn();
    _audioPlayer = AudioPlayer();
    _initPlayer();
  }

  Future<void> _initPlayer() async {
    await _audioPlayer.setUrl(widget.podcastUrl);
    await _audioPlayer.setSpeed(_playbackSpeed);
    await _audioPlayer.play(); // Automatically start playing
    setState(() {
      _isPlaying = true;
    });
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.podcastItem.title.toString()),
        backgroundColor: Color(0xFF303030),
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(15), //apply padding to all four sides
            child: Text(removeAllHtmlTags(widget.podcastItem.title),
                style: const TextStyle(fontSize: 32)),
          ),

          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.all(15), //apply padding to all four sides
            child: Text(removeAllHtmlTags(widget.podcastItem.description),
                style: const TextStyle(fontSize: 14)),
          ),

          Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (!_isPlaying)
                    IconButton(
                      icon: const Icon(
                        Icons.play_arrow,
                        size: 32.0, // Adjust the size as needed
                        color: Colors.black, // Adjust the color as needed
                      ),
                      onPressed: () async {
                        await _audioPlayer.play();
                        setState(() {
                          _isPlaying = true;
                        });
                      },
                    ),
                  if (_isPlaying)
                    IconButton(
                      icon: const Icon(
                        Icons.pause,
                        size: 32.0, // Adjust the size as needed
                        color: Colors.black, // Adjust the color as needed
                      ),
                      onPressed: () async {
                        await _audioPlayer.pause();
                        setState(() {
                          _isPlaying = false;
                        });
                      },
                    ),
                ]),
          ),
          // Playback speed controls
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Speed: $_playbackSpeed'),
                    PopupMenuButton<double>(
                      icon: Icon(Icons.speed),
                      itemBuilder: (context) => [
                        PopupMenuItem(value: 0.5, child: Text('0.5x')),
                        PopupMenuItem(value: 1.0, child: Text('1.0x')),
                        PopupMenuItem(value: 1.5, child: Text('1.5x')),
                        PopupMenuItem(value: 2.0, child: Text('2.0x')),
                      ],
                      onSelected: (speed) async {
                        _playbackSpeed = speed;
                        await _audioPlayer.setSpeed(speed);
                        await _audioPlayer.play();
                        setState(() {
                          _playbackSpeed = speed;
                          _isPlaying = true;
                        });
                      },
                    ),
                  ]),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
