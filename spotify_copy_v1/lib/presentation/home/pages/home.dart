import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_copy_v1/common/helpers/is_dark_mode.dart';
import 'package:spotify_copy_v1/core/configs/assets/app_images.dart';
import 'package:spotify_copy_v1/presentation/home/widgets/play_list.dart';
import 'package:spotify_copy_v1/presentation/profile/pages/profile.dart';

import '../../../common/widgets/appbar/app_bar.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../widgets/news_songs.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
        action: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfilePage()));
          },
          icon: const Icon(Icons.person),
        ),
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _homeTopCard(),
            _tabs(),
            SizedBox(
              height: 260,
              child: TabBarView(
                controller: _tabController,
                children: [
                  const NewsSongs(),
                  Container(),
                  Container(),
                  Container(),
                ],
              ),
            ),
            const PlayList()
          ],
        ),
      ),
    );
  }

  Widget _homeTopCard() {
    return Center(
      child: SizedBox(
        height: 140,
        child: Stack(children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
              AppVectors.homeTopCard,
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Image.asset(AppImages.homeArtist),
              ))
        ]),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
      controller: _tabController,
      labelColor: context.isDarkmode ? Colors.white : Colors.black,
      indicatorColor: AppColors.primary,
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 16,
      ),
      tabs: [
        const Text(
          "News",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
        const Text(
          "Videos",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
        const Text(
          "Artists",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
        const Text(
          "Podcasts",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
      ],
    );
  }
}
