import 'package:iSikhi/player_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';
// import 'package:flutter_html/flutter_html.dart';

class PodcastScreen extends StatefulWidget {
  const PodcastScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PodcastScreenState createState() => _PodcastScreenState();
}

class _PodcastScreenState extends State<PodcastScreen> {
  List<RssItem>? podcastItems;

  @override
  void initState() {
    super.initState();
    fetchPodcastData();
  }

  Future<void> fetchPodcastData() async {
    var url = Uri.https('cogsight.com', '/@Gurbaani/feed.xml', {'q': '{http}'});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final feed = RssFeed.parse(response.body);
      setState(() {
        podcastItems = feed.items;
      });
    } else {
      throw Exception('Failed to load podcast feed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listen Gurbaani'),
        backgroundColor: Color(0xFF303030),
        foregroundColor: Colors.white,
      ),
      body: podcastItems != null
          ? ListView.builder(
              itemCount: podcastItems!.length,
              itemBuilder: (context, index) {
                final podcastItem = podcastItems![index];
                return ListTile(
                  title: Text(podcastItem.title ?? ''),
                  subtitle: const Text(''),
                  onTap: () {
                    // Navigate to the player screen with the selected podcast URL
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlayerScreen(
                            podcastUrl: podcastItem.enclosure?.url ?? '',
                            podcastItem: podcastItem),
                      ),
                    );
                  },
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
