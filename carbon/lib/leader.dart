import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  final List<User> topUsers = List.generate(
    25,
    (index) => User(
      name: 'User ${index + 1}',
      score: 1000 - (index * 10),
      avatarUrl: 'https://picsum.photos/200?random=$index',
    ),
  );

  final User currentUser = User(
    name: 'You',
    score: 700,
    avatarUrl: 'https://picsum.photos/200?random=99',
  );

  LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/background.jpg',
                fit: BoxFit.cover,
              )),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              _buildTopThree(),
              Expanded(child: _buildLeaderList()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTopThree() {
    return Container(
      height: 220,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: _buildTopUserAvatar(topUsers[1], 2, 100),
          ),
          Positioned(
            bottom: 20,
            child: _buildTopUserAvatar(topUsers[0], 1, 120),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: _buildTopUserAvatar(topUsers[2], 3, 100),
          ),
        ],
      ),
    );
  }

  Widget _buildTopUserAvatar(User user, int rank, double size) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: size / 2,
          backgroundImage: NetworkImage(user.avatarUrl),
        ),
        const SizedBox(height: 8),
        Text(
          '#$rank',
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ),
        Text(
          user.name,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        Text(
          '${user.score} pts',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildLeaderList() {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 22, 
        itemBuilder: (context, index) {
          final user = topUsers[index + 3];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.avatarUrl),
            ),
            title: Text(
              user.name,
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              '${user.score} pts',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Text(
              '#${index + 4}',
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCurrentUserRank() {
    int userRank =
        topUsers.indexWhere((user) => user.score < currentUser.score) + 1;
    if (userRank == 0) userRank = topUsers.length + 1;

    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.grey[200],
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(currentUser.avatarUrl),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(currentUser.name,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('${currentUser.score} pts'),
              ],
            ),
          ),
          Text('#$userRank',
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class User {
  final String name;
  final int score;
  final String avatarUrl;

  User({required this.name, required this.score, required this.avatarUrl});
}
