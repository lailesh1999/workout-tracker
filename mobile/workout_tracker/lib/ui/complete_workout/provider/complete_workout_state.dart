import '../../../core/data_models/complete_workout_response.dart';

class CompleteWorkoutState {
  final bool isLoading;
  final int? loadingWorkoutId;
  final CompleteWorkoutResponse? data;
  final String? error;

  const CompleteWorkoutState({this.isLoading = false, this.data, this.error,this.loadingWorkoutId,});

  CompleteWorkoutState copyWith({
    bool? isLoading,
    CompleteWorkoutResponse? data,
    String? error,
    int? loadingWorkoutId,
  }) {
    return CompleteWorkoutState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error,
      loadingWorkoutId: loadingWorkoutId ?? this.loadingWorkoutId,
    );
  }
}
