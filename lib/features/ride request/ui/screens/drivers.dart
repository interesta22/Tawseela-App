import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tewseela_app/core/utils/colors.dart';
import 'package:tewseela_app/core/widgets/custom_button.dart';
import 'package:tewseela_app/core/widgets/CusomAppBarCar.dart';
import 'package:tewseela_app/features/ride%20request/ui/widgets/driver_card.dart';
import 'package:tewseela_app/features/ride%20request/logic/cubit/request_cubit.dart';

class DriversScreen extends StatelessWidget {
  final Map<String, String> arguments; // اسم السيارة المختارة

  DriversScreen({
    super.key,
    required this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestCubit()
        ..fetchDrivers(arguments['car']!), // جلب السائقين بناءً على السيارة
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.mainWhite,
          automaticallyImplyLeading: false,
          title: const CustomAppBar(
            title: 'السائقين المتاحين للرحلة',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<RequestCubit, RequestState>(
            builder: (context, state) {
              if (state is RequestLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is DriverSelectionState) {
                final drivers = state.drivers; // قائمة السائقين
                return ListView.builder(
                  itemCount: drivers.length,
                  itemBuilder: (BuildContext context, int index) {
                    final driver = drivers[index];
                    return DriverCard(
                      price: arguments['price']!,
                      name: driver.name,
                      rating: driver.rating.toString(),
                      isOnline: 'true',
                      img: driver.img,
                      from: arguments['from']!,
                      to: arguments['to']!,
                      dis: arguments['dis']!
                    );
                  },
                );
              } else if (state is RequestError) {
                return Center(child: Text(state.message));
              }
              return const Center(child: Text('لا توجد بيانات للعرض'));
            },
          ),
        ),
      ),
    );
  }
}
