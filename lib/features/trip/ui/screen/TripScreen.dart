import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tewseela_app/core/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tewseela_app/features/home/logic/cubit/trip_cubit.dart';
import 'package:tewseela_app/features/trip/ui/widget/CusomCardTrip.dart';
import 'package:tewseela_app/features/trip/ui/widget/CusomAppBarTrip.dart';

class Tripscreen extends StatefulWidget {
  static String id = '/Tripscreen';

  const Tripscreen({super.key});

  @override
  State<Tripscreen> createState() => _TripscreenState();
}

class _TripscreenState extends State<Tripscreen> {
  late final String userId;

  @override
  void initState() {
    super.initState();
    // Get the user ID and fetch trips
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      // Handle null user (redirect or show a message)
      Navigator.of(context).pop();
      return;
    }
    userId = currentUser.uid;

    // Fetch trips for the user
    context.read<TripCubit>().fetchAllTrips(uid: userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.mainWhite,
        automaticallyImplyLeading: false,
        title: const CusomAppBarTrip(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20.h, right: 15.w, left: 15.w),
          child: BlocBuilder<TripCubit, TripState>(
            builder: (context, state) {
              if (state is TripLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is TripsLoaded) {
                if (state.tripsData.isEmpty) {
                  return const Center(child: Text('لا توجد رحلات متاحة.'));
                }
                final reversedTrips = state.tripsData.reversed.toList();
                return ListView.builder(
                  itemCount: reversedTrips.length,
                  itemBuilder: (context, index) {
                    final trip = reversedTrips[index];
                    return CustomCardTrip(
                      fromTripName: trip['from'] ?? 'غير معروف',
                      toTripName: trip['to'] ?? 'غير معروف',
                      tripDate: trip['date'] ?? 'غير محدد',
                      priceTrip: trip['price'] ?? 'غير محدد',
                      tripStatus: trip['status'] ?? 'غير محدد',
                    );
                  },
                );
              } else if (state is TripError) {
                return Center(child: Text('خطأ: ${state.message}'));
              }
              return Container(); // Default empty state
            },
          ),
        ),
      ),
    );
  }
}
