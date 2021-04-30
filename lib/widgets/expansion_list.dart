import 'package:flutter/material.dart';

class ExpansionList extends StatefulWidget {
  ExpansionList({
    Key key,
    @required this.buildTitles,
    @required this.buildSubList,
    this.onExpanded,
    this.onCollapsed,
  }) : super(key: key);

  final Future<List<Widget>> Function() buildTitles;
  final Future<List<Widget>> Function(int) buildSubList;
  final void Function(int) onExpanded;
  final void Function(int) onCollapsed;

  @override
  _ExpandableListState createState() => _ExpandableListState();
}

class _ExpandableListState extends State<ExpansionList> {
  Widget _buildTile(Widget title, int i) {
    return new ExpansionTile(
      title: title,
      children: <Widget>[
        FutureBuilder(
          future: widget.buildSubList(i),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              var subList = snapshot.data;
              return new Column(
                children: subList,
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Please check your internet connection'),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: CircularProgressIndicator(),
                      height: 60.0,
                      width: 60.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Fetching bus stop list...'),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ],
      onExpansionChanged: (b) {
        if (b && widget.onExpanded != null) {
          widget.onExpanded(i);
        } else if (!b && widget.onCollapsed != null) {
          widget.onCollapsed(i);
        }
      },
    );
  }

  Widget _buildList() {
    return FutureBuilder(
      future: widget.buildTitles(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          var titles = snapshot.data;
          var length = titles.length > 0 ? titles.length * 2 - 1 : 0;
          print('Length of the list is ' + length.toString());
          return ListView.builder(
            padding: EdgeInsets.all(18.0),
            itemCount: length,
            itemBuilder: (context, i) {
              if (i.isOdd) return Divider();
              final index = i ~/ 2;
              return _buildTile(titles[index], index);
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Please check your internet connection'),
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: CircularProgressIndicator(),
                  height: 60.0,
                  width: 60.0,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Fetching bus stop list...'),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildList();
  }
}
