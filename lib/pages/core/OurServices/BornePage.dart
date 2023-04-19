import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../util/Colores.dart';
class Borne {
  final String name;
  final String city;
  final double rating;
  final String phoneNumber ;
  bool isFavorite;

  Borne({
    required this.name,
    required this.city,
    required this.rating,
    required this.phoneNumber,
    this.isFavorite = false,
  });
}

List<Borne> bornes = [
  Borne(
    name: 'John Doe',
    city: 'New York',
    rating: 4.2,
    phoneNumber: "2222",

  ),
  Borne(
    name: 'Jane Smith',
    city: 'Los Angeles',
    rating:5.3,
    phoneNumber: "2222",

  ),
  Borne(
    name: 'Bob Johnson',
    city: 'Chicago',
    rating: 2.0,
    phoneNumber: "2222",

  ),
  Borne(
    name: 'Alice Williams',
    city: 'Houston',
    rating: 4.1,
    phoneNumber: "2222",

  ),
];


class BornePg extends StatefulWidget {


  @override
  _BornePgState createState() => _BornePgState();
}

class _BornePgState extends State<BornePg> {

  List<Borne> filteredBornes = bornes;
  void _filterMechanics(String query) {
    setState(() {
      filteredBornes = bornes
          .where((borne) =>
          borne.name.toLowerCase().contains(query.toLowerCase()))
          .toList()  ;
    });
  }

  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
        backgroundColor: AppColors.greyW,
        appBar: AppBar(
          title: const Text('SOS'),
          backgroundColor: AppColors.blueG ,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )
          ),
        ),
        body:
        SafeArea(
          child: Expanded(
            child: Column(

              children: [
                Padding(
                  padding: const EdgeInsets.only(left:10,right: 10,top: 6, ),
                  child: TextField(


                    onChanged: (value) => _filterMechanics(value),
                    decoration: InputDecoration(
                      suffixIcon: const Icon( Icons.search_rounded ,
                          color:AppColors.blueG ) ,
                      labelText: 'Search SOS',
                      border:OutlineInputBorder(  borderRadius: BorderRadius.circular(10)),

                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left:10,right: 10,top: 6, ),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: filteredBornes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            const  SizedBox(height:10 ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.blanc,
                              ),
                              child: Row(
                                children: [
                                  Column(
                                      children: [

                                        Container(
                                          width: 90,
                                          height: 90,
                                          decoration:const BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                offset: Offset(1, 3),
                                                blurRadius: 19,
                                              ),
                                            ],
                                            borderRadius: BorderRadius.only(topLeft:Radius.circular(10), ),
                                            image:  DecorationImage(
                                              image: AssetImage('assets/images/mec1.jpg'),
                                              fit: BoxFit.cover,


                                            ),
                                          ),

                                        ),

                                        Container(
                                          width: 90,
                                          decoration:const BoxDecoration(
                                            boxShadow: [  BoxShadow(
                                              color: Colors.grey,
                                              offset: Offset(1, 3),
                                              blurRadius: 19,
                                            ),
                                            ],
                                            color: Color(0xFFD3E0EA),
                                            borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10), ),),
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                const Icon(Icons.star, color: Colors.amber),
                                                Center(
                                                  child: Text(
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                    filteredBornes[index].rating.toString(),
                                                  ),
                                                ),
                                              ]
                                          ),
                                        ),
                                      ]
                                  ),



                                  const  SizedBox(width: 16),
                                  Expanded(
                                    child: ListTile(
                                      onTap: () {

                                      },
                                      title: Text(filteredBornes[index].name),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(filteredBornes[index].city),
                                          RatingBar.builder(
                                            initialRating: filteredBornes[index].rating,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            itemCount: 5,
                                            allowHalfRating : true,
                                            glowColor : AppColors.blueG,
                                            itemPadding:
                                            const EdgeInsets.symmetric(horizontal: 2.0),
                                            itemBuilder: (context, _) => const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              shadows: [
                                                Shadow(
                                                  color: Colors.black,
                                                  blurRadius: 3,
                                                  offset: Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            onRatingUpdate: (rating) {},
                                          ),
                                        ],
                                      ),
                                      trailing:
                                      IconButton(
                                        icon: Icon(
                                          Icons.favorite,
                                          color: filteredBornes[index].isFavorite ? Colors.red : Colors.grey,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            filteredBornes[index].isFavorite =
                                            !filteredBornes[index].isFavorite;
                                          });
                                        },
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),

                  ),
                ),


              ],

            ),
          ),
        ),
      );

  }
}
