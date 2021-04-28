import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lista_leitura/models/livro_model.dart';

class FormularioLivroPage extends StatefulWidget {
  FormularioLivroPage({this.livro, @required this.onCadastrar});

  final LivroModel livro;
  final Function(LivroModel) onCadastrar;

  @override
  _FormularioLivroPageState createState() => _FormularioLivroPageState();
}

class _FormularioLivroPageState extends State<FormularioLivroPage> {
  GlobalKey<FormState> _formkey;
  LivroModel livro;

  @override
  void initState() {
    _formkey = GlobalKey<FormState>();
    livro = widget.livro ??
        LivroModel(
          id: Random().nextInt(255),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 80,
                  left: 10,
                ),
                child: Text(
                  'Inclua Seu novo livro',
                  style: TextStyle(
                      color: Color(0xFF498C94),
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(22),
                child: TextFormField(
                  initialValue: livro.titulo,
                  decoration: InputDecoration(
                    hintText: 'Titulo',
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  onSaved: (titulo) {
                    livro.titulo = titulo;
                  },
                  validator: (titulo) =>
                      titulo.isEmpty ? 'Titulo é obrigatorio' : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(22),
                child: TextFormField(
                  initialValue: livro.descricao,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'Descrição',
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  onSaved: (descricao) {
                    livro.descricao = descricao;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(28),
                child: Row(
                  children: [
                    Text('Ja li este livro'),
                    Checkbox(
                      value: livro.lido,
                      onChanged: (valor) {
                        setState(() {
                          livro.lido = valor;
                        });
                      },
                      activeColor: Colors.grey,
                    )
                  ],
                ),
              ),
              RaisedButton(
                onPressed: () {
                  final form = _formkey.currentState;
                  if (form.validate()) {
                    form.save();
                    widget.onCadastrar(livro);
                    Navigator.of(context).pop();
                  }
                },
                padding: EdgeInsets.symmetric(horizontal: 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Text(
                  'Cadastrar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
                color: Color(0xFFE67F22),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFFF1EF88),
    );
  }
}
