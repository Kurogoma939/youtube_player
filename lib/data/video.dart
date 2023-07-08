import 'user.dart';

class Video {
  final String id;
  final User author;
  final String title;
  final String thumbnailUrl;
  final String duration;
  final DateTime timestamp;
  final String viewCount;
  final String likes;
  final String dislikes;

  const Video({
    required this.id,
    required this.author,
    required this.title,
    required this.thumbnailUrl,
    required this.duration,
    required this.timestamp,
    required this.viewCount,
    required this.likes,
    required this.dislikes,
  });
}

final List<Video> videos = [
  Video(
    id: 'MzHZCfGQsVs',
    author: sakanaction,
    title: 'サカナクション / 月の椀　-Music Live Video-',
    thumbnailUrl:
        'https://i.ytimg.com/vi/MzHZCfGQsVs/hqdefault.jpg?sqp=-oaymwEcCNACELwBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCmfJdgpwYEq7Yl277fTlDZhS-KJg',
    duration: '4:13',
    timestamp: DateTime(2022, 3, 20),
    viewCount: '323M',
    likes: '10M',
    dislikes: '4',
  ),
  Video(
    id: '1xckOnkxILk',
    author: soshina,
    title: '2023年上半期の税金全て払えた！！！！！！！',
    thumbnailUrl:
        'https://i.ytimg.com/vi/MfHPqvT_r2M/hqdefault.jpg?sqp=-oaymwEcCNACELwBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLAqD8fT718RBXtA2V2HIQRmudNPjA',
    duration: '8:51',
    timestamp: DateTime(2022, 3, 20),
    viewCount: '15M',
    likes: '2263',
    dislikes: '4',
  ),
  Video(
    id: 'h1BhSOr193s',
    author: sakanaction,
    title:
        'サカナクション LIVE Blu-ray&DVD「SAKANAQUARIUM アダプト ONLINE」完全生産限定盤　-Digest Movie-',
    thumbnailUrl:
        'https://i.ytimg.com/vi/h1BhSOr193s/hqdefault.jpg?sqp=-oaymwEcCNACELwBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCOUswxXExIo_GEkEIxabPN23KAcQ',
    duration: '11:12',
    timestamp: DateTime(2022, 3, 20),
    viewCount: '7M',
    likes: '5M',
    dislikes: '4',
  ),
  Video(
    id: 'Sq4E8lldnOI',
    author: soshina,
    title: '今日194万負けたマイ億君の明日の七夕賞&プロキオンS予想',
    thumbnailUrl:
        'https://i.ytimg.com/an_webp/Sq4E8lldnOI/mqdefault_6s.webp?du=3000&sqp=CITqpaUG&rs=AOn4CLCL6gSahfdtAiWveLWiSzw2qxQXkA',
    duration: '8:01',
    timestamp: DateTime(2022, 3, 20),
    viewCount: '8M',
    likes: '1384',
    dislikes: '4',
  ),
];

final List<Video> suggestedVideos = [
  Video(
    id: 'LIlZCmETvsY',
    author: sakanaction,
    title: 'サカナクション / 新宝島　-Music Video-',
    thumbnailUrl:
        'https://i.ytimg.com/vi/LIlZCmETvsY/hq720.jpg?sqp=-oaymwE2CNAFEJQDSFXyq4qpAygIARUAAIhCGAFwAcABBvABAfgB_gmAAtAFigIMCAAQARhyIF4oQzAP&rs=AOn4CLBSLA5rwYaZSUmHZbhARjKIhFvDug',
    duration: '5:12',
    timestamp: DateTime(2020, 8, 22),
    viewCount: '1K',
    likes: '2K',
    dislikes: '7',
  ),
  Video(
    id: 'LIlZCmETvsY',
    author: sakanaction,
    title: 'サカナクション / 新宝島　-Music Video-',
    thumbnailUrl:
        'https://i.ytimg.com/vi/LIlZCmETvsY/hq720.jpg?sqp=-oaymwE2CNAFEJQDSFXyq4qpAygIARUAAIhCGAFwAcABBvABAfgB_gmAAtAFigIMCAAQARhyIF4oQzAP&rs=AOn4CLBSLA5rwYaZSUmHZbhARjKIhFvDug',
    duration: '5:12',
    timestamp: DateTime(2020, 8, 22),
    viewCount: '1K',
    likes: '2K',
    dislikes: '7',
  ),
  Video(
    id: 'LIlZCmETvsY',
    author: sakanaction,
    title: 'サカナクション / 新宝島　-Music Video-',
    thumbnailUrl:
        'https://i.ytimg.com/vi/LIlZCmETvsY/hq720.jpg?sqp=-oaymwE2CNAFEJQDSFXyq4qpAygIARUAAIhCGAFwAcABBvABAfgB_gmAAtAFigIMCAAQARhyIF4oQzAP&rs=AOn4CLBSLA5rwYaZSUmHZbhARjKIhFvDug',
    duration: '5:12',
    timestamp: DateTime(2020, 8, 22),
    viewCount: '1K',
    likes: '2K',
    dislikes: '7',
  ),
];
