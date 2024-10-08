import 'dart:async';

import 'package:booking_home_app/booking_page.dart';
import 'package:booking_home_app/models/hotel_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class HotelDetailsPage extends StatefulWidget {
  const HotelDetailsPage({super.key, required this.hotelModel});
  final HotelModel hotelModel;

  @override
  State<HotelDetailsPage> createState() => _HotelDetailsPageState();
}

class _HotelDetailsPageState extends State<HotelDetailsPage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int currentPage = 0;
  String currentRoomType = 'Single Room';
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  bool isFavorite = false;
  @override
  void initState() {
    _pageController = PageController();

    super.initState();
  }

  onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  void onFavoritePressed() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  String formatCurrency(int amount) {
    final formatCurrency = NumberFormat.currency(locale: 'vi_VN', symbol: '₫');
    return formatCurrency.format(amount);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hotel Details',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: widget.hotelModel.photos?.length ?? 0,
                        onPageChanged: onPageChanged,
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              imageUrl: widget.hotelModel.photos![index],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                            widget.hotelModel.photos?.length ?? 0,
                            (index) {
                              return Container(
                                height: 60,
                                width: 60,
                                margin:
                                    const EdgeInsets.fromLTRB(12, 0, 12, 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 3,
                                    color: currentPage == index
                                        ? Colors.white
                                        : Colors.transparent,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                    imageUrl: widget.hotelModel.photos![index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.hotel),
                          const SizedBox(width: 20),
                          Text(
                            widget.hotelModel.name ?? '',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: formatCurrency(
                                      widget.hotelModel.price ?? 0),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const TextSpan(
                                  text: ' /Person',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RatingBar(
                            initialRating: double.parse(
                                widget.hotelModel.rating.toString()),
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            ignoreGestures: true,
                            itemCount: 5,
                            ratingWidget: RatingWidget(
                              full: const Icon(Icons.star_rounded,
                                  color: Colors.amber),
                              half: const Icon(Icons.star_half_rounded,
                                  color: Colors.amber),
                              empty: const Icon(Icons.star_border_rounded,
                                  color: Colors.amber),
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            const Icon(Icons.location_on),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                widget.hotelModel.address ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'Room facilities  ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.king_bed),
                              Text('  King Bed'),
                            ],
                          ),
                          SizedBox(width: 10),
                          Row(
                            children: [
                              Icon(Icons.tv),
                              Text('  TV'),
                            ],
                          ),
                          SizedBox(width: 10),
                          Row(
                            children: [
                              Icon(Icons.wifi),
                              Text('  Wifi'),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Room Type',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: currentRoomType,
                          dropdownColor: const Color(0xff3b3b3b),
                          items: [
                            'Single Room',
                            'Double Room',
                          ].map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              currentRoomType = value!;
                            });
                          },
                        ),
                      ),
                      const Text(
                        'Description',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Family Room with facilities of 2 Bedrooms, 1 Bathroom, and 1 Living room is perfect for those of you who bring family for vacation. With a fairly affordable  price per night, your vacation doesn't feel heavy in terms of accommodation costs.The hotel's location is very strategic with shopping centers and city parks that you can visit as one of your vacation agendas with your beloved family.",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Map',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: GoogleMap(
                          initialCameraPosition: const CameraPosition(
                            bearing: 192.8334901395799,
                            target:
                                LatLng(37.43296265331129, -122.08832357078792),
                            tilt: 59.440717697143555,
                            zoom: 19.151926040649414,
                          ),
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom * 2.5,
                )
              ],
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom,
            left: 30,
            right: 30,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: onFavoritePressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff3b3b3b),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(15),
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: const Color(0xfffcd1a8).withOpacity(.4),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingPage(
                            hotelModel: widget.hotelModel,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xfffcd1a8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Book Now',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
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
