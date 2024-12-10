import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tewseela_app/core/widgets/CusomAppBarCar.dart';
import 'package:tewseela_app/features/ride%20request/logic/cubit/request_cubit.dart';
import 'package:tewseela_app/features/ride%20request/ui/widgets/CusomeContainerCar.dart';

class CarScreen extends StatelessWidget {
  static String id = '/Cars';
  final Map<String, String> arguments;
  const CarScreen({super.key, required this.arguments});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestCubit()..fetchCars(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const CustomAppBar(title: 'السيارات المتاحة للرحلة'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<RequestCubit, RequestState>(
            builder: (context, state) {
              if (state is RequestLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CarSelectionState) {
                final cars = state.cars;
                return ListView.builder(
                  itemCount: cars.length,
                  itemBuilder: (BuildContext context, int index) {
                    final car = cars[index];
                    return CusomeContainerCar(
                      arguments: arguments,
                      carName: car.name,
                      carColor: car.color,
                      carPrice: car.price,
                      carImage: car.img,
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
