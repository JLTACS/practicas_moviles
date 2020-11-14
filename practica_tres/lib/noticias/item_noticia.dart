import 'package:flutter/material.dart';
import 'package:noticias/models/noticia.dart';

class ItemNoticia extends StatelessWidget {
  final Noticia noticia;
  ItemNoticia({Key key, @required this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            child: Row(children: [
            Expanded(
                flex: 1,
                child: noticia.urlToImage != null ? 
                  Image.network(
                  "${noticia.urlToImage}",
                  height: 100,
                  fit: BoxFit.cover
                ) : 
                  Image.asset('assets/notImage.png',
                    height: 100,
                    fit: BoxFit.cover
                  )
            ),
            Expanded(
                flex: 3,
                child: Padding(
                  padding:  EdgeInsets.all(12.0),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("${noticia.title}", 
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
                    ),
                    Text("${noticia.publishedAt},", 
                      style: TextStyle(fontWeight: FontWeight.w200, fontSize: 12, color: Colors.grey)
                    ),
                    SizedBox(height: 16,),
                    Text("${noticia.description?? "Descripción no disponible"}", 
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 16,),
                    Text("${noticia.author?? "Autor no disponible"}", 
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12)
                    )
              ],),
                ),
            )
          ],),),
        ),
    );
  }
}