import 'package:flutter/material.dart';
import 'package:mobile_dev_project/features/posts/business/entities/post.dart';
import 'package:mobile_dev_project/features/posts/components/feed_post_content.dart';
import 'package:mobile_dev_project/features/posts/components/feed_post_footer.dart';
import 'package:mobile_dev_project/features/posts/components/post_header.dart';
import 'package:mobile_dev_project/features/posts/views/single_post.dart';

class FeedPost extends StatefulWidget {
  final Post postContent;
  final bool isSinglePostView;

  const FeedPost(
      {super.key, required this.postContent, required this.isSinglePostView});

  @override
  State<FeedPost> createState() => _FeedPostState();
}

class _FeedPostState extends State<FeedPost> {
  void _handleNavigation() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SinglePost(postId: widget.postContent.id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, left: 5, right: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        children: [
          PostHeader(
            fullName: widget.postContent.author.fullname,
            userName: widget.postContent.author.username,
            avatar:
                "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg",
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: _handleNavigation,
            child: PostContent(
              content: widget.postContent.content,
              hasImage: false,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          PostFooter(
            likes: widget.postContent.numberOfLikes,
            isLiked: widget.postContent.hasLiked,
            comments: widget.postContent.comments.length,
            hasBookmarked: false,
            timestamps: widget.postContent.createdAt,
            isSinglePostView: widget.isSinglePostView,
          )
        ],
      ),
    );
  }
}
