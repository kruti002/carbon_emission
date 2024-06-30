import 'package:carbon/constants.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildTopThree(),
          Expanded(child: _buildLeaderList()),
          //     _buildCurrentUserRank(),
        ],
      ),
    );
  }

  Widget _buildTopThree() {
    return Container(
      height: 220,
      padding: EdgeInsets.symmetric(horizontal: 16),
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
        SizedBox(height: 8),
        Text(
          '#$rank',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(
          user.name,
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text('${user.score} pts'),
      ],
    );
  }

  Widget _buildLeaderList() {
    return ListView.builder(
      itemCount: 22, // Showing ranks 4-25
      itemBuilder: (context, index) {
        final user = topUsers[index + 3];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(user.avatarUrl),
          ),
          title: Text(user.name),
          subtitle: Text('${user.score} pts'),
          trailing: Text('#${index + 4}'),
        );
      },
    );
  }

  Widget _buildCurrentUserRank() {
    int userRank =
        topUsers.indexWhere((user) => user.score < currentUser.score) + 1;
    if (userRank == 0) userRank = topUsers.length + 1;

    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.grey[200],
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(currentUser.avatarUrl),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(currentUser.name,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('${currentUser.score} pts'),
              ],
            ),
          ),
          Text('#$userRank', style: TextStyle(fontWeight: FontWeight.bold)),
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
