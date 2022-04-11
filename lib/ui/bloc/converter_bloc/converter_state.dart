part of 'converter_bloc.dart';

@immutable
abstract class ConverterState {}

class ConverterInitial extends ConverterState {}

class ConverterLoading extends ConverterState {}

class ConverterError extends ConverterState {
  final String errorMassage;

  ConverterError(this.errorMassage);
}

class ConverterLoaded extends ConverterState {
  final Converter converter;
  final TextEditingController topCardController;
  final TextEditingController bottomCardController;

  ConverterLoaded(
      this.converter, this.topCardController, this.bottomCardController);
}
