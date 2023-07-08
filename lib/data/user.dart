class User {
  final String username;
  final String profileImageUrl;
  final String subscribers;

  const User({
    required this.username,
    required this.profileImageUrl,
    required this.subscribers,
  });
}

const User currentUser = User(
  username: 'Kurogoma939',
  profileImageUrl:
      'https://hsjnfuqjxjqnwbvdrfhb.supabase.co/storage/v1/object/public/icons/kurogoma.png',
  subscribers: '672',
);

const User soshina = User(
  username: '粗品 Official Channel ',
  profileImageUrl:
      'https://yt3.googleusercontent.com/ytc/AOPolaQQ0NozIVWGFLx9rStJYf_a_QHXEZOQ7yPRb8nYwA=s176-c-k-c0x00ffffff-no-rj',
  subscribers: '155M',
);

const User sakanaction = User(
  username: 'サカナクション sakanaction',
  profileImageUrl:
      'https://yt3.googleusercontent.com/l--1_DfjI61nr4mDQmppOpDf2waCK-WXYF9DrwMMRmUh1lDfZGzOW0SjVYER-9rG7KVUAymK=s176-c-k-c0x00ffffff-no-rj',
  subscribers: "66.5M",
);
