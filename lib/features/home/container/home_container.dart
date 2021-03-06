import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/error/failure.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';
import 'package:pokedex_flutter/common/repositories/pokemon_repository.dart';
import 'package:pokedex_flutter/features/home/pages/home_error.dart';
import 'package:pokedex_flutter/features/home/pages/home_loading.dart';
import 'package:pokedex_flutter/features/home/pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key, required this.repository}) : super(key: key);
  final IPokemonsRepository repository;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return HomeLoading();
      }
      if (snapshot.connectionState == ConnectionState.done &&
          snapshot.hasData) {
        return HomePage(list: snapshot.data!);
      }
      if (snapshot.connectionState == ConnectionState.done &&
          snapshot.hasError) {
        return HomeError(error: (snapshot.error as Failure).message!);
      }
      return Container();
    });
  }
}
