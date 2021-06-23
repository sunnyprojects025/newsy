import 'package:flutter/material.dart';
import 'package:newsy/provider/detailsProvider.dart';
import 'package:newsy/screens/webAtricleview_screen.dart';
import 'package:provider/provider.dart';

class Everything extends StatefulWidget {
  @override
  _EverythingState createState() => _EverythingState();
}

class _EverythingState extends State<Everything> {
  var _isLoading = true;
  List _searchResult = [];

  String query = '';
  List details = [];
  getdetails() async {
     setState(() {
      _isLoading=true;
    });
    await Provider.of<Detailsprovider>(context, listen: false).everyDetails();
    details = Provider.of<Detailsprovider>(context, listen: false).everydetails;
    print(details);
    setState(() {
      _isLoading = false;
    });
  }

  TextEditingController controller = new TextEditingController();

  void setResults(String query) {
    _searchResult = details
        .where((elem) =>
            elem['title']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            elem['description']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            elem['author']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            elem['publishedAt']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
        .toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdetails();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: _isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : details.length==0?Center(child: Text('No Article Posted Yet'),): Column(children: [
                Container(
                  margin: EdgeInsets.only(
                      top: deviceSize.height / 4 / 4 / 2,
                      left: deviceSize.width / 4 / 4,
                      right: deviceSize.width / 4 / 4),
                  width: double.infinity,
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                        hintText: 'Search Any',
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        )),
                    onChanged: (v) {
                      setState(() {
                        query = v;
                        setResults(query);
                      });
                    },
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                SizedBox(height: deviceSize.height/4/4/2,),
                query.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                            // shrinkWrap: true,
                            itemCount: _searchResult.length,
                            itemBuilder: (ctx, index) {
                              return Card(
                                margin: EdgeInsets.all(8),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                elevation: 2,
                                child: Column(children: [
                                  Container(
                                      width: deviceSize.width,
                                      margin: EdgeInsets.only(
                                          left: deviceSize.width / 4 / 4,
                                          right: deviceSize.width / 4 / 4),
                                      child: Text(
                                        _searchResult[index]['content'],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      )),
                                  ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            _searchResult[index]['urlToImage']),
                                      ),
                                      title: Text(
                                        _searchResult[index]['description'],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      subtitle: Text(
                                        _searchResult[index]['content'],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400),
                                      ),
                                      trailing: GestureDetector(
                                        child: Container(
                                            padding: EdgeInsets.all(8),
                                            margin: EdgeInsets.only(
                                                right: deviceSize.width /
                                                    4 /
                                                    4 /
                                                    3),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.green[500]),
                                            child: Text(
                                              'View More',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            )),
                                              onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (ctx) {
                                            return WebViewArticleScreen(
                                              title: _searchResult[index]
                                                  ['title'],
                                              url: _searchResult[index]['url'],
                                            );
                                          }));
                                        },
                                      ))
                                ]),
                              );
                            }),
                      )
                    : Expanded(
                        child: ListView.builder(
                            //shrinkWrap: true,
                            itemCount: details.length,
                            itemBuilder: (ctx, index) {
                              return Card(
                                margin: EdgeInsets.all(8),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                elevation: 2,
                                child: Column(children: [
                                  Container(
                                      width: deviceSize.width,
                                      margin: EdgeInsets.only(
                                          left: deviceSize.width / 4 / 4,
                                          right: deviceSize.width / 4 / 4),
                                      child: Text(
                                        details[index]['content'],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      )),
                                  ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            details[index]['urlToImage']),
                                      ),
                                      title: Text(
                                        details[index]['description'],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      subtitle: Text(
                                        details[index]['content'],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400),
                                      ),
                                      trailing: GestureDetector(
                                        child: Container(
                                            padding: EdgeInsets.all(8),
                                            margin: EdgeInsets.only(
                                                right: deviceSize.width /
                                                    4 /
                                                    4 /
                                                    3),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.green[500]),
                                            child: Text(
                                              'View More',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            )),
                                              onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (ctx) {
                                            return WebViewArticleScreen(
                                              title: details[index]
                                                  ['title'],
                                              url: details[index]['url'],
                                            );
                                          }));
                                        },
                                      ))
                                ]),
                              );
                            }),
                      )
              ]));
  }
}
