import 'package:booking_home_app/components/showup_animate.dart';
import 'package:booking_home_app/register_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: CachedNetworkImage(
              imageUrl: 'https://wallpapercave.com/wp/wp6701058.jpg',
              placeholder: (context, url) =>
                  const CircularProgressIndicator.adaptive(),
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.8),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ShowUpAnimation(
                  child: Text(
                    'Enjoy your vacation with the best hotel services!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ShowUpAnimation(
                  delay: 200,
                  child: Builder(
                    builder: (context) {
                      final GlobalKey<SlideActionState> key = GlobalKey();
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: SlideAction(
                          key: key,
                          text: 'Get started',
                          innerColor: Colors.white,
                          outerColor: Colors.grey.withOpacity(.8),
                          sliderRotate: false,
                          textStyle: const TextStyle(
                            fontSize: 27,
                          ),
                          onSubmit: () async {
                            Future.delayed(const Duration(seconds: 1), () {
                              if (key.currentState != null) {
                                key.currentState!.reset();
                              }
                            });
                            return Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage()),
                            );
                          },
                          submittedIcon: const Icon(
                            Icons.done_all,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
