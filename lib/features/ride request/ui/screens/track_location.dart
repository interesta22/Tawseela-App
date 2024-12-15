import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:tewseela_app/core/utils/fonts.dart';
import 'package:tewseela_app/core/utils/colors.dart';
import 'package:tewseela_app/core/routing/routs.dart';
import 'package:tewseela_app/core/helpers/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tewseela_app/core/widgets/custom_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tewseela_app/features/ride%20request/ui/widgets/location_field.dart';

class TrackLocation extends StatefulWidget {
  const TrackLocation({super.key});

  @override
  State<TrackLocation> createState() => _TrackLocationState();
}

class _TrackLocationState extends State<TrackLocation> {
  MapController mapController = MapController();
  LocationData? currentLocation;
  List<LatLng> routePoints = [];
  double? distanceInMeters;
  Marker? destinationMarker; // ماركر الوجهة
  Marker? currentLocationMarker; // ماركر الموقع الحالي
  String apiKey = '5b3ce3597851110001cf62482fceba4422154c6a904cc961ba039b4f';

  TextEditingController currentLocationController = TextEditingController();
  TextEditingController destinationLocationController = TextEditingController();

  Future<void> _getCurrentLocation() async {
    var location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    // تحقق من تمكين خدمة الموقع
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return; // الخدمة لم يتم تفعيلها
      }
    }

    // تحقق من الصلاحيات
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return; // الصلاحيات لم تُمنح
      }
    }

    // الحصول على الموقع الحالي
    var userLocation = await location.getLocation();
    String address = await _getAddressFromCoordinates(
      LatLng(userLocation.latitude!, userLocation.longitude!),
    );
    setState(() {
      currentLocation = userLocation;
      currentLocationController.text = address;
      currentLocationMarker = Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(userLocation.latitude!, userLocation.longitude!),
        child: const Icon(Icons.location_on, color: Colors.blue, size: 40.0),
      );
    });

    location.onLocationChanged.listen((LocationData newLocation) {
      setState(() {
        currentLocation = newLocation;
        currentLocationMarker = Marker(
          width: 80.0,
          height: 80.0,
          point: LatLng(newLocation.latitude!, newLocation.longitude!),
          child: const Icon(Icons.location_on, color: Colors.blue, size: 40.0),
        );
      });
    });
  }

  Future<String> _getAddressFromCoordinates(LatLng coordinates) async {
    final response = await http.get(
      Uri.parse(
        'https://nominatim.openstreetmap.org/reverse?lat=${coordinates.latitude}&lon=${coordinates.longitude}&format=json',
      ),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data != null && data['address'] != null) {
        return '${data['address']['road'] ?? ''}, ${data['address']['city'] ?? ''}, ${data['address']['country'] ?? ''}';
      }
      return 'عنوان غير متوفر';
    } else {
      print('فشل في جلب العنوان');
      return 'خطأ في جلب العنوان';
    }
  }

  Future<void> _getRoute(LatLng destination) async {
    if (currentLocation == null) return;

    final start =
        LatLng(currentLocation!.latitude!, currentLocation!.longitude!);

    // First perform the asynchronous task (get route)
    final response = await http.get(
      Uri.parse(
          'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$apiKey&start=${start.longitude},${start.latitude}&end=${destination.longitude},${destination.latitude}'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> coords =
          data['features'][0]['geometry']['coordinates'];

      // Calculate distance asynchronously
      double dis = await (Geolocator.distanceBetween(
        start.latitude,
        start.longitude,
        destination.latitude,
        destination.longitude,
      ));
      distanceInMeters = double.parse((dis / 1000).toStringAsFixed(2));
      // Once the async work is done, update the state synchronously
      setState(() {
        routePoints =
            coords.map((coord) => LatLng(coord[1], coord[0])).toList();
        destinationMarker = Marker(
          width: 80.0,
          height: 80.0,
          point: destination,
          child: const Icon(FontAwesomeIcons.locationDot, color: Colors.red),
        );
      });
    } else {
      // Handle errors
      print('Failed to fetch route');
    }
  }


  void _addDestinationMarker(LatLng point) async {
    // الحصول على العنوان من الإحداثيات
    String address = await _getAddressFromCoordinates(point);

    setState(() {
      destinationMarker = Marker(
        width: 80.0,
        height: 80.0,
        point: point,
        child: const Icon(Icons.location_on, color: Colors.red, size: 40.0),
      );
      destinationLocationController.text = address;
    });

    _getRoute(point);
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // لضبط الاتجاه من اليمين إلى اليسار
      child: Scaffold(
        body: SafeArea(
          child: currentLocation == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
                  children: [
                    // الخلفية (صورة الخريطة)
                    Positioned.fill(
                      child: FlutterMap(
                        mapController: mapController,
                        options: MapOptions(
                          initialCenter: LatLng(currentLocation!.latitude!,
                              currentLocation!.longitude!), // الموقع الحالي
                          initialZoom: 15.0, // مستوى التقريب
                          onTap: (tapPosition, point) =>
                              _addDestinationMarker(point),
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                "https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png",
                            userAgentPackageName:
                                'com.example.tewseela_app', // تعريف التطبيق
                          ),
                          MarkerLayer(
                            markers: currentLocationMarker != null
                                ? [
                                    currentLocationMarker!,
                                    if (destinationMarker != null)
                                      destinationMarker!
                                  ]
                                : [],
                          ),
                          PolylineLayer(
                            polylines: [
                              Polyline(
                                points: routePoints,
                                strokeWidth: 4.0,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // المحتوى فوق الخريطة
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              context.pop();
                            },
                            icon: Icon(
                              HugeIcons.strokeRoundedArrowRight01,
                              size: 30,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      FontAwesomeIcons.locationCrosshairs,
                                      color: ColorManager.mainColor,
                                    ),
                                  ),
                                  DottedLine(
                                    direction: Axis.vertical,
                                    lineLength: 20.h,
                                    dashLength: 3.0,
                                    dashGapLength: 4.0,
                                    dashColor: ColorManager.mainColor,
                                    lineThickness: 2.0,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      FontAwesomeIcons.locationDot,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    LocationField(
                                      title: 'موقعي الحالي',
                                      controller: currentLocationController,
                                    ),
                                    SizedBox(height: 20.h), // مسافة بين الحقول
                                    LocationField(
                                      title: 'الوجهة القادمة',
                                      controller: destinationLocationController,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Spacer(), // يضيف مساحة فارغة لدفع الزر للأسفل
                          CustomButton(
                            buttonText: 'تأكيد',
                            textStyle: FontManager.font15WhiteMedium,
                            onPressed: () {
                              if (currentLocation == null) {
                                // عرض رسالة تحذير إذا لم يتم تحديد الموقع الحالي
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('يرجى تحديد موقعك الحالي.'),
                                  ),
                                );
                                return;
                              }

                              if (destinationMarker == null) {
                                // عرض رسالة تحذير إذا لم يتم تحديد الوجهة
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('يرجى اختيار الوجهة أولاً.'),
                                  ),
                                );
                                return;
                              }

                              // الانتقال للصفحة التالية عند توفر الموقع الحالي والوجهة
                              Map<String, String> arguments = {
                                'dis': distanceInMeters?.toString() ?? '',
                                'from': currentLocationController.text,
                                'to': destinationLocationController.text,
                              };
                              context.pushNamed(Routes.carScreen,
                                  arguments: arguments);
                            },
                            backgroundColor: ColorManager.mainColor,
                          ),

                          SizedBox(height: 15.h),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 20,
                      bottom: 70,
                      child: FloatingActionButton(
                        backgroundColor: ColorManager.mainWhite,
                        onPressed: () {
                          if (currentLocation != null) {
                            mapController.move(
                              LatLng(currentLocation!.latitude!,
                                  currentLocation!.longitude!),
                              15.0,
                            );
                          }
                        },
                        child: const Icon(
                          Icons.my_location,
                          color: ColorManager.mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
