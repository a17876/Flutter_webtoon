import 'package:flutter/material.dart';
import 'package:new_webtoon/services/api_service.dart';

import '../models/webtoon_detail_model.dart';
import '../models/webtoon_episode_model.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2, // appBar의 음영
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: widget.id,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  width: 250,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        offset: const Offset(10, 10),
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                  ),
                  child: Image.network(
                    widget.thumb,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
