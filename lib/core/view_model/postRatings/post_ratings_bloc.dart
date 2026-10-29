import 'package:cruise_buddy/core/model/ratings_response_model/ratings_response_model.dart';
import 'package:cruise_buddy/core/services/ratings/ratings_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'post_ratings_event.dart';
part 'post_ratings_state.dart';
part 'post_ratings_bloc.freezed.dart';

class PostRatingsBloc extends Bloc<PostRatingsEvent, PostRatingsState> {
  PostRatingsBloc() : super(_Initial()) {
    RatingService ratingService = RatingService();
    on<_RegisterRequested>((event, emit) async {
      emit(const PostRatingsState.loading());

      try {
        final result = await ratingService.submitRating(
          cruiseId: event.cruiseId,
          rating: event.ratings,
          description: event.description,
        );

        await result.fold((failure) async {
          if (failure == "No internet") {
            emit(const PostRatingsState.noInternet());
          } else {
            emit(PostRatingsState.registrationFailure(error: failure));
          }
        }, (success) async {
          emit(PostRatingsState.registrationSuccess(ratingResponse: success));
        });
      } catch (e) {
        emit(PostRatingsState.registrationFailure(
            error: 'An error occurred: $e'));
      }
    });
  }
}
