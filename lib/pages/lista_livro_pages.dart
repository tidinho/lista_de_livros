import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_leitura/models/livro_model.dart';
import 'package:lista_leitura/pages/formulario_livro_page.dart';
import 'package:lista_leitura/widgets/linha_horizontal.dart';
import 'package:lista_leitura/widgets/lista_livros.dart';

class ListaLivrosPage extends StatefulWidget {
  @override
  _ListaLivrosPageState createState() => _ListaLivrosPageState();
}

class _ListaLivrosPageState extends State<ListaLivrosPage> {
  Set<LivroModel> meusLivros;

  Function(LivroModel) onCadastrar;
  Function(LivroModel) onDeletar;

  @override
  void initState() {
    meusLivros = {};
    onCadastrar = (LivroModel livroModel) {
      setState(() {
        meusLivros.add(livroModel);
      });
    };
    onDeletar = (LivroModel livroModel) {
      setState(() {
        meusLivros.remove(livroModel);
      });
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1EF88),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 58),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Lista de Leitura..',
                          style: TextStyle(
                            color: Color(0xFF498C9A),
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (context) => FormularioLivroPage(
                                  onCadastrar: onCadastrar,
                                ),
                              ),
                            );
                          },
                          child: Icon(Icons.add),
                          mini: true,
                        )
                      ],
                    ),
                  ),
                  LinhaHorizontal(),
                  ListaLivros(
                    listaLivros: meusLivros,
                    onCadastrar: onCadastrar,
                    onDeletar: onDeletar,
                  ),
                  if (meusLivros.isNotEmpty) LinhaHorizontal(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 38),
              child: VerticalDivider(
                color: Colors.red[200],
                thickness: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
