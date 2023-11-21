import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/features/categories/handlers/classes/Category.dart';

// ignore: must_be_immutable
class CustomSilverAppBar extends StatefulWidget {
  Category pageCategory;

  CustomSilverAppBar({super.key, required this.pageCategory});

  @override
  State<CustomSilverAppBar> createState() => _CustomSilverAppBarState();
}

class _CustomSilverAppBarState extends State<CustomSilverAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back,
          color: AppColors.white,
          size: 30,
        ),
      ),
      expandedHeight: 450,
      backgroundColor: widget.pageCategory.mainColor,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            ClipRRect(
              child: Container(
                height: 450,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.pageCategory.bgImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: widget.pageCategory.bgColor,
                ),
                padding: const EdgeInsets.only(left: 20, bottom: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 320),
                        child: Text(
                          widget.pageCategory.description,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Visibility(
                      visible: !widget.pageCategory.isSubscribed,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Text(
                            "Subscribe",
                            style: TextStyle(
                              fontSize: 18,
                              color: widget.pageCategory.mainColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
