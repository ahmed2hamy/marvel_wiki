import 'package:flutter/material.dart';

import '../bloc/bloc.dart';
import '../bloc/inherited_widget.dart';
import '../constants.dart';

void bottomSheet(BuildContext context, ScrollController scrollController) {
  final Bloc _bloc = MarvelInheritedWidget.of(context).bloc;

  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Wrap(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Order characters by: ",
                  style: kHeadlineWhite,
                ),
                SizedBox(height: 18),
                FittedBox(
                  child: Row(
                    children: <Widget>[
                      CustomOutlineButton(
                        title: "Name Ascending",
                        onPressed: () {
                          _bloc.order.add("name");

                          scrollController.jumpTo(
                              scrollController.position.minScrollExtent);
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width: 10),
                      CustomOutlineButton(
                        title: "Name Descending",
                        onPressed: () {
                          _bloc.order.add("-name");

                          scrollController.jumpTo(
                              scrollController.position.minScrollExtent);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                FittedBox(
                  child: Row(
                    children: <Widget>[
                      CustomOutlineButton(
                        title: "Modified Before",
                        onPressed: () {
                          _bloc.order.add("modified");
                          scrollController.jumpTo(
                              scrollController.position.minScrollExtent);
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width: 10),
                      CustomOutlineButton(
                        title: "Modified Recently",
                        onPressed: () {
                          _bloc.order.add("-modified");
                          scrollController.jumpTo(
                              scrollController.position.minScrollExtent);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  );
}

class CustomOutlineButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  const CustomOutlineButton({
    Key key,
    @required this.title,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      splashColor: Theme.of(context).primaryColor,
      highlightedBorderColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18))),
      borderSide: BorderSide(color: Colors.white),
      child: Text(
        title,
        style: kHeadlineWhite,
      ),
      onPressed: onPressed,
    );
  }
}
