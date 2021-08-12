import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:magalu/models/produtos.dart';
import 'package:magalu/provider/list_of_products.dart';

import 'details.dart';

class Home extends StatefulWidget {
  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Image.asset('logo.jpg'),
          title: Text('Ofertas do dia'),
          bottom: PreferredSize(
              child: Image.asset(
                'linha.jpg',
                fit: BoxFit.fill,
                width: 1000000,
              ),
              preferredSize: Size.fromHeight(1))),
      body: ListView.separated(
          itemBuilder: builder,
          itemCount: 7,
          separatorBuilder: (_, index) {
            return Divider();
          }),
    );
  }

  Widget builder(BuildContext _, int index) {
    Produto _produto = listOfProdutos.elementAt(index);
    return ListTile(
        trailing: IconButton(
          padding: const EdgeInsets.all(10.0),
          icon: (_produto.isFavorite)
              ? Icon(Icons.favorite, color: Colors.purple)
              : Icon(Icons.favorite_outline, color: Colors.purple),
          onPressed: () {
            setState(() {
              _produto.isFavorite = !_produto.isFavorite;
            });
          },
        ),
        title: Row(
          children: [
            Image.asset(
              _produto.photo,
              width: 150,
            ),
            Container(
              height: 130,
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _produto.nome,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    _produto.subnome,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      _produto.desc,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      _produto.valor,
                      style: TextStyle(
                          color: Colors.lightBlue, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(_produto.parcelamento,
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.w300))
                ],
              ),
            )
          ],
        ));
  }
}
