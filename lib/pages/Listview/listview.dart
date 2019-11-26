import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../material/listView/listView.dart';

class PageListview extends StatefulWidget {
  @override
  _PageListviewState createState() => _PageListviewState();
}

class _PageListviewState extends State<PageListview> {
  int i = 16;
  List<Widget> items;
  String footerContent = '';
  @override
  void initState() {
    super.initState();
    i = 16;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listview'),
        ),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Listview(
              itemCount: i,
              renderRow: (int index) {
                List<Widget> _contents = [];
                for (int j = 0; j < 5; j++) {
                  _contents.add(Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 5.0),
                              child: Text(
                                'Eat the week',
                                style: TextStyle(
                                    color: Color(0xff888888), fontSize: 18.0),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 60.0,
                                    height: 60.0,
                                    child: Image.network(
                                        'https://zos.alipayobjects.com/rmsportal/hfVtzEhPzTUewPm.png'),
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text('不是所有的兼职'),
                                      Text('35')
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      j == 4
                          ? Center()
                          : Container(
                              height: 8.0,
                              decoration: BoxDecoration(
                                  color: Color(0xfff5f5f9),
                                  border: Border(
                                      top: BorderSide(color: Color(0xffececed)),
                                      bottom: BorderSide(
                                          color: Color(0xffececed)))),
                            )
                    ],
                  ));
                }

                return Column(
                  children: _contents,
                );
              },
              stickyHeader: true,
              sectionHeader: (int index) {
                return Text('Task $index');
              },
              listviewHeader: Text('header'),
              listviewFooter: Text(footerContent),
              onEndReachedThreshold: 500,
              onEndReached: () {
                if (this.mounted) {
                  setState(() {
                    this.footerContent = 'loading...';
                  });
                  return Future.delayed(Duration(milliseconds: 1000), () {
                    setState(() {
                      this.footerContent = 'loaded successfully!';
                      i = i + 10;
                    });
                  });
                }
              },
            ),
          ),
        ));
  }
}
