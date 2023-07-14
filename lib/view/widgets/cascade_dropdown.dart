// import 'package:flutter/material.dart';
//
// import '../../models/country.dart';
//
// class CascadingDropdowns extends StatefulWidget {
//   const CascadingDropdowns({Key? key}) : super(key: key);
//
//   @override
//   _CascadingDropdownsState createState() => _CascadingDropdownsState();
// }
//
// class _CascadingDropdownsState extends State<CascadingDropdowns> {
//   late List<Country> _countries;
//   late Country _selectedCountry;
//   late City _selectedCity;
//   late Directory _selectedDirectory;
//
//   @override
//   void initState() {
//     super.initState();
//     _countries = [      Country(1, name: 'اليمن', cities: [        City(1, name: 'صنعاء', directorates: [          Directory(1, name: 'الامانه '),Directory(2, name: 'السبعين '),        ]),
//       City(2, name: 'City 1.2', directorates: [
//         Directory(3, name: 'Directory 1.2.1'),
//         Directory(4, name: 'Directory 1.2.2'),
//       ]),
//     ]),
//       Country(2, name: 'Country 2', cities: [
//         City(3, name: 'City 2.1', directorates: [
//           Directory(5, name: 'Directory 2.1.1'),
//           Directory(6, name: 'Directory 2.1.2'),
//         ]),
//         City(4, name: 'City 2.2', directorates: [
//           Directory(7, name: 'Directory 2.2.1'),
//           Directory(8, name: 'Directory 2.2.2'),
//         ]),
//       ]),
//     ];
//     _selectedCountry = _countries[0];
//     _selectedCity = _selectedCountry.cities[0];
//     _selectedDirectory = _selectedCity.directorates[0];
//   }
//
//   void _onCountryChanged(Country? country) {
//     setState(() {
//       _selectedCountry = country!;
//       _selectedCity = _selectedCountry.cities[0];
//       _selectedDirectory = _selectedCity.directorates[0];
//     });
//   }
//
//   void _onCityChanged(City? city) {
//     setState(() {
//       _selectedCity = city!;
//       _selectedDirectory = _selectedCity.directorates[0];
//     });
//   }
//
//   void _onDirectoryChanged(Directory? directory) {
//     setState(() {
//       _selectedDirectory = directory!;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           margin: const EdgeInsets.symmetric(horizontal: 10),
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(
//               color: Colors.black,
//               width: 1,
//             ),
//           ),
//           child: DropdownButton<Country>(
//             value: _selectedCountry,
//             onChanged: _onCountryChanged,
//             isExpanded: true,
//             underline: const SizedBox(),
//             items: _countries
//                 .map((country) => DropdownMenuItem<Country>(
//               alignment: Alignment.centerRight,
//               value: country,
//               child: Text(country.name),
//             ))
//                 .toList(),
//           ),
//         ),
//         const SizedBox(height: 10,),
//         Row(
//           children: [
//             const SizedBox(width: 10,),
//             Expanded(
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(
//                     color: Colors.black,
//                     width: 1,
//                   ),
//                 ),
//                 child: DropdownButton<City>(
//
//                   value: _selectedCity,
//                   onChanged: _onCityChanged,
//                   items: _selectedCountry.cities
//                       .map((city) => DropdownMenuItem<City>(
//                     alignment: Alignment.centerRight,
//                     value: city,
//                     child: Text(city.name),
//                   ))
//                       .toList(),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 10,),
//             Expanded(
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(
//                     color: Colors.black,
//                     width: 1,
//                   ),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(right:0,left: 0),
//                   child: DropdownButton<Directory>(
//                     isExpanded: true,
//                     value: _selectedDirectory,
//                     onChanged: _onDirectoryChanged,
//                     items: _selectedCity.directorates
//                         .map((directory) => DropdownMenuItem<Directory>(
//                       alignment: Alignment.centerRight,
//                       value: directory,
//                       child: Expanded(child: Text(directory.name,overflow: TextOverflow.fade,)),
//                     ))
//                         .toList(),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 10,),
//
//           ],
//         ),
//
//       ],
//     );
//   }
// }
