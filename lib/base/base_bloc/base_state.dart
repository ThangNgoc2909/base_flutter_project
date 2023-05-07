import 'package:equatable/equatable.dart';

enum BaseStateDef {
  init,
  processing,
  success,
  failed,
  error,
  redirecting,
}

abstract class BaseBlocState extends Equatable {
  const BaseBlocState({
    required this.status,
    this.message,
  });

  final BaseStateDef status;
  final String? message;

  @override
  List get props => [status, message];
}

