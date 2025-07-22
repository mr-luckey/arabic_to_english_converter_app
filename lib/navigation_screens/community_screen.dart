import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  _ForumScreenState createState() => _ForumScreenState();
}

class _ForumScreenState extends State<CommunityScreen> {
  final List<Post> _posts = [];

  // Default posts related to English learning
  List<Post> defaultPosts = [
    Post(
      title: 'Tips for Improving Your Vocabulary',
      content:
          'To expand your vocabulary, read widely, practice new words, and use them in conversation.',
      likes: 10,
      comments: ['Very helpful!', 'Thanks for the tips!'],
    ),
    Post(
      title: 'Understanding English Grammar',
      content:
          'Grammar is the backbone of any language. Focus on mastering the basics of tenses and sentence structure.',
      likes: 7,
      comments: ['Grammar can be tricky!', 'I struggle with tenses.'],
    ),
    Post(
      title: 'Effective Listening Strategies',
      content:
          'Listening to native speakers, watching movies, and using listening exercises can improve your comprehension.',
      likes: 5,
      comments: ['Great advice!', 'I love watching English movies!'],
    ),
    Post(
      title: 'Practice Speaking English Daily',
      content:
          'Engage in conversations with friends or join language exchange programs to enhance your speaking skills.',
      likes: 8,
      comments: ['I need to practice more!', 'Language exchanges are fun!'],
    ),
    Post(
      title: 'Common English Idioms',
      content:
          'Understanding idioms can help you sound more natural. For example, "break the ice" means to initiate conversation.',
      likes: 6,
      comments: ['Idioms are interesting!', 'I love learning idioms!'],
    ),
    Post(
      title: 'Writing in English',
      content:
          'To improve writing skills, practice journaling, use prompts, and seek feedback from others.',
      likes: 4,
      comments: [
        'Writing is a challenge for me.',
        'Thanks for the suggestion!'
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    final prefs = await SharedPreferences.getInstance();
    final String? postsJson = prefs.getString('posts');

    if (postsJson != null) {
      List<dynamic> jsonList = json.decode(postsJson);
      List<Post> loadedPosts =
          jsonList.map((json) => Post.fromJson(json)).toList();

      setState(() {
        _posts.addAll(defaultPosts); // Add default posts first
        _posts.addAll(loadedPosts); // Then add loaded posts
      });
    } else {
      setState(() {
        _posts.addAll(defaultPosts); // Load default posts if no saved posts
      });
      _savePosts(); // Save default posts for future app launches
    }
  }

  Future<void> _savePosts() async {
    final prefs = await SharedPreferences.getInstance();
    final String postsJson =
        json.encode(_posts.map((post) => post.toJson()).toList());
    await prefs.setString('posts', postsJson);
  }

  void _addPost(String title, String content) {
    final newPost = Post(title: title, content: content);
    setState(() {
      _posts.add(newPost); // Append the new post
    });
    _savePosts();
  }

  void _likePost(int index) {
    setState(() {
      if (!_posts[index].hasLiked) {
        _posts[index].likes++;
        _posts[index].hasLiked = true;
        if (_posts[index].hasDisliked) {
          _posts[index].dislikes--;
          _posts[index].hasDisliked = false;
        }
      }
    });
    _savePosts();
  }

  void _dislikePost(int index) {
    setState(() {
      if (!_posts[index].hasDisliked) {
        _posts[index].dislikes++;
        _posts[index].hasDisliked = true;
        if (_posts[index].hasLiked) {
          _posts[index].likes--;
          _posts[index].hasLiked = false;
        }
      }
    });
    _savePosts();
  }

  void _addComment(int index, String comment) {
    setState(() {
      _posts[index].comments.add(comment);
    });
    _savePosts();
  }

  void _deletePost(int index) {
    setState(() {
      _posts.removeAt(index);
    });
    _savePosts();
  }

  void _openAddPostDialog() {
    showDialog(
      context: context,
      builder: (ctx) {
        String title = '';
        String content = '';
        return AlertDialog(
          title:  Text('Add New Post'.tr()),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration:  InputDecoration(labelText: 'Title'.tr()),
                onChanged: (value) {
                  title = value;
                },
              ),
              TextField(
                decoration:  InputDecoration(labelText: 'Content'.tr()),
                onChanged: (value) {
                  content = value;
                },
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (title.isNotEmpty && content.isNotEmpty) {
                  _addPost(title, content);
                  Navigator.of(ctx).pop();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
              ),
              child:  Text(
                'Add'.tr(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title:  Text('Delete Post'.tr()),
          content: const Text('Are you sure you want to delete this post?'),
          actions: [
            TextButton(
              onPressed: () {
                _deletePost(index);
                Navigator.of(ctx).pop();
              },
              child:  Text(
                'Delete'.tr(),
                style: const TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child:  Text(
                'Cancel'.tr(),
                style: const TextStyle(color: Colors.blue),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child:  Text('Community Forum'.tr(),style: const TextStyle(fontSize: 18),).tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onLongPress: () => _showDeleteConfirmationDialog(index),
                  child: Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text(
                              _posts[index].title,
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight:
                                      FontWeight.bold), // Increased title size
                            ),
                            subtitle: Text(
                              _posts[index].content,
                              style: const TextStyle(
                                  fontSize: 18), // Increased content size
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.thumb_up),
                                    color: _posts[index].hasLiked
                                        ? Colors.blue
                                        : null,
                                    onPressed: () => _likePost(index),
                                  ),
                                  Text('${_posts[index].likes}'),
                                  const SizedBox(width: 10),
                                  IconButton(
                                    icon: const Icon(Icons.thumb_down),
                                    color: _posts[index].hasDisliked
                                        ? Colors.red
                                        : null,
                                    onPressed: () => _dislikePost(index),
                                  ),
                                  Text('${_posts[index].dislikes}'),
                                ],
                              ),
                              IconButton(
                                icon: const Icon(Icons.comment),
                                onPressed: () {
                                  String comment = '';
                                  showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return AlertDialog(
                                        title:  Text('Add Comment'.tr()),
                                        content: TextField(
                                          onChanged: (value) {
                                            comment = value;
                                          },
                                          decoration:  InputDecoration(
                                              labelText: 'Comment'.tr()),
                                        ),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () {
                                              if (comment.isNotEmpty) {
                                                _addComment(index, comment);
                                                Navigator.of(ctx).pop();
                                              }
                                            },
                                            child:  Text('Add'.tr()),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          const Divider(),
                           Text(
                            'Comments:'.tr(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(height: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _posts[index]
                                .comments
                                .map((comment) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(comment),
                                        const Divider(), // Line separator between comments
                                      ],
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: FloatingActionButton(
                onPressed: _openAddPostDialog,
                backgroundColor: Colors.cyan,
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Post {
  String title;
  String content;
  int likes;
  int dislikes;
  bool hasLiked = false;
  bool hasDisliked = false;
  List<String> comments;

  Post({
    required this.title,
    required this.content,
    this.likes = 0,
    this.dislikes = 0,
    List<String>? comments,
  }) : comments = comments ?? [];

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'likes': likes,
        'dislikes': dislikes,
        'hasLiked': hasLiked,
        'hasDisliked': hasDisliked,
        'comments': comments,
      };

  factory Post.fromJson(Map<String, dynamic> json) {
    final post = Post(
      title: json['title'],
      content: json['content'],
      likes: json['likes'],
      dislikes: json['dislikes'],
      comments: List<String>.from(json['comments']),
    );
    post.hasLiked = json['hasLiked'];
    post.hasDisliked = json['hasDisliked'];
    return post;
  }
}
