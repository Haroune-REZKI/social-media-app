import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile_dev_project/features/posts/components/feed_post.dart';
import 'package:mobile_dev_project/features/profile/controller/get_fav_posts.dart';
import 'package:mobile_dev_project/utils/components/custom_circular_progress_indicator.dart';

class FavPostsListing extends StatelessWidget {
  FavPostsListing({super.key});

  final FavPostsController postsController =
      Get.put(FavPostsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: postsController.obx(
        (state) => ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            if (index < (state?.posts.length ?? 0)) {
              return FeedPost(
                postContent: state!.posts[index],
                isSinglePostView: false,
              );
            }

            return null;
          },
        ),
        onEmpty: Padding(
          padding: EdgeInsets.symmetric(vertical: context.height * 0.3),
          child: const Center(child: Text("Data is Empty")),
        ),
        onError: (e) => Padding(
          padding: EdgeInsets.symmetric(
              vertical: context.height * 0.3, horizontal: 20),
          child: Center(
            child: Text(
              "$e",
              textAlign: TextAlign.center,
            ),
          ),
        ),
        onLoading: const CustomCircularProgressIndicator(),
      ),
    );
  }
}
