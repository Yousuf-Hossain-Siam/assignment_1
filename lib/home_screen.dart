import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'post_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              postProvider.fetchPosts();
            },
            child: Text('Fetch Posts'),
          ),
          if (postProvider.isLoading)
            Center(child: CircularProgressIndicator())
          else if (postProvider.errorMessage.isNotEmpty)
            Center(child: Text(postProvider.errorMessage))
          else if (postProvider.posts.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: postProvider.posts.length,
                itemBuilder: (context, index) {
                  final post = postProvider.posts[index];
                  return ListTile(
                    title: Text(post['title']),
                    subtitle: Text(post['body']),
                  );
                },
              ),
            )
          else
            Center(child: Text('No data available')),
        ],
      ),
    );
  }
}
