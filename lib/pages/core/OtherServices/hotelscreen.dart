import 'package:flutter/material.dart';
import '../../../util/Colores.dart';

class Hotel {
  final String name;
  final String location;
  final String number;
  final String image;
  final String state;

  Hotel({required this.name, required this.location, required this.number, required this.image, required this.state});
}

class HotelListView extends StatefulWidget {
  const HotelListView({Key? key}) : super(key: key);

  @override
  _HotelListViewState createState() => _HotelListViewState();
}

class _HotelListViewState extends State<HotelListView> {
  final List<Hotel> hotels = [
    Hotel(
      name: 'Hotel A',
      location: '123 Main Street',
      number: '555-555-1234',
      image: 'assets/images/mec1.jpg',
      state: 'Tunis',
    ),
    Hotel(
      name: 'Hotel B',
      location: '456 Park Avenue',
      number: '555-555-5678',
      image: 'assets/images/mec1.jpg',
      state: 'Sfax',
    ),
    Hotel(
      name: 'Hotel C',
      location: '789 Broadway',
      number: '555-555-9012',
      image: 'assets/images/mec1.jpg',
      state: 'Sousse',
    ),
  ];

  String _selectedState = 'TOUS';
  String _searchString = '';

  List<Hotel> get _selectedHotels {
    var filteredHotels = hotels;

    if (_selectedState != 'TOUS') {
      filteredHotels = filteredHotels.where((hotel) => hotel.state == _selectedState).toList();
    }

    if (_searchString.isNotEmpty) {
      filteredHotels = filteredHotels.where((hotel) => hotel.name.toLowerCase().contains(_searchString.toLowerCase())).toList();
    }

    return filteredHotels;
  }

  @override
  Widget build(BuildContext context) {
    final List<String> states = ['TOUS', 'Tunis', 'Sfax', 'Sousse'];

    return Scaffold(
      backgroundColor: AppColors.greyW,
      appBar: AppBar(

        title:Container(
          decoration: BoxDecoration(
            color:AppColors.blueG,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child:TextField(
            decoration: InputDecoration(
              hintText: 'Search hotels by name',
              prefixIcon: Icon(Icons.search_rounded, color: Colors.white,),
              hintStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            style: TextStyle(color: Colors.white),
            onChanged: (value) {
              setState(() {
                _searchString = value;
              });
            },
          ),

        ),
        backgroundColor: AppColors.blueG ,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:10,right: 10,top: 6, ),
        child: Column(
          children: [
            const  SizedBox(height:10 ),
            DropdownButtonFormField(
              value: _selectedState,
              items: states.map((String state) {
                return DropdownMenuItem<String>(
                  value: state,
                  child: Text(state),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  _selectedState = value!;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),

              ),
            ),

            Expanded(

                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: _selectedHotels.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        SizedBox(height:10 ),
                        Container(

                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:Colors.white
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 90,
                                height: 100,
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(1, 3),
                                      blurRadius: 19,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.only(topLeft:Radius.circular(10),bottomLeft:Radius.circular(10) ),

                                  image: DecorationImage(
                                    image: AssetImage(_selectedHotels[index].image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text(_selectedHotels[index].name),

                                  subtitle: Text('${_selectedHotels[index].location} | ${_selectedHotels[index].state} | ${_selectedHotels[index].number}'),
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


          ],
        ),
      ),
    );
  }
}


