import 'package:flutter/material.dart';

import '../bloc/inherited_widget.dart';
import '../models/characters_model.dart' as characters;
import '../screens/character_screen.dart';
import '../widgets//custom_cached_image.dart';

class CharactersBuilder extends StatelessWidget {
  final characters.Result result;

  CharactersBuilder({@required this.result});

  @override
  Widget build(BuildContext context) {
    final characters.Result _result = result;
    final String _imageExtension = _result.thumbnail.extension;
    final String _imageUrl = _result.thumbnail.path + '.' + _imageExtension;

    if (_imageUrl.contains("image_not_available")) {
      return Container();
    } else {
      return Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: <Widget>[
          Center(
            child: Container(
              child: customCachedNetworkImage(_imageUrl),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 28),
            margin: const EdgeInsets.all(32),
            child: Text(
              _result.name,
              style: TextStyle(
                fontSize: 23,
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg-cell-title.png'),
                alignment: Alignment.center,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  MarvelInheritedWidget.of(context).bloc.getId.add(_result.id);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CharacterScreen(
                        result: _result,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      );
    }
  }
}
