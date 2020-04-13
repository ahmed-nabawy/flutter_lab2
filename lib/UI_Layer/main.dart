import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlab2/BLOC_Layer/movieBloc.dart';
import 'package:flutterlab2/Model/movie.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
//  MovieBLOC bloc = MovieBLOC().getAll();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Movie List',
            style: TextStyle(
              color: Colors.black,
              fontStyle: FontStyle.italic,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: MovieList(),
      ),
    );
  }
}

class MovieList extends StatefulWidget {
  final MovieBLOC bloc = MovieBLOC();

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.bloc.getAll(),
        builder: (_, AsyncSnapshot<List<MoviePOJO>> list) {
          if (list.hasData) {
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: list.data.length,
              itemBuilder: (BuildContext _context, int i) {
                return MovieRow(list.data[i]);
              },
            );
          } else if (list.hasError) {
            return Center(
              child: Text(
                'error',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}

class MovieRow extends StatelessWidget {
  MoviePOJO m;
  MovieRow(this.m);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
//          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: NetworkImage(m.image),
                fit: BoxFit.fill,
                height: 90,
                width: 60,
              ),
            ),
            Column(
//              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  m.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Released on : ${m.releaseYear}',
                ),
                Container(
                  height: 30,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: m.genre.length,
                    itemBuilder: (BuildContext _context, int i) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          padding: const EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black26
                            ),
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(10),
                              right: Radius.circular(10),
                          ),
                        ),
                          child: Text(
                            m.genre[i],
                            style: TextStyle(
                              color: Colors.black26
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                IconStatefulWidget(),
              ],
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}

class IconStatefulWidget extends StatefulWidget {

  @override
  _IconStatefulWidgetState createState() => _IconStatefulWidgetState();
}

class _IconStatefulWidgetState extends State<IconStatefulWidget> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(
        liked ? Icons.favorite : Icons.favorite_border,
        color: liked ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          liked = !liked;
        });
      },
    );
  }
}
