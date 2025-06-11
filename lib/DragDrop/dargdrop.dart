import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Dragdrop extends StatefulWidget {
  const Dragdrop({super.key});

  @override
  State<Dragdrop> createState() => _DragdropState();
}

class _DragdropState extends State<Dragdrop> {
  DateTime? _selectedDateString;
  String? _selectedGalleryType;

  final List<String> _galleryTypes = ["Recent", "Favorites"];

  final DateFormat _format = DateFormat("dd MMM, yyyy");
  final DateFormat _monthFormat = DateFormat.E();
  Map<String, Object?> dateToImageMap = {};

  List<String> testImageUrls = [
    'https://img.bleacherreport.net/img/images/photos/003/882/208/hi-res-67ba2cd4215bff0d322be08e173488e7_crop_north.jpg?1598817098&w=3072&h=2048',
    'https://th.bing.com/th/id/OIP.kvY2Rs9tMj9bJHLO6sDlawHaFj?o=7rm=3&rs=1&pid=ImgDetMain',
    'https://th.bing.com/th/id/R.3da52cb206a110be6d3346061ec8df99?rik=35YokLFjpaUX7w&pid=ImgRaw&r=0',
    'https://th.bing.com/th/id/OIP.jZIRn6wrYQyD8WHskLPiSAHaFj?o=7rm=3&rs=1&pid=ImgDetMain',
    'https://th.bing.com/th/id/OIP.AR71xobKTiqZ00FrXi9CYgHaJQ?rs=1&pid=ImgDetMain',
    'https://th.bing.com/th/id/R.d2a2714b05731713ba01e7ae7523c3c2?rik=SfweQ%2fBUmzSqSQ&pid=ImgRaw&r=0',
    'https://th.bing.com/th/id/OIP.cPZDULEHSR-56KefLsjVDQHaEK?rs=1&pid=ImgDetMain',
    'https://th.bing.com/th/id/OIP.rhsoj7qP1HJA3NJmUpNe6gHaEK?o=7rm=3&rs=1&pid=ImgDetMain',
    'https://th.bing.com/th/id/OIP.AVmaXVyxMY6WrAP30hd1dQHaE8?rs=1&pid=ImgDetMain',
  ];

  void _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDateString,
      firstDate: DateTime(2020, 1, 1),
      lastDate: DateTime(2030, 12, 31),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogBackgroundColor: Colors.white,
            colorScheme: const ColorScheme.light(
              primary: Colors.deepPurple,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDateString) {
      setState(() {
        _selectedDateString = picked;
      });
    }
  }

  DateTime getStartOfWeek(DateTime date) =>
      date.subtract(Duration(days: date.weekday % 7));

  List<DateTime> getCurrentWeekDates(DateTime selectedDate) {
    final startOfWeek = getStartOfWeek(selectedDate);
    return List.generate(7, (i) => startOfWeek.add(Duration(days: i)));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDateString ??= DateTime.now();
    _selectedGalleryType ??= _galleryTypes[0];
  }

  @override
  Widget build(BuildContext context) {
    final weekDates = getCurrentWeekDates(_selectedDateString!);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 42,
                    backgroundImage: NetworkImage(
                        "https://cdn.britannica.com/92/163892-050-420A2632/Andres-Iniesta-Spanish.jpg"),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good Morning James',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w900),
                      ),
                      Text('Today weather is a bit hot',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 124, 124, 124))),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('20°',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 124, 124, 124))),
                      Image.network(
                        "https://th.bing.com/th/id/OIP.hR3QF6CnwZyzaSx7prPCXgHaHa?w=189&h=189&c=7&r=0&o=7&pid=1.7&rm=3",
                        width: 35,
                        height: 35,
                      )
                    ],
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              //Whole Box Container
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                      195, 178, 131, 146), // Background color
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
                child: Column(
                  children: [
                    //Top Part
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.calendar_month_outlined),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: _pickDate,
                                child: Row(
                                  children: [
                                    Text(
                                      _format.format(_selectedDateString!),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(Icons.arrow_drop_down)
                                  ],
                                ),
                              ),
                              const Spacer(),
                              const Text("Weekly",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(Icons.menu)
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: weekDates.map((date) {
                                bool isSelected = date.year ==
                                        _selectedDateString!.year &&
                                    date.month == _selectedDateString!.month &&
                                    date.day == _selectedDateString!.day;

                                return Column(
                                  children: [
                                    Text(_monthFormat
                                        .format(date)
                                        .substring(0, 1)),
                                    const SizedBox(height: 4),
                                    Container(
                                        margin:
                                            const EdgeInsets.symmetric(horizontal: 2),
                                        width: 40,
                                        height: 72,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Colors.white,
                                            boxShadow: isSelected
                                                ? [
                                                    const BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 234, 45, 45),
                                                      blurRadius: 4,
                                                      offset: Offset(0, 1),
                                                    )
                                                  ]
                                                : null),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              "${date.day}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            DragTarget(
                                                onAcceptWithDetails: (details) {
                                              setState(() {
                                                dateToImageMap[
                                                        _format.format(date)] =
                                                    details.data;
                                              });
                                            }, builder: (context, candidateData,
                                                    rejectedData) {

                                              final dateKey = _format.format(date);
                                              return CircleAvatar(
                                                radius: 16,
                                                backgroundColor: const Color.fromARGB(
                                                    255, 89, 88, 88),
                                                    backgroundImage: dateToImageMap[dateKey] !=
                                                        null
                                                    ? NetworkImage(dateToImageMap[dateKey].toString()):null,
                                                child: dateToImageMap[dateKey] !=
                                                        null
                                                    ? null
                                                    : const Icon(Icons.image,
                                                        color: Color.fromARGB(
                                                            202,
                                                            207,
                                                            205,
                                                            205)),
                                              );
                                            }),
                                          ],
                                        )),
                                  ],
                                );
                              }).toList()),
                        ],
                      ),
                    ),

                    /// Bottom Text
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(20)),
                          color: const Color.fromARGB(232, 190, 136, 153)
                              .withOpacity(0.8)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        child: Row(
                          children: [
                            Icon(Icons.ads_click),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "Drag and drop multiple outfit to the specific date",
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              //Drap Image Section
              Row(
                children: [
                  const Text(
                    "Gallery",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.upload_rounded)),
                  DropdownButton<String>(
                      value: _selectedGalleryType,
                      items: _galleryTypes
                          .map((item) => DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              ))
                          .toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedGalleryType = value;
                        });
                      })
                ],
              ),

              //Images
              Expanded(
                child: GridView.builder(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    itemCount: testImageUrls.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 1),
                    itemBuilder: (context, index) {
                      final img = testImageUrls[index];
                      return Draggable(
                          data: img,
                          feedback: Opacity(
                            opacity: 0.7,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                img,
                                fit: BoxFit.cover,
                                height: 100,
                                width: 100,
                              ),
                            ),
                          ),
                          childWhenDragging: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(163, 158, 158, 158),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              img,
                              fit: BoxFit.cover,
                            ),
                          ));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
