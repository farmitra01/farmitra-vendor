import 'package:carousel_slider/carousel_slider.dart';
import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/modules/home/controllers/feed_controller.dart';
import 'package:farmitra/app/modules/home/views/add_post.dart';
import 'package:farmitra/app/utils/global_widgets/custom_text_form_field.dart';
import 'package:farmitra/app/utils/global_widgets/vendor_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    final FeedController feedController = Get.put(FeedController());
    return Scaffold(
      appBar: VendorAppBar(title: 'Feed'),
      body: SingleChildScrollView(
        // Wrap the entire body in SingleChildScrollView
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: CustomTextFormField(
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.primaryGradinatMixColor,
                ),
                hintText: 'Search in Feed',
                keyboardType: TextInputType.text,
                controller: feedController.search,
                validator: (p0) {},
                suffixWidget: Icon(
                  Icons.mic,
                  color: AppColors.primaryGradinatMixColor,
                ),
              ),
            ),
            TabBar(
              dividerColor: AppColors.secondary,
              indicatorColor: AppColors.primaryGradinatMixColor,
              indicatorWeight: 4.0,
              labelColor: AppColors.primaryGradinatMixColor,
              controller: feedController.tabController,
              labelStyle: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              tabs: [
                Tab(text: 'Posts'),
                Tab(text: 'Videos'),
                Tab(text: 'NEWS'),
              ],
            ),
            SizedBox(
              height:
                  MediaQuery.of(context).size.height *
                  0.7, // Set a fixed height for TabBarView
              child: TabBarView(
                controller: feedController.tabController,
                children: [buildScrollablePosts(), buildVideo(), buildNews()],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddPost());
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primaryGradinatMixColor,
          ),
          child: Center(
            child: Icon(Icons.message_rounded, color: AppColors.white),
          ),
        ),
      ),
    );
  }
}

Widget buildScrollablePosts() {
  return SingleChildScrollView(
    child: Column(
      children: List.generate(5, (index) => buildPost()), // Example: 5 posts
    ),
  );
}

