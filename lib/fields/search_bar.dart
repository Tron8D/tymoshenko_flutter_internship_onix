import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    BorderRadius _textFieldBorderRadius =
        const BorderRadius.all(Radius.circular(50));

    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            offset: Offset(-5.0, 0.0),
            color: Colors.black38,
            blurRadius: 15,
          ),
        ],
        border: Border.all(
          style: BorderStyle.none,
        ),
        borderRadius: _textFieldBorderRadius,
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search',
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: _textFieldBorderRadius,
          ),
          suffixIcon: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.black87,
            splashColor: Colors.blue,
            child: const Icon(
              Icons.search,
            ),
          ),
          prefixIcon: const SizedBox(),
        ),
      ),
    );
  }
}
