import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moatamrk/business_logic/events_cubit/events_cubit.dart';
import 'package:moatamrk/business_logic/instructors_cubit/instructors_cubit.dart';
import 'package:moatamrk/constant/colors.dart';
import 'package:moatamrk/data/models/all_insturctorsModel.dart';
import 'package:moatamrk/data/models/events_model.dart';
import 'package:moatamrk/ui/instructor_details.dart';
import 'package:moatamrk/ui/main_widgets/main_drawer.dart';
import 'package:moatamrk/ui/profile_screen.dart';
import 'package:moatamrk/ui/speaker_screen.dart';
import 'package:moatamrk/ui/speakers_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<EventsModel> events = [];
  List<AllInstructorsModel> instructors = [];

  ImageProvider _image = AssetImage('assets/images/splash_logo.png');

  List<Map<String, dynamic>> eventList = [
    {
      'title': 'Database',
      'image': 'assets/images/database.png',
      'date': DateTime.now(),
      'time': '10:00 - 11:00',
      'location': 'Hall 1H',
    },
    {
      'title': 'Network & Security',
      'image': 'assets/images/network.png',
      'date': DateTime.now(),
      'time': '10:00 - 11:00',
      'location': 'Hall 2H',
    },
    {
      'title': 'Operating System',
      'image': 'assets/images/operating.png',
      'date': DateTime.now(),
      'time': '10:00 - 11:00',
      'location': 'Hall 3H',
    },
    {
      'title': 'Programming',
      'image': 'assets/images/programming.png',
      'date': DateTime.now(),
      'time': '10:00 - 11:00',
      'location': 'Hall 4H',
    },
  ];

  List<Map<String, dynamic>> eventDoctors = [
    {
      'name': 'Dr. Negm Eldeen',
      'image': 'assets/images/doc1.png',
      'section': 'Operating System',
    },
    {
      'name': 'Dr. Amr ELmaghraby',
      'image': 'assets/images/doc2.png',
      'section': 'Database',
    },
    {
      'name': 'Dr. Emad ELdeen',
      'image': 'assets/images/doc4.png',
      'section': 'Network&secuirty',
    },
    {
      'name': 'Dr. Mahmoud Rehan',
      'image': 'assets/images/doc3.png',
      'section': 'Programming',
    },
    {
      'name': 'Dr. Eman Wadea',
      'image': 'assets/images/splash_logo.png',
      'section': 'Management',
    },
  ];
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    context.read<EventsCubit>().getAllEvents();
    context.read<InstructorsCubit>().getAllInstructors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              },
              icon: ImageIcon(
                AssetImage('assets/images/user.png'),
                color: mainBgCrl,
                size: 40,
              )),
          const SizedBox(
            width: 10.0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 100,
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: mainBgCrl, width: 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sessions',
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Poppins',
                          fontSize: 25),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildHallItem('Hall 1H'),
                        buildHallItem('Hall 2H'),
                        buildHallItem('Hall 3H'),
                        buildHallItem('Hall 4H'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocConsumer<EventsCubit, EventsState>(listener: (context, state) {
              if (state is EventsLoaded) {
                events.clear();
                state.eventsModel.forEach((element) {
                  events.add(element);
                });

                setState(() {});
              }
            }, builder: (context, state) {
              if (state is EventsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is EventsLoaded) {
                return Container(
                  height: 170,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 7,
                    ),
                    itemCount: events.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SpeakerScreen(
                              image: 'assets/images/splash_logo.png',
                              speakerName: events[index].title!,
                              speakerBio: events[index].subject!,
                            ),
                          ),
                        );
                      },
                      child: buildEventsItem(
                        eventList[index]['image'],
                        context,
                        events[index].title,
                        events[index].startDate.toString(),
                        events[index].hall,
                      ),
                    ),
                  ),
                );
              }
              return Container();
            }),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 204,
              padding: EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'New Events',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Image.asset('assets/images/event.png'),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: 220,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          children: [
                            Text(
                              DateFormat.yMMMd().format(selectedDate),
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                            const Text(
                              'Management',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            const Text(
                              'Hall 4H',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 209,
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Speakers',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SpeakersScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'View All',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocConsumer<InstructorsCubit, InstructorsState>(
                    listener: (context, state) {
                      if (state is InstructorsLoaded) {
                        state.instructors.forEach((element) {
                          instructors.add(element);
                        });
                        setState(() {});
                      }
                    },
                    builder: (context, state) {
                      return Container(
                        padding: EdgeInsets.all(15),
                        height: 150,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 7,
                          ),
                          itemCount: instructors.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InstructorDetails(
                                      model: instructors[index]),
                                ),
                              );
                            },
                            child: buildDocItem(
                              instructors[index].img,
                              instructors[index].fullName,
                              instructors[index].specialization,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: MainDrawer(),
    );
  }

  Card buildHallItem(String? title) {
    return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        color: mainBgCrl,
        child: Container(
          padding: EdgeInsets.all(5),
          child: Text(
            title!,
            style: TextStyle(color: white),
          ),
        ));
  }

  Widget buildEventsItem(String? image, BuildContext ctx, String? eventTitle,
          String? eventTime, String? eventLocation) =>
      Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: 100,
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(image!, fit: BoxFit.cover),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 10,
                child: Container(
                  width: 30,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat.d().format(selectedDate),
                        style: TextStyle(
                            color: mainBgCrl,
                            fontSize: 12,
                            fontFamily: 'Poppins'),
                      ),
                      Text(
                        DateFormat.MMM().format(selectedDate),
                        style: TextStyle(
                            color: mainBgCrl,
                            fontSize: 12,
                            fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            Text(
              eventTitle!,
              style: const TextStyle(fontSize: 17),
            ),
            Text(
              eventTime!,
              style: const TextStyle(fontSize: 12),
            ),
            Text(
              eventLocation!,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ],
        ),
      );

  Widget buildDocItem(
    String? imageUrl,
    String? userName,
    String? description,
  ) =>
      SizedBox(
        width: 220,
        child: Row(
          children: [
            Stack(alignment: AlignmentDirectional.bottomEnd, children: [
              ClipRect(
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: _image,
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
              ),
            ]),
            const SizedBox(
              width: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  userName!,
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                ),
                Text(
                  description!,
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                )
              ],
            ),
          ],
        ),
      );
}
