import 'package:flutter/material.dart';
import 'package:fugi_gathering2/provider/pokemon.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key}) : super(key: key);

  final ScrollController _sliverScrollController = ScrollController();
  bool isWishlist = false;
  bool isPinned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Pokemon>(
        builder: (context, state, child) {
          return CustomScrollView(
            controller: _sliverScrollController,
            slivers: <Widget>[
              SliverAppBar(
                  centerTitle: true,
                  title: Text(
                    "Detail",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  actions: [
                    InkWell(
                      onTap: () {
                        // context.read<ListPokemonCubit>().updateWishlist(detailPokemonResponse.name);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 3),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                  bottom: PreferredSize(
                    preferredSize: const Size(0, 20),
                    child: Container(),
                  ),
                  pinned: true,
                  expandedHeight: MediaQuery.of(context).size.height * 0.6,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      state.detailPokemon!.sprites.other!.home.frontShiny,
                    ),
                  )),
              SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: Text(
                      state.detailPokemon!.name,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Height",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            state.detailPokemon!.height.toString(),
                            style:
                                Theme.of(context).textTheme.headline6?.copyWith(
                                      color: Colors.grey.shade700,
                                    ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 25.0,
                      ),
                      Container(
                        height: 50,
                        width: 2,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 25.0,
                      ),
                      Column(
                        children: [
                          Text(
                            "Width",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            state.detailPokemon!.weight.toString(),
                            style:
                                Theme.of(context).textTheme.headline6?.copyWith(
                                      color: Colors.grey.shade700,
                                    ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      Container(
                        height: 50,
                        width: 2,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 25.0,
                      ),
                      Column(
                        children: [
                          Text(
                            "Experience",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            state.detailPokemon!.baseExperience.toString(),
                            style:
                                Theme.of(context).textTheme.headline6?.copyWith(
                                      color: Colors.grey.shade700,
                                    ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Center(
                    child: Text(
                      "- Moves -",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ...List.generate(
                    state.detailPokemon!.moves.length,
                    (index) => Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: (index % 2 == 0)
                            ? Colors.grey.shade400
                            : Colors.white,
                      ),
                      child: Text(
                        state.detailPokemon!.moves[index].move.name,
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              color: (index % 2 == 0)
                                  ? Colors.white
                                  : Colors.grey.shade700,
                            ),
                      ),
                    ),
                  ).toList()
                ]),
              )
            ],
          );
        },
      ),
    );
  }
}
