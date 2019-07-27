import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final bool cover;

  const LoadingContainer({Key key, this.isLoading, this.cover, this.child}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
