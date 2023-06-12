import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../../../common/constants/duration/duration_constants.dart';
import '../base_cubit.dart';

mixin EventTransformerMixin<S> on BaseCubitDelegate<S> {
  String get name => runtimeType.toString();

  /// log event action with payload
  EventTransformer<Event> log<Event>() {
    return (events, mapper) => events.flatMap(mapper);
  }

  /// ignores subsequent events for a duration, then repeats this process
  EventTransformer<Event> throttleTime<Event>({
    Duration duration = DurationConstants.defaultEventTransformDuration,
  }) {
    return (events, mapper) => events.throttleTime(duration).flatMap(mapper);
  }

  /// skips data events if they are equal to the previous data event.
  EventTransformer<Event> distinct<Event>() {
    return (events, mapper) => events.distinct().flatMap(mapper);
  }

  /// Only emit events from the source sequence whenever the time span defined by [duration] passes, without the source sequence emitting another item.
  /// This time span start after the last debounced event was emitted.
  EventTransformer<Event> debounceTime<Event>({
    Duration duration = DurationConstants.defaultEventTransformDuration,
  }) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

  /// ignore later events:
  /// The new events will be ignored until the previous process completes.
  EventTransformer<Event> exhaustMap<Event>() {
    return (events, mapper) => events.exhaustMap(mapper);
  }

  /// ignore previous events:
  /// The old events will be ignored when the new event was emitted.
  EventTransformer<Event> switchMap<Event>() {
    return (events, mapper) => events.switchMap(mapper);
  }

  /// concat events:
  /// The new events will be wait until the previous process completes
  EventTransformer<Event> asyncExpand<Event>() {
    return (events, mapper) => events.asyncExpand(mapper);
  }

  /// both [distinct] and [exhaustMap]
  EventTransformer<Event> distinctExhaustMap<Event>() {
    return (events, mapper) => events.distinct().exhaustMap(mapper);
  }

  /// both [distinct] and [switchMap]
  EventTransformer<Event> distinctSwitchMap<Event>() {
    return (events, mapper) => events.distinct().switchMap(mapper);
  }

  /// both [distinct] and [asyncExpand]
  EventTransformer<Event> distinctAsyncExpand<Event>() {
    return (events, mapper) => events.distinct().asyncExpand(mapper);
  }
}
