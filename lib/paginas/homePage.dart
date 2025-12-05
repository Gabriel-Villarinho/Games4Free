import 'package:flutter/material.dart';
import 'package:freetogame_gabriel/Model/jogoModel.dart';
import 'package:freetogame_gabriel/Services/service.dart';
import 'package:freetogame_gabriel/paginas/jogoPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController searchController = TextEditingController();
  final Service service = Service();
  List<Jogo> jogos = List.empty();
  String pesquisa = "";

  void pegarJogos() async {
    jogos = await service.getAllGames();
    setState(() {});
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pegarJogos();
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40,
              width: 250,
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Pesquisar nome",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: GridView.builder(
        itemCount: jogos.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          Jogo jogo = jogos[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Jogopage(id: jogo.id ?? 0),
                ),
              );
            },
            child: Card(
              color: Color.fromRGBO(5, 22, 116, 1),
              child: Column(
                children: [
                  Image.network(
                    "https://corsproxy.io/?${jogo.thumbnail}",
                    scale: 1.0,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.image_not_supported_outlined, color: Colors.white, size: 40);
                    },
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${jogo.title}",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
