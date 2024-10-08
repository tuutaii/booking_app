import 'dart:async';
import 'dart:ui';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';

import 'components/shimmer_loading.dart';
import 'components/showup_animate.dart';
import 'models/hotel_item.dart';
import 'models/hotel_model.dart';
import 'models/user_model.dart';
import 'profile_page.dart';
import 'services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late HotelsService hotelsService;
  late UserService userService;
  Future<Response>? authorResponse, userResponse;
  List<HotelModel>? listModel;
  UserModel? userModel;
  bool isLoading = false;
  String dropdownValue = 'Item Name';

  @override
  void initState() {
    super.initState();
    hotelsService = HotelsService.create();
    userService = UserService.create();
    authorResponse = hotelsService.getHotels();
    userResponse = hotelsService.getHotels();
    _fetchData();
  }

  Future<void> _fetchData() async {
    isLoading = true;
    try {
      final response = await hotelsService.getHotels();
      final responseUser = await userService.getUser();
      setState(() {
        listModel = (response.body as List<dynamic>)
            .map((item) => HotelModel.fromJson(item as Map<String, dynamic>))
            .toList();
        userModel = UserModel.fromJson(responseUser.body);
        isLoading = false;
      });
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _HomeHeader(
            model: userModel,
            isLoading: isLoading,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Hotels',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'View All',
                  style: TextStyle(
                    color: Color(0xfffcd1a8),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 385,
            child: isLoading
                ? Shimmer(
                    linearGradient: shimmerGradient,
                    child: ShimmerLoading(
                      isLoading: true,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 350,
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.grey[300]!.withOpacity(.3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listModel?.length ?? 0,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 350,
                        child: HotelItem(model: listModel?[index]),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader({
    this.model,
    this.isLoading,
  });

  final UserModel? model;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home_bg.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            24.0, MediaQuery.of(context).padding.top, 24, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilePage(userModel: model)),
                  );
                },
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/57899051?v=4'),
                ),
              ),
              contentPadding: EdgeInsets.zero,
              title: (isLoading ?? false)
                  ? Shimmer(
                      linearGradient: shimmerGradient,
                      child: ShimmerLoading(
                        isLoading: isLoading ?? false,
                        child: Center(
                          child: Container(
                            height: 15,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Text(
                        'Hello, ${model?.name}!',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 20),
            const ShowUpAnimation(
              child: Text(
                'Find Hotels, Villas,',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const ShowUpAnimation(
              delay: 200,
              child: Text(
                'Lodging, that are around you!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ShowUpAnimation(
              delay: 400,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Stack(
                  children: [
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: const SizedBox(),
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.15),
                            Colors.white.withOpacity(0.05),
                          ],
                        ),
                      ),
                      child: const ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        title: Text(
                          'Search for hotels, villas, etc...',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        dense: true,
                        leading: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
