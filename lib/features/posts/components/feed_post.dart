import 'package:flutter/material.dart';
import 'package:mobile_dev_project/features/posts/components/feed_post_content.dart';
import 'package:mobile_dev_project/features/posts/components/feed_post_footer.dart';
import 'package:mobile_dev_project/features/posts/components/post_header.dart';
import 'package:mobile_dev_project/features/posts/handlers/classes/post.dart';
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
            fullName: widget.postContent.fullname,
            userName: widget.postContent.username,
            avatar: widget.postContent.avatar,
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: _handleNavigation,
            child: PostContent(
              content: widget.postContent.content,
              hasImage: widget.postContent.hasImage,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          PostFooter(
            likes: widget.postContent.likes,
            isLiked: widget.postContent.isLiked,
            comments: widget.postContent.comments,
            hasBookmarked: widget.postContent.hasBookmarked,
            timestamps: widget.postContent.timestamps,
            isSinglePostView: widget.isSinglePostView,
          )
        ],
      ),
    );
  }
}