Widget buildPost() {
  final FeedController feedController = Get.put(FeedController());
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: AppColors.white,
      boxShadow: [
        BoxShadow(
          blurRadius: 2.5,
          color: AppColors.containerShadowColor,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      children: [
        SizedBox(height: 10),
        Row(
          children: [
            SizedBox(width: 10),
            CircleAvatar(
              backgroundColor: AppColors.primaryGradinatMixColor,
              radius: 25,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Farmitra',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
                      'follow',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.green,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Noida Uttar Pradesh',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  '01 Apr 2025 12:09AM',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            Spacer(),
            PopupMenuButton<String>(
              icon: Icon(Icons.more_vert),
              onSelected: (value) {
                switch (value) {
                  case 'Unfollow':
                    // Handle Unfollow action
                    print('Unfollow tapped');
                    break;
                  case 'Block':
                    // Handle Block action
                    print('Block tapped');
                    break;
                  case 'Report':
                    // Handle Report action
                    print('Report tapped');
                    break;
                }
              },
              itemBuilder:
                  (BuildContext context) => [
                    PopupMenuItem<String>(
                      value: 'Unfollow',
                      child: Text('Unfollow'),
                    ),
                    PopupMenuItem<String>(value: 'Block', child: Text('Block')),
                    PopupMenuItem<String>(
                      value: 'Report',
                      child: Text('Report'),
                    ),
                  ],
            ),
          ],
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 30,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.yellow.withOpacity(0.2),
                ),
                child: Text(
                  'Weather',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.yellow,
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10),
        InteractiveViewer(
          panEnabled: true,
          minScale: 1.0,
          maxScale: 4.0,
          child: Image.asset('assets/images/farmingImage.jpg'),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'To Export My corn out of India. How Can I grow faster and export quality?',
            style: GoogleFonts.montserrat(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 35,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: feedController.action.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  switch (index) {
                    case 0:
                      _showBottomSheet(context, _buildLikeSheet());
                      break;
                    case 1:
                      _showBottomSheet(context, _buildCommentSheet());
                      break;
                    default:
                      break;
                  }
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Icon(
                          feedController.action[index]['icon'],
                          color: AppColors.secondary,
                        ),
                        SizedBox(width: 5), // Space between icon and text
                        Text(feedController.action[index]['count']),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget buildVideo() {
  final FeedController feedController = Get.put(FeedController());
  return SingleChildScrollView(
    child: Column(
      children: List.generate(feedController.youtubeVideoUrls.length, (index) {
        // Extract video ID from URL
        String? videoId = YoutubePlayer.convertUrlToId(
          feedController.youtubeVideoUrls[index],
        );
        if (videoId == null) return SizedBox.shrink(); // Handle invalid URL

        // Create a YoutubePlayerController for each video
        YoutubePlayerController controller = YoutubePlayerController(
          initialVideoId: videoId,
          flags: YoutubePlayerFlags(
            autoPlay:
                false, // Set to true if you want videos to play automatically
            mute: false,
          ),
        );

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 2.5,
                color: AppColors.containerShadowColor,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: AppColors.primaryGradinatMixColor,
                    radius: 25,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Farmitra',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            'follow',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.green,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Noida Uttar Pradesh',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        '01 Apr 2025 12:09AM',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  PopupMenuButton<String>(
                    icon: Icon(Icons.more_vert),
                    onSelected: (value) {
                      switch (value) {
                        case 'Unfollow':
                          // Handle Unfollow action
                          print('Unfollow tapped');
                          break;
                        case 'Block':
                          // Handle Block action
                          print('Block tapped');
                          break;
                        case 'Report':
                          // Handle Report action
                          print('Report tapped');
                          break;
                      }
                    },
                    itemBuilder:
                        (BuildContext context) => [
                          PopupMenuItem<String>(
                            value: 'Unfollow',
                            child: Text('Unfollow'),
                          ),
                          PopupMenuItem<String>(
                            value: 'Block',
                            child: Text('Block'),
                          ),
                          PopupMenuItem<String>(
                            value: 'Report',
                            child: Text('Report'),
                          ),
                        ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              YoutubePlayer(
                controller: controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: AppColors.primaryGradinatMixColor,
                progressColors: ProgressBarColors(
                  playedColor: AppColors.primaryGradinatMixColor,
                  handleColor: AppColors.secondary,
                ),
                onReady: () {
                  // Optional: Add logic when the player is ready
                },
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'To Export My corn out of India. How Can I grow faster and export quality?',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 35,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: feedController.action.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        switch (index) {
                          case 0:
                            _showBottomSheet(context, _buildLikeSheet());
                            break;
                          case 1:
                            _showBottomSheet(context, _buildCommentSheet());
                            break;
                          default:
                            break;
                        }
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Icon(
                                feedController.action[index]['icon'],
                                color: AppColors.secondary,
                              ),
                              SizedBox(width: 5), // Space between icon and text
                              Text(feedController.action[index]['count']),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    ),
  );
}

Widget buildNews() {
  final FeedController feedController = Get.put(FeedController());
  return SingleChildScrollView(
    // Ensure the News tab is scrollable
    child: Column(
      children: [
        SizedBox(height: 10),
        SizedBox(
          height: 30,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                margin: EdgeInsets.symmetric(horizontal: 2.5, vertical: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:
                      index == 0
                          ? AppColors.primaryGradinatMixColor
                          : AppColors.lightGrey,
                  border: Border.all(
                    color:
                        index != 0 ? AppColors.secondary : Colors.transparent,
                  ),
                ),
                child: Text(
                  'Government',
                  style: GoogleFonts.montserrat(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color:
                        index == 0 ? AppColors.white : AppColors.textSecondary,
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10),
        CarouselSlider(
          options: CarouselOptions(
            height: 150, // Adjust height
            autoPlay: true, // Auto-slide
            enlargeCenterPage: true, // Zoom effect on center image
            aspectRatio: 16 / 9,
            viewportFraction: 0.8, // Show partial next/previous image
          ),
          items:
              feedController.imagePaths.map((imagePath) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              }).toList(),
        ),
        SizedBox(height: 10),
        ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(), // Disable inner scrolling
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Row(
                children: [
                  Image.asset(
                    'assets/images/damage_leaves_01.jpg',
                    height: 80,
                    width: 80,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Maximizing Crop yield Tips for sustainable',
                          softWrap: true,
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Farmitre',
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            Text(
                              '02-04-2025',
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    ),
  );
}

void _showBottomSheet(BuildContext context, Widget child) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) => child,
  );
}

Widget _buildLikeSheet() {
  return DraggableScrollableSheet(
    expand: false,
    initialChildSize: 0.5, // Adjust the initial size
    // minChildSize: 0.3, // Minimum bottom sheet height
    maxChildSize: 0.5, // Maximum bottom sheet height
    builder: (context, scrollController) {
      return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Likes",
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                controller: scrollController, // Enables scrolling
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.primaryGradinatMixColor,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Guest',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget _buildCommentSheet() {
  final FeedController feedController = Get.put(FeedController());
  return DraggableScrollableSheet(
    expand: false,
    initialChildSize: 0.5, // Adjust the initial size
    // Minimum bottom sheet height
    maxChildSize: 0.5, // Maximum bottom sheet height
    builder: (context, scrollController) {
      return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Comments",
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                controller: scrollController, // Enables scrolling
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.primaryGradinatMixColor,
                        ),
                        SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Guest',
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'I like this 👌.',
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                          '04 APR 2025, 12:12 PM',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    borderRadius: 10,
                    hintText: 'Enter Reply',
                    keyboardType: TextInputType.text,
                    controller: feedController.reply,
                    validator: (p0) {},
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(width: 50, child: Icon(Icons.send)),
              ],
            ),
          ],
        ),
      );
    },
  );
}
