import 'package:flutter/material.dart';
import 'package:freetogame_gabriel/Model/jogoModel.dart';
import 'package:freetogame_gabriel/Services/service.dart';

class Jogopage extends StatefulWidget {
  final int id;

  const Jogopage({super.key, required this.id});

  @override
  State<Jogopage> createState() => _JogopageState();
}

class _JogopageState extends State<Jogopage> {
  final Service service = Service();
  Jogo? jogo;

  void carregarJogo() async {
    jogo = await service.getGame(widget.id);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    carregarJogo();
    print(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromRGBO(5, 22, 116, 1),
        centerTitle: true,
        toolbarHeight: 80,
        title: Text(
          "GAMES4FREE",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Image.network(
                  "https://corsproxy.io/?${jogo?.thumbnail}",
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.image_not_supported_outlined,
                      color: Colors.white,
                      size: 40,
                    );
                  },
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  color: Color.fromRGBO(5, 22, 116, 1),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Descrição:",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "${jogo?.shortDescription}",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  height: 50,
                  color: Color.fromRGBO(5, 22, 116, 1),
                  alignment: Alignment.center,
                  child: Text(
                    "Genero: ${jogo?.genre}",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  color: Color.fromRGBO(5, 22, 116, 1),
                  alignment: Alignment.center,
                  child: Text(
                    "Distribuidora: ${jogo?.publisher}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  color: Color.fromRGBO(5, 22, 116, 1),
                  alignment: Alignment.center,
                  child: Text(
                    "Ano publicação: ${jogo?.releaseDate}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  color: Color.fromRGBO(5, 22, 116, 1),
                  alignment: Alignment.center,
                  child: Text(
                    "Produtora: ${jogo?.developer}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  color: Color.fromRGBO(5, 22, 116, 1),
                  alignment: Alignment.center,
                  child: Text("Imagens", style: TextStyle(color: Colors.white)),
                ),
                ListView.builder(
                  itemCount: jogo?.screenshots?.length ?? 0,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.network(
                        "https://corsproxy.io/?${jogo?.screenshots?[index].image}",
                        height: 160,
                        width: 120,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.image_not_supported_outlined,
                            color: Colors.white,
                            size: 40,
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
