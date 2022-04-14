import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_intership_onix/data/models/local/currency.dart';
import 'package:flutter_intership_onix/ui/bloc/converter_bloc/converter_bloc.dart';
import 'package:flutter_intership_onix/ui/bloc/currencies_list_bloc/currencies_list_bloc.dart';
import 'package:flutter_intership_onix/ui/widgets/buttons/settings_button.dart';
import 'package:flutter_intership_onix/ui/widgets/buttons/outlined_custom_button.dart';
import 'package:flutter_intership_onix/ui/widgets/currency_card.dart';
import 'package:flutter_intership_onix/ui/widgets/errors/card_error.dart';
import 'package:flutter_intership_onix/data/models/local/converter.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({Key? key}) : super(key: key);

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationScreenController;
  late AnimationController _animationSettingsBtnController;
  late Animation<Offset> _animationMoveTopCard;
  late Animation<Offset> _animationMoveBottomCard;
  late Animation<double> _animationFadeButton;
  late Animation<double> _animationRotateButton;
  late Tween<Offset> topTween;
  late Tween<Offset> bottomTween;

  @override
  void initState() {
    _animationScreenController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animationSettingsBtnController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    topTween = Tween<Offset>(begin: const Offset(-1.1, 0), end: Offset.zero);
    bottomTween = Tween<Offset>(begin: const Offset(1.1, 0), end: Offset.zero);

    _animationMoveTopCard = topTween.animate(CurvedAnimation(
        parent: _animationScreenController, curve: Curves.elasticInOut))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          topTween.begin = const Offset(1.1, 0);
        } else if (status == AnimationStatus.dismissed) {
          topTween.begin = const Offset(-1.1, 0);
        }
      });
    _animationMoveBottomCard = bottomTween.animate(CurvedAnimation(
        parent: _animationScreenController, curve: Curves.elasticInOut))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          bottomTween.begin = const Offset(-1.1, 0);
        } else if (status == AnimationStatus.dismissed) {
          bottomTween.begin = const Offset(1.1, 0);
        }
      });
    _animationFadeButton = CurvedAnimation(
        parent: _animationScreenController,
        curve: const Interval(0.5, 1, curve: Curves.ease));
    _animationRotateButton = CurvedAnimation(
        parent: _animationSettingsBtnController, curve: Curves.easeInOutCirc);

    super.initState();
  }

  @override
  void dispose() {
    _animationScreenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Converter',
          style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
        ),
        centerTitle: true,
        actions: [
          RotationTransition(
            turns: _animationRotateButton,
            child: SettingsButton(
              animationController: _animationSettingsBtnController,
            ),
          ),
        ],
      ),
      body: BlocBuilder<ConverterBloc, ConverterState>(
        builder: (context, converterState) {
          if (converterState is ConverterLoaded) {
            return ListView(children: [
              _showCards(0, converterState.converter,
                  converterState.topCardController),
              const SizedBox(height: 5),
              Center(
                child: FadeTransition(
                  opacity: _animationFadeButton,
                  child: OutlinedCustomButton(
                      title: 'Switch currencies',
                      onPressed: () {
                        _onPressed(_animationScreenController);
                      }),
                ),
              ),
              const SizedBox(height: 5),
              _showCards(1, converterState.converter,
                  converterState.bottomCardController),
            ]);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  void _onPressed(AnimationController animationController) {
    animationController
        .reverse()
        .then((value) => context.read<ConverterBloc>().add(SwitchCards()));
  }

  //function for build cards
  Widget _showCards(
    int cardIndex,
    Converter converter,
    TextEditingController controller,
  ) {
    return BlocBuilder<CurrenciesListBloc, CurrenciesListState>(
      builder: (context, currenciesListState) {
        if (currenciesListState is CurrenciesListError) {
          String _error = currenciesListState.errorMassage;

          return CardError(
            error: _error,
            onTap: () =>
                context.read<CurrenciesListBloc>().add(GetCurrenciesList()),
          );
        } else if (currenciesListState is CurrenciesListLoaded) {
          Currency currency = cardIndex == 0
              ? currenciesListState.currencies[converter.topCardId]
              : currenciesListState.currencies[converter.bottomCardId];

          if (cardIndex == 0 && converter.topCardRate != currency.rateToUah) {
            context.read<ConverterBloc>().add(SetRates(
                  cardIndex: cardIndex,
                  rate: currency.rateToUah,
                ));
          } else if (cardIndex == 1 &&
              converter.bottomCardRate != currency.rateToUah) {
            context.read<ConverterBloc>().add(SetRates(
                  cardIndex: cardIndex,
                  rate: currency.rateToUah,
                ));
          }
          if (!_animationScreenController.isAnimating) {
            _animationScreenController.forward();
          }
          return SlideTransition(
            position: cardIndex == 0
                ? _animationMoveTopCard
                : _animationMoveBottomCard,
            child: CurrencyCard(
              cardIndex: cardIndex,
              readOnly: cardIndex == 0 ? false : true,
              controller: controller,
              currency: currency,
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
