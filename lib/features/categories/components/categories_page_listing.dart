import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_dev_project/features/categories/controllers/list_of_posts_by_category.dart';
import 'package:mobile_dev_project/features/posts/components/feed_post.dart';
import 'package:mobile_dev_project/utils/components/custom_circular_progress_indicator.dart';

class CategoriesPageListing extends StatelessWidget {
  final int categoryId;

  final ListOfPostsByCategoryController postsController =
      Get.put(ListOfPostsByCategoryController());

  CategoriesPageListing({super.key, required this.categoryId}) {
    postsController.setCategoryId(categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return postsController.obx(
      (state) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            if (index < (state?.posts.length ?? 0)) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 10,
                ),
                child: FeedPost(
                  postContent: state!.posts[index],
                  isSinglePostView: false,
                ),
              );
            }
            return null;
          },
        ),
      ),
      onEmpty: SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: context.height * 0.3),
          child: const Center(child: Text("Data is Empty")),
        ),
      ),
      onError: (e) => SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.height * 0.3,
            horizontal: 20,
          ),
          child: Center(
            child: Text(
              "$e",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      onLoading:
          const SliverToBoxAdapter(child: CustomCircularProgressIndicator()),
    );
  }
}
