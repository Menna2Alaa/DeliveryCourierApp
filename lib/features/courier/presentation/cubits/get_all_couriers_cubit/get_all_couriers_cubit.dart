import 'package:delivery_courier_app/features/courier/domain/entity/courier_entity.dart';
import 'package:delivery_courier_app/features/courier/domain/repos/courier_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_all_couriers_state.dart';

class GetAllCouriersCubit extends Cubit<GetAllCouriersState> {
  final CourierRepo courierRepo;
  GetAllCouriersCubit(this.courierRepo) : super(GetAllCouriersInitial());

  Future<void> getAllCouriers() async {
    emit(GetAllCouriersLoading());
    final result = await courierRepo.getAllAvailableCouriers();
    result.fold(
      (failure) => emit(GetAllCouriersFailure(failure.message)),
      (couriers) => emit(GetAllCouriersSuccess(couriers)),
    );
  }
}
