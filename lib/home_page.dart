import 'package:flutter/material.dart';
import 'package:fugi_gathering2/detail_page.dart';
import 'package:fugi_gathering2/provider/pokemon.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemon"),
        centerTitle: true,
        leading: Image.asset("images/ball.png"),
      ),
      body: Consumer<Pokemon>(
        builder: (context, state, child) {
          if (state.isLoadingList) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: state.listPokemon?.results!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () async {
                    state.detail(state.listPokemon!.results![index]!.url!);
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        if (Provider.of<Pokemon>(context).isLoadingDetail) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Column(
                            children: [
                              Image.network(
                                state.detailPokemon!.sprites.other!.home
                                    .frontDefault,
                                height: 250,
                              ),
                              SizedBox(height: 12),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return DetailPage();
                                      },
                                    ));
                                  },
                                  child: Text("Show More"))
                            ],
                          );
                        }
                      },
                    );
                  },
                  title: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      state.listPokemon!.results![index]!.name!,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
